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
  Future<void> sendCommand(Command command) async {}

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
