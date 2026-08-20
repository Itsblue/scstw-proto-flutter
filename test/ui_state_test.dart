import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scstw_lib/connection.dart';
import 'package:scstw_lib/proto_out/Command.pb.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
import 'package:scstw_lib/proto_out/deprecated/Settings.pb.dart' as deprecated;
import 'package:scstw_lib/proto_out/SystemInfo.pb.dart';
import 'package:scstw_lib/ui_state.dart';

class FakeBaseStationConnection implements BaseStationConnection {
  final _raceStateController = StreamController<RaceFullState>.broadcast();
  final _settingsController = StreamController<Settings>.broadcast();
  final _systemInfoController = StreamController<SystemInfo>.broadcast();
  final sentCommands = <Command>[];

  void emitRaceState(RaceFullState raceState) {
    _raceStateController.add(raceState);
  }

  void emitSettings(Settings settings) {
    _settingsController.add(settings);
  }

  void emitSystemInfo(SystemInfo systemInfo) {
    _systemInfoController.add(systemInfo);
  }

  Future<void> dispose() async {
    await _raceStateController.close();
    await _settingsController.close();
    await _systemInfoController.close();
  }

  @override
  Future<void> connect(BluetoothDevice device) async {}

  @override
  Future<void> disconnect() async {}

  @override
  Stream<RaceFullState> get onRaceState => _raceStateController.stream;

  @override
  Stream<Settings> get onSettings => _settingsController.stream;

  @override
  bool get hasSystemInfo => true;

  @override
  Stream<SystemInfo> get onSystemInfo => _systemInfoController.stream;

  @override
  void scan(Function(List<ScanResult>) onScanResult) {}

  @override
  Future<void> sendCommand(Command command) async {
    sentCommands.add(command);
  }

  @override
  Future<void> sendSettings(Settings settings) async {}
}

RaceFullState _raceStateWithLanes(int laneCount) {
  return RaceFullState(
    state: RaceFullState_State.IDLE,
    laneStates: List.generate(
      laneCount,
      (_) => LaneFullState(state: LaneFullState_State.IDLE),
    ),
  );
}

RaceFullState _raceState(RaceFullState_State state) {
  return RaceFullState(
    state: state,
    laneStates: [LaneFullState(state: LaneFullState_State.IDLE)],
  );
}

String _plainText(List<TextSpan> spans) {
  return spans.map((span) => span.toPlainText()).join();
}

void main() {
  test('race state replaces stale UI lanes when lane count shrinks', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    connection.emitRaceState(_raceStateWithLanes(2));
    await pumpEventQueue();

    expect(controller.lastUIState.laneStates, hasLength(2));

    connection.emitRaceState(_raceStateWithLanes(1));
    await pumpEventQueue();

    expect(controller.lastUIState.laneStates, hasLength(1));
    expect(controller.lastUIState.laneStates.single.laneIndex, 0);

    controller.dispose();
    await connection.dispose();
  });

  test('system info version takes precedence over settings version', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    expect(controller.version, '1.1.0');
    expect(controller.features.settings.raceModesRound, isFalse);

    connection.emitSystemInfo(SystemInfo(appInfo: AppInfo(version: '1.3.0')));
    await pumpEventQueue();

    expect(controller.version, '1.3.0');
    expect(controller.features.settings.raceModesRound, isTrue);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    expect(controller.version, '1.3.0');

    controller.dispose();
    await connection.dispose();
  });

  test('command actions remain available after version 1.1.0', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(),
        securitySettings: SecuritySettings(),
      ),
    );
    connection.emitSystemInfo(SystemInfo(appInfo: AppInfo(version: '1.4.0')));
    await pumpEventQueue();

    connection.emitRaceState(_raceStateWithLanes(1));
    await pumpEventQueue();

    expect(
      controller.lastUIState.availableRaceActions.has(
        RaceActions.AT_YOUR_MARKS,
      ),
      isTrue,
    );
    expect(controller.lastUIState.onAtYourMarksPressed, isNotNull);

    connection.emitRaceState(
      RaceFullState(
        state: RaceFullState_State.FINISHED,
        laneStates: [LaneFullState(state: LaneFullState_State.FALSE_START)],
      ),
    );
    await pumpEventQueue();

    expect(
      controller.lastUIState.availableRaceActions.has(RaceActions.MUTE),
      isTrue,
    );
    expect(controller.lastUIState.onMutePressed, isNotNull);

    controller.dispose();
    await connection.dispose();
  });

  test('primary actions follow the app race-state logic', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(
          trainingStartOnReleaseMode: TrainingStartOnReleaseMode(),
        ),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    for (final state in [
      RaceFullState_State.IDLE,
      RaceFullState_State.IDLE_CLEAR_TO_START,
    ]) {
      connection.emitRaceState(_raceState(state));
      await pumpEventQueue();

      expect(
        controller.lastUIState.availableRaceActions.has(RaceActions.READY),
        isTrue,
      );
      expect(controller.lastUIState.onReadyPressed, isNotNull);
      expect(controller.lastUIState.onResetPressed, isNull);
    }

    connection.emitRaceState(_raceState(RaceFullState_State.RUNNING));
    await pumpEventQueue();
    expect(
      controller.lastUIState.availableRaceActions.has(RaceActions.RESET),
      isTrue,
    );
    expect(controller.lastUIState.onResetPressed, isNotNull);
    expect(controller.lastUIState.onReadyPressed, isNull);

    for (final state in [
      RaceFullState_State.FINISHED,
      RaceFullState_State.FINISHED_MUTED,
    ]) {
      connection.emitRaceState(_raceState(state));
      await pumpEventQueue();

      expect(
        controller.lastUIState.availableRaceActions.has(RaceActions.RESET),
        isTrue,
      );
      expect(controller.lastUIState.onResetPressed, isNotNull);
      expect(controller.lastUIState.onReadyPressed, isNull);
    }

    connection.emitRaceState(_raceState(RaceFullState_State.STARTING));
    await pumpEventQueue();
    expect(
      controller.lastUIState.availableRaceActions.has(RaceActions.READY),
      isFalse,
    );
    expect(
      controller.lastUIState.availableRaceActions.has(RaceActions.RESET),
      isFalse,
    );
    expect(controller.lastUIState.onReadyPressed, isNull);
    expect(controller.lastUIState.onResetPressed, isNull);

    controller.dispose();
    await connection.dispose();
  });

  test('primary actions honor allow flags and competition mode', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(
      connection,
      allowReady: false,
      allowReset: false,
      competitionMode: false,
    );

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(
          trainingClassicRaceMode: TrainingClassicRaceMode(),
        ),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    for (final state in [
      RaceFullState_State.IDLE,
      RaceFullState_State.IDLE_CLEAR_TO_START,
      RaceFullState_State.RUNNING,
      RaceFullState_State.FINISHED,
      RaceFullState_State.FINISHED_MUTED,
    ]) {
      connection.emitRaceState(_raceState(state));
      await pumpEventQueue();

      expect(controller.lastUIState.onReadyPressed, isNull);
      expect(controller.lastUIState.onResetPressed, isNull);
    }

    controller.dispose();
    await connection.dispose();
  });

  test('running reset uses detected or overridden competition mode', () async {
    final competitionConnection = FakeBaseStationConnection();
    final competitionController = UIStateController(competitionConnection);
    final overriddenConnection = FakeBaseStationConnection();
    final overriddenController = UIStateController(
      overriddenConnection,
      competitionMode: false,
    );
    final competitionSettings = Settings(
      stopwatchSettings: StopwatchSettings(
        competitionClassicRaceMode: CompetitionClassicRaceMode(),
      ),
      securitySettings: SecuritySettings(),
    );

    competitionConnection.emitSettings(competitionSettings);
    overriddenConnection.emitSettings(competitionSettings);
    await pumpEventQueue();
    competitionConnection.emitRaceState(
      _raceState(RaceFullState_State.RUNNING),
    );
    overriddenConnection.emitRaceState(_raceState(RaceFullState_State.RUNNING));
    await pumpEventQueue();

    expect(competitionController.lastUIState.onResetPressed, isNull);
    expect(overriddenController.lastUIState.onResetPressed, isNotNull);

    competitionController.dispose();
    overriddenController.dispose();
    await competitionConnection.dispose();
    await overriddenConnection.dispose();
  });

  test(
    'primary callbacks send commands and reset at-your-marks state',
    () async {
      final connection = FakeBaseStationConnection();
      final controller = UIStateController(connection);

      connection.emitSettings(
        Settings(
          stopwatchSettings: StopwatchSettings(
            trainingClassicRaceMode: TrainingClassicRaceMode(),
          ),
          securitySettings: SecuritySettings(),
        ),
      );
      await pumpEventQueue();

      connection.emitRaceState(_raceState(RaceFullState_State.IDLE));
      await pumpEventQueue();
      controller.lastUIState.onReadyPressed!();
      expect(connection.sentCommands.last.hasStart(), isTrue);

      controller.lastUIState.atYourMarks = true;
      connection.emitRaceState(_raceState(RaceFullState_State.FINISHED));
      await pumpEventQueue();
      controller.lastUIState.onResetPressed!();

      expect(connection.sentCommands.last.hasReset(), isTrue);
      expect(controller.lastUIState.atYourMarks, isFalse);

      controller.dispose();
      await connection.dispose();
    },
  );

  test('running race initializes and clears the global race clock', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(
          trainingClassicRaceMode: TrainingClassicRaceMode(),
        ),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    connection.emitRaceState(
      RaceFullState(
        state: RaceFullState_State.RUNNING,
        laneStates: [LaneFullState(state: LaneFullState_State.RUNNING)],
      ),
    );
    await pumpEventQueue();

    expect(controller.lastUIState.stopwatchDuration?.inMilliseconds, 100);
    expect(
      _plainText(controller.lastUIState.laneStates.single.laneTextTime),
      '0.100',
    );

    connection.emitRaceState(_raceStateWithLanes(1));
    await pumpEventQueue();

    expect(controller.lastUIState.stopwatchDuration, isNull);

    controller.dispose();
    await connection.dispose();
  });

  test('start-on-release mode exposes the lane-relative live time', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(
          trainingStartOnReleaseMode: TrainingStartOnReleaseMode(),
        ),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    connection.emitRaceState(
      RaceFullState(
        state: RaceFullState_State.RUNNING,
        laneStates: [
          LaneFullState(
            state: LaneFullState_State.RUNNING,
            extraState: LaneExtraState(
              trainingStartOnReleaseExtraState:
                  TrainingStartOnReleaseExtraState(startedAt: 2500),
            ),
          ),
        ],
      ),
    );
    await pumpEventQueue();

    expect(
      _plainText(controller.lastUIState.laneStates.single.laneTextTime),
      '0.600',
    );

    controller.dispose();
    await connection.dispose();
  });

  test('start-on-release mode hides disable and fall lane actions', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(
          trainingStartOnReleaseMode: TrainingStartOnReleaseMode(),
        ),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    connection.emitRaceState(
      RaceFullState(
        state: RaceFullState_State.IDLE,
        laneStates: [LaneFullState(state: LaneFullState_State.IDLE)],
      ),
    );
    await pumpEventQueue();

    var lane = controller.lastUIState.laneStates.single;
    expect(lane.availableLaneActions.has(LaneActions.DISABLE_LANE), isFalse);
    expect(lane.onDisableLanePressed, isNull);

    connection.emitRaceState(
      RaceFullState(
        state: RaceFullState_State.RUNNING,
        laneStates: [LaneFullState(state: LaneFullState_State.RUNNING)],
      ),
    );
    await pumpEventQueue();

    lane = controller.lastUIState.laneStates.single;
    expect(lane.availableLaneActions.has(LaneActions.FALL), isFalse);
    expect(lane.onFallPressed, isNull);

    connection.emitRaceState(
      RaceFullState(
        state: RaceFullState_State.IDLE,
        laneStates: [LaneFullState(state: LaneFullState_State.DISABLED)],
      ),
    );
    await pumpEventQueue();

    lane = controller.lastUIState.laneStates.single;
    expect(lane.availableLaneActions.has(LaneActions.ENABLE_LANE), isTrue);
    expect(lane.onEnableLanePressed, isNotNull);

    controller.dispose();
    await connection.dispose();
  });

  test('relay mode exposes both reaction and climbing time splits', () async {
    final connection = FakeBaseStationConnection();
    final controller = UIStateController(connection);

    connection.emitSettings(
      Settings(
        stopwatchSettings: StopwatchSettings(
          competitionRelayMode: CompetitionRelayMode(),
        ),
        securitySettings: SecuritySettings(),
      ),
    );
    await pumpEventQueue();

    connection.emitRaceState(
      RaceFullState(
        state: RaceFullState_State.FINISHED,
        laneStates: [
          LaneFullState(
            state: LaneFullState_State.FINISHED,
            reactionTime: 3100,
            climbingTime: 12345,
            extraState: LaneExtraState(
              competitionRelayExtraState: CompetitionRelayExtraState(
                firstLaneClimbingTime: 5000,
                secondLaneReactionTime: 3200,
              ),
            ),
          ),
        ],
      ),
    );
    await pumpEventQueue();

    final detailLines =
        controller.lastUIState.laneStates.single.laneDetailLines;
    expect(detailLines, hasLength(2));
    expect(_plainText(detailLines.first), 'reaction time: 0.100 / 0.200');
    expect(_plainText(detailLines.last), 'climbing time: 5.000 / 7.345');
    expect(detailLines.first[1].style?.fontWeight, FontWeight.bold);
    expect(detailLines.first[3].style?.fontWeight, FontWeight.bold);

    controller.dispose();
    await connection.dispose();
  });

  test(
    'calculated reaction time includes the deprecated assumed time',
    () async {
      final connection = FakeBaseStationConnection();
      final controller = UIStateController(connection);

      connection.emitSettings(
        Settings(
          stopwatchSettings: StopwatchSettings(
            trainingClassicRaceMode: TrainingClassicRaceMode(
              falseStartSettings: FalseStartSettings(
                behaviour: deprecated.FalseStartBehaviour(
                  continueAfterFalseStart: deprecated.ContinueAfterFalseStart(
                    assumedReactionTime: 130,
                  ),
                ),
              ),
            ),
          ),
          securitySettings: SecuritySettings(),
        ),
      );
      await pumpEventQueue();

      connection.emitRaceState(
        RaceFullState(
          state: RaceFullState_State.FINISHED,
          laneStates: [
            LaneFullState(
              state: LaneFullState_State.FALSE_START,
              reactionTime: 3100,
              extraState: LaneExtraState(
                trainingClassicRaceExtraState: TrainingClassicRaceExtraState(
                  timeIsCalculated: true,
                ),
              ),
            ),
          ],
        ),
      );
      await pumpEventQueue();

      final reactionLine =
          controller.lastUIState.laneStates.single.laneDetailLines.single;
      expect(_plainText(reactionLine), 'reaction time: 0.100 (130)');
      expect(reactionLine[3].style?.decoration, TextDecoration.lineThrough);

      controller.dispose();
      await connection.dispose();
    },
  );
}
