import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scstw_lib/connection.dart';
import 'package:scstw_lib/progress.dart';
import 'package:scstw_lib/proto_out/Command.pb.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
import 'package:scstw_lib/util.dart';

import 'lane_timer.dart';

// Mixin to create Enum for bitflags uses.
mixin EnumFlag on Enum {
  // value receive a bitwise shift operation. It means "shift the bits of 1 to the left by index places". So,  "1,10,100,1000..." == 1,2,4,8,16....
  int get value => 1 << index;

  // Creates a operator "|" for enum.
  int operator |(other) => value | other.value;
}

// Extension "int" to verify that value contains the enum flag.
extension ExtensionFlag on int {
  bool has(EnumFlag enumFlag) => this & enumFlag.value == enumFlag.value;
}

enum RaceActions with EnumFlag {
  // Actions for the UIStateController
  READY,
  RESET,
  AT_YOUR_MARKS,
  MUTE,
}

enum LaneActions with EnumFlag { DISABLE_LANE, ENABLE_LANE, FALL }

class UILaneState {
  int laneIndex;
  LaneFullState? laneFullState;
  int availableLaneActions = 0;
  List<TextSpan> laneTextTime = [];
  String? laneSubtext = null;
  Color laneTextColor = Colors.red;


  void Function()? onDisableLanePressed = () {};
  void Function()? onFallPressed = () {};
  void Function()? onEnableLanePressed = () {};

  UILaneState({required this.laneIndex, this.laneFullState});

  @override
  toString() {
    return 'UILaneState(laneIndex: $laneIndex, laneFullState: $laneFullState, availableLaneActions: $availableLaneActions, laneTextTime: $laneTextTime, laneSubtext: $laneSubtext)';
  }
}

class UIState {
  Settings settings = Settings();
  RaceFullState_State raceState = RaceFullState_State.IDLE;
  List<UILaneState> laneStates = [];
  Duration? stopwatchDuration;
  double? autostartProgress;
  int availableRaceActions = 0;

  void Function()? onResetPressed = () {};
  void Function()? onReadyPressed = () {};
  void Function()? onAtYourMarksPressed = () {};
  void Function()? onMutePressed = () {};
}

class UIStateController {
  final logger = Logger();
  final BaseStationConnection _connection;
  UIState lastUIState = UIState();
  final LaneTimer _timer = LaneTimer();

  final Progress _progress = Progress();
  bool _raceAlreadySent = false;

  String? _version;

  get version {
    return _version;
  }

  final raceResultStreamController =
      StreamController<List<UILaneState>>.broadcast();

  Stream<List<UILaneState>> get raceResultsStream =>
      raceResultStreamController.stream;

  final StreamController<UIState> _uiStateController =
      StreamController<UIState>.broadcast();

  Stream<UIState> get uiStateStream => _uiStateController.stream;

  void _handleLaneStateChange(
    UILaneState uiLaneState,
    RaceFullState raceFullState,
  ) {
    switch (uiLaneState.laneFullState?.state) {
      case LaneFullState_State.IDLE_FOOT_DOWN:
        _timer.stop();
        lastUIState.stopwatchDuration = Duration(milliseconds: 0);
        _updateAllLaneTextTime();
        break;
      case LaneFullState_State.RUNNING_FOOT_DOWN:
        if (!_timer.isRunning) {
          _timer.start((elapsed) {
            lastUIState.stopwatchDuration = elapsed;
            _updateAllLaneTextTime();
          }, 100);
        }
        break;
      case LaneFullState_State.RUNNING:
        // if (!timer.isRunning) {
        //   timer.start((elapsed) {
        //     lastUIState.stopwatchDuration = elapsed;
        //     _uiStateController.add(lastUIState);
        //   }, 10);
        // }
        break;
      case LaneFullState_State.FINISHED:
      case LaneFullState_State.FINISHED_WINNER:
      case LaneFullState_State.FINISHED_TIE:
        if (raceFullState.laneStates.any(
          (laneState) =>
              laneState.state == LaneFullState_State.RUNNING ||
              laneState.state == LaneFullState_State.RUNNING_FOOT_DOWN,
        )) {
          // If there is still a lane running, we don't stop the timer
          return;
        } else {
          _timer.stop();
        }
        break;
      default:
        break;
    }
  }

  void _updateAllLaneTextTime() {
    for (var laneState in lastUIState.laneStates) {
      if (laneState.laneFullState?.state != LaneFullState_State.FINISHED &&
          laneState.laneFullState?.state !=
              LaneFullState_State.FINISHED_WINNER &&
          laneState.laneFullState?.state != LaneFullState_State.FINISHED_TIE) {
        laneState.laneTextTime = _createLaneTextWithTime(
          laneState.laneFullState!,
          lastUIState.stopwatchDuration,
        );
      }
    }
    _uiStateController.add(lastUIState);
  }

  void _handleAutostartProgress(
    RaceFullState raceFullState,
    Settings settings,
  ) {
    var standstillDurationBeforeStart =
        _version == "1.0.0"
            ? settings
                .stopwatchSettings
                .trainingClassicRaceMode
                .startProcedure
                .automatedStartProcedure
                .standstillDurationBeforeStart
            : settings
                .race // ignore: deprecated_member_use_from_same_package
                .startProcedure
                .automatedStartProcedureSettings
                .standstillDurationBeforeReady;
    _progress.stateUpdate(
      raceFullState,
      standstillDurationBeforeStart.toDouble(),
      (progress) {
        lastUIState.autostartProgress = progress;
        _uiStateController.add(lastUIState);
      },
    );
  }


  void _computeAvailableRaceActions(
    RaceFullState raceFullState,
    Settings settings,
  ) {
    int availableActions = 0;
    if ([
      RaceFullState_State.IDLE,
      RaceFullState_State.IDLE_CLEAR_TO_START,
    ].contains(raceFullState.state)) {
      availableActions |= RaceActions.READY.value;
    } else {
      availableActions |= RaceActions.RESET.value;
    }

    if (_version == "1.1.0" &&
        (raceFullState.state == RaceFullState_State.IDLE ||
            raceFullState.state == RaceFullState_State.FINISHED &&
                raceFullState.laneStates.any(
                  (laneState) => [
                    LaneFullState_State.FALSE_START,
                    LaneFullState_State.FALSE_START_TIE,
                  ].contains(laneState.state),
                ))) {
      if (raceFullState.state == RaceFullState_State.IDLE) {
        availableActions |= RaceActions.AT_YOUR_MARKS.value;
      } else {
        availableActions |= RaceActions.MUTE.value;
      }
    }
    lastUIState.availableRaceActions = availableActions;
  }

  void _computeOnPressedFunctions(
    RaceFullState raceFullState,
    Settings settings,
    int availableActions,
  ) {
    lastUIState.onResetPressed =
        !(([
                  RaceFullState_State.FINISHED,
                  RaceFullState_State.FINISHED_MUTED,
                ]).contains(raceFullState.state) ||
                (raceFullState.state == RaceFullState_State.RUNNING &&
                    settings.stopwatchSettings.hasTrainingClassicRaceMode()))
            ? null
            : () {
              _connection.sendCommand(Command(reset: RaceResetCommand()));
            };

    lastUIState.onReadyPressed =
        !((RaceFullState_State.IDLE_CLEAR_TO_START == raceFullState.state) ||
                (raceFullState.state == RaceFullState_State.IDLE &&
                    settings.stopwatchSettings.hasCompetitionClassicRaceMode()))
            ? null
            : () {
              _connection.sendCommand(Command(start: RaceStartCommand()));
            };

    lastUIState.onAtYourMarksPressed = () {
      _connection.sendCommand(Command(sayAtYourMarks: SayAtYourMarksCommand()));
      lastUIState.onAtYourMarksPressed =
          null; // Disable the button after pressing
      _uiStateController.add(lastUIState);
      Future.delayed(Duration(milliseconds: 1100), () {
        _computeOnPressedFunctions(raceFullState, settings, availableActions);
        _uiStateController.add(lastUIState);
      });
    };

    lastUIState.onMutePressed =
        availableActions.has(RaceActions.MUTE)
            ? () {
              _connection.sendCommand(
                Command(muteFalseStartSound: MuteFalseStartSoundCommand()),
              );
            }
            : null;
  }

  void _computeAvailableLaneActions(
    RaceFullState_State raceState,
    UILaneState uiLaneState,
    LaneFullState laneFullState,
    Iterable<LaneFullState?> otherLaneStates,
  ) {
    int availableActions = 0;
    if (laneFullState.state == LaneFullState_State.IDLE) {
      availableActions |= LaneActions.DISABLE_LANE.value;
    } else if (laneFullState.state == LaneFullState_State.RUNNING) {
      availableActions |= LaneActions.FALL.value;
    } else if (laneFullState.state == LaneFullState_State.DISABLED &&
        (raceState == RaceFullState_State.IDLE ||
            raceState == RaceFullState_State.IDLE_CLEAR_TO_START)) {
      availableActions |= LaneActions.ENABLE_LANE.value;
    }

    uiLaneState.availableLaneActions = availableActions;

    uiLaneState.onDisableLanePressed =
        availableActions.has(LaneActions.DISABLE_LANE) &&
                otherLaneStates.any(
                  (lane) => lane!.state != LaneFullState_State.DISABLED,
                )
            ? () {
              _connection.sendCommand(
                Command(
                  disable: LaneSetDisabledCommand(
                    laneNumber: uiLaneState.laneIndex,
                    disabled: true,
                  ),
                ),
              );
            }
            : null;

    uiLaneState.onFallPressed =
        availableActions.has(LaneActions.FALL)
            ? () {
              _connection.sendCommand(
                Command(
                  fall: LaneSetFallCommand(laneNumber: uiLaneState.laneIndex),
                ),
              );
            }
            : null;

    uiLaneState.onEnableLanePressed =
        availableActions.has(LaneActions.ENABLE_LANE)
            ? () {
              _connection.sendCommand(
                Command(
                  disable: LaneSetDisabledCommand(
                    laneNumber: uiLaneState.laneIndex,
                    disabled: false,
                  ),
                ),
              );
            }
            : null;
  }

  void _addCalculatedOrNormalTime(
    LaneFullState laneFullState,
    List<TextSpan> climbingTimeTextSpans,
  ) {
    if (laneFullState.climbingTime != 0) {
      TextDecoration style =
          laneFullState
                      .extraState
                      .trainingClassicRaceExtraState
                      .timeIsCalculated
              ? TextDecoration.lineThrough
              : TextDecoration.none;

      climbingTimeTextSpans.add(
        TextSpan(
          text:
              "(${(laneFullState.climbingTime / 1000.0).toStringAsFixed(3)})",
          style: TextStyle(decoration: style),
        ),
      );
    }
  }

  _determineLaneTextColor(LaneFullState laneFullState) {
    if (lastUIState.laneStates.isEmpty) {
      return Colors.red; // Default color if no lanes are available
    }

    if (laneFullState
            .extraState
            .trainingClassicRaceExtraState
            .autostartPending) {
      return Colors.blue;
    }

    switch (laneFullState.state) {
      case LaneFullState_State.IDLE:
      case LaneFullState_State.RUNNING_FOOT_DOWN:
      case LaneFullState_State.RUNNING:
      case LaneFullState_State.FALSE_START:
      case LaneFullState_State.FALL:
      case LaneFullState_State.FINISHED:
        return Colors.red;
      case LaneFullState_State.IDLE_FOOT_DOWN:
      case LaneFullState_State.READY_FOOT_DOWN:
      case LaneFullState_State.FALSE_START_TIE:
      case LaneFullState_State.FINISHED_TIE:
        return Colors.yellow;
      case LaneFullState_State.FINISHED_WINNER:
      case LaneFullState_State.WILDCARD:
        return Colors.green;
      case LaneFullState_State.DISABLED:
        return Colors.grey;
      default:
        return Colors.red;
    }
  }


  List<TextSpan> _createLaneTextWithTime(
    LaneFullState laneFullState,
    Duration? virtualClimbingTime,
  ) {
    List<TextSpan> climbingTimeTextSpans = [];
    if (laneFullState.state == LaneFullState_State.FALSE_START ||
        laneFullState.state == LaneFullState_State.FALSE_START_TIE) {
      climbingTimeTextSpans.add(TextSpan(text: 'FALSE '));
      _addCalculatedOrNormalTime(laneFullState, climbingTimeTextSpans);
    } else if (laneFullState.state == LaneFullState_State.WILDCARD) {
      climbingTimeTextSpans.add(TextSpan(text: 'WC '));
      _addCalculatedOrNormalTime(laneFullState, climbingTimeTextSpans);
    } else if (laneFullState.state == LaneFullState_State.FALL) {
      climbingTimeTextSpans.add(TextSpan(text: 'FALL'));
    } else {
      int climbingTime = laneFullState.climbingTime;
      if (laneFullState.state == LaneFullState_State.RUNNING_FOOT_DOWN ||
          laneFullState.state == LaneFullState_State.RUNNING) {
        if (virtualClimbingTime != null) {
          climbingTime =
              ((virtualClimbingTime.inMilliseconds / 100).toInt()) * 100;
        }
      }
      climbingTimeTextSpans.add(
        TextSpan(text: (climbingTime / 1000.0).toStringAsFixed(3)),
      );
    }
    return climbingTimeTextSpans;
  }


  String? _createLaneSubText(LaneFullState laneFullState) {
    if (laneFullState.reactionTime != 0) {
      return 'Reaction Time: ${(convertReactionTimeToDuration(laneFullState.reactionTime).inMilliseconds / 1000).toStringAsFixed(3)}';
    } else if (laneFullState.state == LaneFullState_State.IDLE_FOOT_DOWN) {
      return 'FOOT OK';
    } else if (laneFullState.state == LaneFullState_State.READY_FOOT_DOWN) {
      return 'READY';
    } else if (laneFullState.state == LaneFullState_State.DISABLED) {
      return 'OFFLINE';
    }
    return null;
  }

  void _handleRaceStateChange(RaceFullState raceFullState) {
    switch (raceFullState.state) {
      case RaceFullState_State.FINISHED:
      case RaceFullState_State.FINISHED_MUTED:
        if (!_raceAlreadySent) {
          logger.d("Race finished");
          raceResultStreamController.add(lastUIState.laneStates);
          _raceAlreadySent = true;
        }
        break;
      default:
        // Do nothing for other states
        _raceAlreadySent = false;
        break;
    }

  }

  void _onRaceState(RaceFullState raceFullState) {
    lastUIState.raceState = raceFullState.state;

    for (var (index, lane) in raceFullState.laneStates.indexed) {
      if (lastUIState.laneStates.length <= index) {
        lastUIState.laneStates.add(UILaneState(laneIndex: index));
      }
      lastUIState.laneStates[index].laneFullState = lane;

      List<LaneFullState> otherLaneStates = List.from(raceFullState.laneStates);
      otherLaneStates.removeAt(index);
      _computeAvailableLaneActions(
        raceFullState.state,
        lastUIState.laneStates[index],
        lane,
        otherLaneStates,
      );
      lastUIState.laneStates[index].laneTextTime = _createLaneTextWithTime(
        lane,
        lastUIState.stopwatchDuration,
      );
      lastUIState.laneStates[index].laneTextColor = _determineLaneTextColor(
        lane,
      );
      lastUIState.laneStates[index].laneSubtext = _createLaneSubText(lane);
      _handleLaneStateChange(lastUIState.laneStates[index], raceFullState);
    }
    _handleAutostartProgress(raceFullState, lastUIState.settings);
    _computeAvailableRaceActions(raceFullState, lastUIState.settings);
    _computeOnPressedFunctions(
      raceFullState,
      lastUIState.settings,
      lastUIState.availableRaceActions,
    );
    _handleRaceStateChange(raceFullState);

    _uiStateController.add(lastUIState);
  }

  void _onSettings(Settings settings) {
    lastUIState.settings = settings;
    _version ??= determineVersion(settings);
    lastUIState.settings = settingsMiddleware(settings, _version);
    _uiStateController.add(lastUIState);
  }

  UIStateController(this._connection) {
    // Setting must be listened on first because, such that the version can be determined
    _connection.onSettings.listen((settings) {
      _onSettings(settings);
    });
    _connection.onRaceState.listen((raceFullState) {
      _onRaceState(raceFullState);
    });
  }

  void dispose() {
    _uiStateController.close();
    _timer.cancel();
  }
}
