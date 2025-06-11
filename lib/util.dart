import 'package:protobuf/protobuf.dart';
import 'package:scstw_lib/proto_out/RaceState.pbserver.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
import 'package:scstw_lib/proto_out/deprecated/RaceSettings.pb.dart';

Duration convertClimbingTimeToDuration(int time) {
  return Duration(milliseconds: time);
}

Duration convertReactionTimeToDuration(int time) {
  return Duration(milliseconds: time - 3000);
}


String? determineVersion(Settings settings) {
  if (settings.hasRace() && !settings.hasStopwatchSettings()) {
    return '1.0.0';
  }
  if (settings.hasStopwatchSettings() && settings.hasSecuritySettings()) {
    return '1.1.0';
  }
  return null;
}


RaceFullState raceFullStateMiddleware(RaceFullState raceFullState, Settings settings, String? version) {
  if (version == null || version != "1.0.0") {
    return raceFullState;
  }
  if (raceFullState.state == RaceFullState_State.IDLE_CLEAR_TO_START && settings.race.startProcedure.hasAutomatedStartProcedureSettings()) {
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
  if (settings.hasRace() && !settings.hasStopwatchSettings()) {
    var newSettings = settings.deepCopy();
    // Only for progress bar
    newSettings.stopwatchSettings = StopwatchSettings(trainingClassicRaceMode: TrainingClassicRaceMode(
      startProcedure: StartProcedure(
        automatedStartProcedure: AutomatedStartProcedure(
          sayReady: settings.race.startProcedure.automatedStartProcedureSettings.sayReady,
          standstillDurationBeforeStart: settings.race.startProcedure.automatedStartProcedureSettings.standstillDurationBeforeReady
        ),
      )
    ));
    newSettings.sound.volume = settings.sound.volume > 254 ? 254 : settings.sound.volume;
    return newSettings;
  }
  return settings;
}