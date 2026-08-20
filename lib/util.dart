import 'package:protobuf/protobuf.dart';
import 'package:scstw_lib/proto_out/RaceState.pbserver.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
import 'package:scstw_lib/proto_out/SystemInfo.pb.dart';

class BaseStationFeatures {
  final BaseStationSettingsFeatures settings;
  final BaseStationStopwatchFeatures stopwatch;
  final BaseStationCommandFeatures command;

  const BaseStationFeatures({
    required this.settings,
    required this.stopwatch,
    required this.command,
  });
}

class BaseStationSettingsFeatures {
  final bool storeAsDefault;
  final bool stopwatch;
  final bool security;
  final bool muteInternalSpeaker;
  final bool trainingClassicRaceModeFalseStartBehavior;
  final bool relayMode;
  final bool startOnReleaseMode;
  final bool raceModesRound;
  final bool raceModesRoundFinal2026;

  const BaseStationSettingsFeatures({
    required this.storeAsDefault,
    required this.stopwatch,
    required this.security,
    required this.muteInternalSpeaker,
    required this.trainingClassicRaceModeFalseStartBehavior,
    required this.relayMode,
    required this.startOnReleaseMode,
    required this.raceModesRound,
    required this.raceModesRoundFinal2026,
  });
}

class BaseStationStopwatchFeatures {
  final bool raceStateLaneExtraState;

  const BaseStationStopwatchFeatures({required this.raceStateLaneExtraState});
}

class BaseStationCommandFeatures {
  final bool sayAtYourMarks;
  final bool muteFalseStart;
  final bool sayBackToPresentation;

  const BaseStationCommandFeatures({
    required this.sayAtYourMarks,
    required this.muteFalseStart,
    required this.sayBackToPresentation,
  });
}

Duration convertClimbingTimeToDuration(int time) {
  return Duration(milliseconds: time);
}

Duration convertReactionTimeToDuration(int time) {
  return Duration(milliseconds: time - 3000);
}

String? determineVersionFromSystemInfo(SystemInfo? systemInfo) {
  if (systemInfo?.appInfo.hasVersion() == true) {
    return systemInfo!.appInfo.version;
  }
  return null;
}

String? determineVersionFromSettings(Settings settings) {
  if (settings.hasRace() && !settings.hasStopwatchSettings()) {
    // ignore: deprecated_member_use_from_same_package
    return '1.0.0';
  }
  if (settings.hasStopwatchSettings() && settings.hasSecuritySettings()) {
    return '1.1.0';
  }
  return "1.0.0";
}

String determineVersion(Settings settings, SystemInfo? systemInfo) {
  return determineVersionFromSystemInfo(systemInfo) ??
      determineVersionFromSettings(settings) ??
      "1.0.0";
}

BaseStationFeatures determineFeatures(String? version) {
  final normalizedVersion = _normalizeVersion(version);

  final has1_4_0 = _compareVersions('1.4.0', normalizedVersion) <= 0;
  final has1_3_0 = _compareVersions('1.3.0', normalizedVersion) <= 0;
  final has1_2_0 = _compareVersions('1.2.0', normalizedVersion) <= 0;
  final has1_1_0 = _compareVersions('1.1.0', normalizedVersion) <= 0;

  return BaseStationFeatures(
    settings: BaseStationSettingsFeatures(
      storeAsDefault: has1_1_0,
      stopwatch: has1_1_0,
      security: has1_1_0,
      muteInternalSpeaker: has1_1_0,
      trainingClassicRaceModeFalseStartBehavior: has1_1_0 && !has1_3_0,
      relayMode: has1_2_0,
      startOnReleaseMode: has1_2_0,
      raceModesRound: has1_3_0,
      raceModesRoundFinal2026: has1_4_0,
    ),
    stopwatch: BaseStationStopwatchFeatures(raceStateLaneExtraState: has1_1_0),
    command: BaseStationCommandFeatures(
      sayAtYourMarks: has1_1_0,
      muteFalseStart: has1_1_0,
      sayBackToPresentation: has1_4_0,
    ),
  );
}

String _normalizeVersion(String? version) {
  return (version?.split('-').first.replaceFirst('v', '') ?? '0.0.0').trim();
}

int _compareVersions(String version1, String version2) {
  final v1Segments = version1.split('.').map((part) => int.tryParse(part) ?? 0);
  final v2Segments = version2.split('.').map((part) => int.tryParse(part) ?? 0);
  final length =
      v1Segments.length > v2Segments.length
          ? v1Segments.length
          : v2Segments.length;
  final v1Parts = v1Segments.toList();
  final v2Parts = v2Segments.toList();

  for (var i = 0; i < length; i++) {
    final v1Part = i < v1Parts.length ? v1Parts[i] : 0;
    final v2Part = i < v2Parts.length ? v2Parts[i] : 0;

    if (v1Part > v2Part) {
      return 1;
    }
    if (v1Part < v2Part) {
      return -1;
    }
  }

  return 0;
}

RaceFullState raceFullStateMiddleware(
  RaceFullState raceFullState,
  Settings settings,
  String? version,
) {
  if (version == null || version != "1.0.0") {
    return raceFullState;
  }
  if (raceFullState.state == RaceFullState_State.IDLE_CLEAR_TO_START &&
      settings.race.startProcedure.hasAutomatedStartProcedureSettings()) {
    // ignore: deprecated_member_use_from_same_package
    var newState = raceFullState.deepCopy();

    for (var lane in newState.laneStates) {
      lane.extraState = LaneExtraState(
        trainingClassicRaceExtraState: TrainingClassicRaceExtraState(
          autostartPending: true,
          timeIsCalculated: false,
        ),
      );
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
    // ignore: deprecated_member_use_from_same_package
    var newSettings = settings.deepCopy();
    newSettings.sound.volume =
        settings.sound.volume > 254 ? 254 : settings.sound.volume;
    return newSettings;
  }
  return settings;
}
