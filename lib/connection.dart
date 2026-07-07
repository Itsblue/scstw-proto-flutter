import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:scstw_lib/proto_out/Command.pb.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';
import 'package:scstw_lib/proto_out/SystemInfo.pb.dart';

abstract class BaseStationConnection {
  void scan(Function(List<ScanResult>) onScanResult);
  Future<void> connect(BluetoothDevice device);
  Future<void> disconnect();
  Future<void> sendCommand(Command command);
  Future<void> sendSettings(Settings settings);

  Stream<RaceFullState> get onRaceState;
  Stream<Settings> get onSettings;
  bool get hasSystemInfo;
  Stream<SystemInfo> get onSystemInfo;
}
