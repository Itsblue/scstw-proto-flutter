// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scstw_lib/connection.dart';
import 'package:scstw_lib/progress.dart';
import 'package:scstw_lib/proto_out/Command.pb.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
import 'package:scstw_lib/proto_out/SystemInfo.pb.dart';
import 'package:scstw_lib/race_timing.dart';
import 'package:scstw_lib/util.dart';

import 'lane_timer.dart';

// Mixin to create Enum for bitflags uses.
mixin EnumFlag on Enum {
  // value receive a bitwise shift operation. It means "shift the bits of 1 to the left by index places". So,  "1,10,100,1000..." == 1,2,4,8,16....
  int get value => 1 << index;

  // Creates a operator "|" for enum.
  int operator |(EnumFlag other) => value | other.value;
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
  List<List<TextSpan>> laneDetailLines = [];
  String? laneSubtext;
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
  bool atYourMarks = false;

  void Function()? onResetPressed;
  void Function()? onReadyPressed;
  void Function()? onAtYourMarksPressed;
  void Function()? onMutePressed;
}

class UIStateController {
  final logger = Logger();
  final BaseStationConnection _connection;
  final bool allowReset;
  final bool allowReady;

  /// Overrides competition-mode detection when the caller already owns it.
  /// When omitted, competition classic and relay modes are treated as
  /// competition modes.
  final bool? competitionMode;

  UIState lastUIState = UIState();
  Settings _settings = Settings();
  final LaneTimer _timer = LaneTimer();

  final Progress _progress = Progress();
  bool _raceAlreadySent = false;

  String? _version;
  SystemInfo? _systemInfo;

  String? get version {
    return _version;
  }

  BaseStationFeatures get features {
    return determineFeatures(_version);
  }

  final raceResultStreamController =
      StreamController<List<UILaneState>>.broadcast();

  Stream<List<UILaneState>> get raceResultsStream =>
      raceResultStreamController.stream;

  final StreamController<UIState> _uiStateController =
      StreamController<UIState>.broadcast();

  Stream<UIState> get uiStateStream => _uiStateController.stream;

  void _handleRaceTimerState(RaceFullState raceFullState) {
    if (raceFullState.state == RaceFullState_State.RUNNING) {
      if (_timer.isRunning) return;

      final initialElapsed = Duration(
        milliseconds: synchronizedRaceElapsedMilliseconds(
          raceFullState.currentTime.toInt(),
        ),
      );
      lastUIState.stopwatchDuration = initialElapsed;
      _timer.start(
        (elapsed) {
          lastUIState.stopwatchDuration = elapsed;
          _updateAllLaneTiming();
        },
        100,
        initialElapsed,
      );
      return;
    }

    _timer.stop();
    lastUIState.stopwatchDuration = null;
  }

  void _updateAllLaneTiming() {
    for (var laneState in lastUIState.laneStates) {
      final laneFullState = laneState.laneFullState!;
      final timing = calculateLaneTiming(
        laneFullState,
        lastUIState.stopwatchDuration,
      );
      if (laneState.laneFullState?.state != LaneFullState_State.FINISHED &&
          laneState.laneFullState?.state !=
              LaneFullState_State.FINISHED_WINNER &&
          laneState.laneFullState?.state != LaneFullState_State.FINISHED_TIE) {
        laneState.laneTextTime = _createLaneTextWithTime(laneFullState, timing);
      }
      laneState.laneDetailLines = _createLaneDetailLines(laneFullState, timing);
    }
    _uiStateController.add(lastUIState);
  }

  void _handleAutostartProgress(
    RaceFullState raceFullState,
    Settings settings,
  ) {
    var standstillDurationBeforeStart =
        features.settings.stopwatch
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

    switch (raceFullState.state) {
      case RaceFullState_State.IDLE:
      case RaceFullState_State.IDLE_CLEAR_TO_START:
        if (allowReady) {
          availableActions |= RaceActions.READY.value;
        }
        break;
      case RaceFullState_State.RUNNING:
        if (allowReset && !_isCompetitionMode(settings)) {
          availableActions |= RaceActions.RESET.value;
        }
        break;
      case RaceFullState_State.FINISHED:
      case RaceFullState_State.FINISHED_MUTED:
        if (allowReset) {
          availableActions |= RaceActions.RESET.value;
        }
        break;
      case RaceFullState_State.STARTING:
        break;
    }

    if (features.command.sayAtYourMarks &&
        raceFullState.state == RaceFullState_State.IDLE) {
      availableActions |= RaceActions.AT_YOUR_MARKS.value;
    }
    if (features.command.muteFalseStart &&
        raceFullState.state == RaceFullState_State.FINISHED &&
        raceFullState.laneStates.any(
          (laneState) => [
            LaneFullState_State.FALSE_START,
            LaneFullState_State.FALSE_START_TIE,
          ].contains(laneState.state),
        )) {
      availableActions |= RaceActions.MUTE.value;
    }
    lastUIState.availableRaceActions = availableActions;
  }

  bool _isCompetitionMode(Settings settings) {
    return competitionMode ??
        (settings.stopwatchSettings.hasCompetitionClassicRaceMode() ||
            settings.stopwatchSettings.hasCompetitionRelayMode());
  }

  void _computeOnPressedFunctions(
    RaceFullState raceFullState,
    int availableActions,
  ) {
    lastUIState.onResetPressed =
        availableActions.has(RaceActions.RESET)
            ? () {
              _connection.sendCommand(Command(reset: RaceResetCommand()));
              lastUIState.atYourMarks = false;
              _uiStateController.add(lastUIState);
            }
            : null;

    lastUIState.onReadyPressed =
        availableActions.has(RaceActions.READY)
            ? () {
              _connection.sendCommand(Command(start: RaceStartCommand()));
            }
            : null;

    lastUIState.onAtYourMarksPressed =
        availableActions.has(RaceActions.AT_YOUR_MARKS)
            ? () {
              _connection.sendCommand(
                Command(sayAtYourMarks: SayAtYourMarksCommand()),
              );
              lastUIState.atYourMarks = true;
              lastUIState.onAtYourMarksPressed =
                  null; // Disable the button after pressing
              _uiStateController.add(lastUIState);
              Future.delayed(Duration(milliseconds: 1100), () {
                _computeOnPressedFunctions(raceFullState, availableActions);
                _uiStateController.add(lastUIState);
              });
            }
            : null;

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
    final isStartOnReleaseMode =
        lastUIState.settings.stopwatchSettings.hasTrainingStartOnReleaseMode();

    if (laneFullState.state == LaneFullState_State.IDLE &&
        !isStartOnReleaseMode) {
      availableActions |= LaneActions.DISABLE_LANE.value;
    } else if (laneFullState.state == LaneFullState_State.RUNNING &&
        !isStartOnReleaseMode) {
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
          text: "(${(laneFullState.climbingTime / 1000.0).toStringAsFixed(3)})",
          style: TextStyle(decoration: style),
        ),
      );
    }
  }

  Color _determineLaneTextColor(LaneFullState laneFullState) {
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
    LaneTiming timing,
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
      climbingTimeTextSpans.add(
        TextSpan(text: _formatMilliseconds(timing.primaryTimeMilliseconds)),
      );
    }
    return climbingTimeTextSpans;
  }

  List<List<TextSpan>> _createLaneDetailLines(
    LaneFullState laneFullState,
    LaneTiming timing,
  ) {
    final detailLines = <List<TextSpan>>[];

    if (timing.reactionTimeMilliseconds != null) {
      final reactionTime = <TextSpan>[
        const TextSpan(text: 'reaction time: '),
        TextSpan(
          text: _formatMilliseconds(timing.reactionTimeMilliseconds!),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ];

      final stopwatchSettings = lastUIState.settings.stopwatchSettings;
      if (stopwatchSettings.hasTrainingClassicRaceMode() &&
          stopwatchSettings.trainingClassicRaceMode.hasFalseStartSettings() &&
          stopwatchSettings.trainingClassicRaceMode.falseStartSettings
              .hasBehaviour() && // ignore: deprecated_member_use_from_same_package
          stopwatchSettings
              .trainingClassicRaceMode
              .falseStartSettings
              .behaviour // ignore: deprecated_member_use_from_same_package
              .hasContinueAfterFalseStart() &&
          laneFullState.hasExtraState() &&
          laneFullState.extraState.hasTrainingClassicRaceExtraState() &&
          laneFullState
              .extraState
              .trainingClassicRaceExtraState
              .timeIsCalculated) {
        final assumedReactionTime =
            stopwatchSettings
                .trainingClassicRaceMode
                .falseStartSettings
                .behaviour // ignore: deprecated_member_use_from_same_package
                .continueAfterFalseStart
                .assumedReactionTime;
        reactionTime.addAll([
          const TextSpan(text: ' ('),
          TextSpan(
            text: '$assumedReactionTime',
            style: const TextStyle(decoration: TextDecoration.lineThrough),
          ),
          const TextSpan(text: ')'),
        ]);
      }

      if (timing.relay != null) {
        reactionTime.addAll([
          const TextSpan(text: ' / '),
          TextSpan(
            text: _formatMilliseconds(
              timing.relay!.secondReactionTimeMilliseconds,
            ),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ]);
      }

      detailLines.add(reactionTime);
    }

    if (timing.relay?.showClimbingTimes == true) {
      detailLines.add([
        const TextSpan(text: 'climbing time: '),
        TextSpan(
          text: _formatMilliseconds(
            timing.relay!.firstClimbingTimeMilliseconds,
          ),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const TextSpan(text: ' / '),
        TextSpan(
          text: _formatMilliseconds(
            timing.relay!.secondClimbingTimeMilliseconds,
          ),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ]);
    }

    return detailLines;
  }

  String _formatMilliseconds(int milliseconds) {
    return (milliseconds / 1000.0).toStringAsFixed(3);
  }

  String? _createLaneSubText(LaneFullState laneFullState) {
    if (laneFullState.state == LaneFullState_State.IDLE_FOOT_DOWN) {
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

  UILaneState _createUILaneState(
    RaceFullState raceFullState,
    int index,
    LaneFullState laneFullState,
  ) {
    final uiLaneState = UILaneState(
      laneIndex: index,
      laneFullState: laneFullState,
    );
    final otherLaneStates = List<LaneFullState>.from(raceFullState.laneStates)
      ..removeAt(index);

    _computeAvailableLaneActions(
      raceFullState.state,
      uiLaneState,
      laneFullState,
      otherLaneStates,
    );
    final timing = calculateLaneTiming(
      laneFullState,
      lastUIState.stopwatchDuration,
    );
    uiLaneState.laneTextTime = _createLaneTextWithTime(laneFullState, timing);
    uiLaneState.laneDetailLines = _createLaneDetailLines(laneFullState, timing);
    uiLaneState.laneTextColor = _determineLaneTextColor(laneFullState);
    uiLaneState.laneSubtext = _createLaneSubText(laneFullState);

    return uiLaneState;
  }

  void _onRaceState(RaceFullState raceFullState) {
    lastUIState.raceState = raceFullState.state;
    _handleRaceTimerState(raceFullState);

    final nextLaneStates = [
      for (final (index, lane) in raceFullState.laneStates.indexed)
        _createUILaneState(raceFullState, index, lane),
    ];
    lastUIState.laneStates = nextLaneStates;
    _handleAutostartProgress(raceFullState, lastUIState.settings);
    _computeAvailableRaceActions(raceFullState, lastUIState.settings);
    _computeOnPressedFunctions(raceFullState, lastUIState.availableRaceActions);
    _handleRaceStateChange(raceFullState);

    _uiStateController.add(lastUIState);
  }

  void _onSystemInfo(SystemInfo systemInfo) {
    _systemInfo = systemInfo;
    _updateVersion();
    _uiStateController.add(lastUIState);
  }

  void _onSettings(Settings settings) {
    _settings = settings;
    _updateVersion();
    _uiStateController.add(lastUIState);
  }

  void _updateVersion() {
    _version = determineVersion(_settings, _systemInfo);
    logger.d("Version: $_version");
    lastUIState.settings = settingsMiddleware(_settings, _version);
  }

  UIStateController(
    this._connection, {
    this.allowReset = true,
    this.allowReady = true,
    this.competitionMode,
  }) {
    // Setting must be listened on first because, such that the version can be determined
    _connection.onSystemInfo.listen((systemInfo) {
      _onSystemInfo(systemInfo);
    });
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
