import 'package:protobuf/protobuf.dart';
import 'package:scstw_lib/proto_out/RaceState.pbserver.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';

Duration convertClimbingTimeToDuration(int time) {
  return Duration(milliseconds: time);
}

Duration convertReactionTimeToDuration(int time) {
  return Duration(milliseconds: time - 3000);
}


String? determineVersion(Settings settings) {
  if (settings.hasRace() && !settings.hasStopwatchSettings()) { // ignore: deprecated_member_use_from_same_package
    return '1.0.0';
  }
  if (settings.hasStopwatchSettings() && settings.hasSecuritySettings()) {
    return '1.1.0';
  }
  return "1.0.0";
}


RaceFullState raceFullStateMiddleware(RaceFullState raceFullState, Settings settings, String? version) {
  if (version == null || version != "1.0.0") {
    return raceFullState;
  }
  if (raceFullState.state == RaceFullState_State.IDLE_CLEAR_TO_START && settings.race.startProcedure.hasAutomatedStartProcedureSettings()) { // ignore: deprecated_member_use_from_same_package
    var newState = raceFullState.deepCopy();

    for (var lane in newState.laneStates) {
      lane.extraState = LaneExtraState(trainingClassicRaceExtraState: TrainingClassicRaceExtraState(
        autostartPending: true,
        timeIsCalculated: false,
      ));
    }
    return newState;
  }
  return raceFullState;

}

Settings settingsMiddleware(Settings settings, String? version) {
  if (version == null || version != "1.0.0") {
    return settings;
  }
  if (settings.hasRace() && !settings.hasStopwatchSettings()) { // ignore: deprecated_member_use_from_same_package
    var newSettings = settings.deepCopy();
    newSettings.sound.volume = settings.sound.volume > 254 ? 254 : settings.sound.volume;
    return newSettings;
  }
  return settings;
}