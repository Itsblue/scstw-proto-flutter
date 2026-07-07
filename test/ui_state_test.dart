import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scstw_lib/connection.dart';
import 'package:scstw_lib/proto_out/Command.pb.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
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
}
