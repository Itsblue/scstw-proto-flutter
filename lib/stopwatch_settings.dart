import 'package:scstw_lib/proto_out/Settings.pb.dart';

/// The stopwatch modes supported by [StopwatchSettings].
enum StopwatchMode {
  competitionClassicRaceMode,
  trainingClassicRaceMode,
  competitionRelayMode,
  trainingStartOnReleaseMode,
}

/// Returns the active mode, or `null` when no stopwatch mode is set.
StopwatchMode? stopwatchModeOf(StopwatchSettings? settings) {
  if (settings == null) return null;

  return switch (settings.whichMode()) {
    StopwatchSettings_Mode.competitionClassicRaceMode =>
      StopwatchMode.competitionClassicRaceMode,
    StopwatchSettings_Mode.trainingClassicRaceMode =>
      StopwatchMode.trainingClassicRaceMode,
    StopwatchSettings_Mode.competitionRelayMode =>
      StopwatchMode.competitionRelayMode,
    StopwatchSettings_Mode.trainingStartOnReleaseMode =>
      StopwatchMode.trainingStartOnReleaseMode,
    StopwatchSettings_Mode.notSet => null,
  };
}

/// Changes the mode of the mutable [newSettings] draft.
///
/// Values that are shared between modes are read from the confirmed
/// [currentSettings] snapshot. Returns `true` when the draft changed and
/// `false` when the requested update is a no-op.
bool updateStopwatchMode({
  required StopwatchSettings? currentSettings,
  required StopwatchSettings? newSettings,
  required StopwatchMode? mode,
}) {
  if (mode == null || newSettings == null) return false;
  if (stopwatchModeOf(newSettings) == mode) return false;

  final currentSayReady = _sayReadyOf(currentSettings) ?? true;
  final currentRound =
      _competitionRoundOf(currentSettings) ?? CompetitionRound.QUALIFICATION;

  // Assigning a protobuf oneof member clears the previously selected mode.
  switch (mode) {
    case StopwatchMode.competitionClassicRaceMode:
      final competitionClassicRaceMode = CompetitionClassicRaceMode(
        manualStartProcedure: ManualStartProcedure(sayReady: currentSayReady),
        round: currentRound,
      );

      newSettings.competitionClassicRaceMode = competitionClassicRaceMode;
    case StopwatchMode.trainingClassicRaceMode:
      final trainingClassicRaceMode = TrainingClassicRaceMode(
        startProcedure: StartProcedure(
          automatedStartProcedure: AutomatedStartProcedure(
            sayReady: currentSayReady,
            autoReset: true,
            standstillDurationBeforeStart: 3000,
          ),
        ),
        lanes: List.generate(4, (_) => LaneSettings(disabled: false)),
        falseStartSettings: FalseStartSettings(
          soundDuration: 3000,
          assumedReactionTime: 100,
        ),
        indicatorSettings: IndicatorSettings(
          brightness: 254,
          turnOffWhenFalseStartSoundIsMuted: false,
          turnOffWhenIdle: false,
        ),
        round: currentRound,
      );

      newSettings.trainingClassicRaceMode = trainingClassicRaceMode;
    case StopwatchMode.competitionRelayMode:
      final competitionRelayMode = CompetitionRelayMode(
        manualStartProcedure: ManualStartProcedure(sayReady: currentSayReady),
        round: currentRound,
      );

      newSettings.competitionRelayMode = competitionRelayMode;
    case StopwatchMode.trainingStartOnReleaseMode:
      final trainingStartOnReleaseMode = TrainingStartOnReleaseMode();

      newSettings.trainingStartOnReleaseMode = trainingStartOnReleaseMode;
  }

  return true;
}

bool? _sayReadyOf(StopwatchSettings? settings) {
  if (settings == null) return null;

  if (settings.hasCompetitionClassicRaceMode() &&
      settings.competitionClassicRaceMode.hasManualStartProcedure() &&
      settings.competitionClassicRaceMode.manualStartProcedure.hasSayReady()) {
    return settings.competitionClassicRaceMode.manualStartProcedure.sayReady;
  }

  if (settings.hasTrainingClassicRaceMode() &&
      settings.trainingClassicRaceMode.hasStartProcedure() &&
      settings.trainingClassicRaceMode.startProcedure
          .hasManualStartProcedure() &&
      settings.trainingClassicRaceMode.startProcedure.manualStartProcedure
          .hasSayReady()) {
    return settings
        .trainingClassicRaceMode
        .startProcedure
        .manualStartProcedure
        .sayReady;
  }

  if (settings.hasTrainingClassicRaceMode() &&
      settings.trainingClassicRaceMode.hasStartProcedure() &&
      settings.trainingClassicRaceMode.startProcedure
          .hasAutomatedStartProcedure() &&
      settings.trainingClassicRaceMode.startProcedure.automatedStartProcedure
          .hasSayReady()) {
    return settings
        .trainingClassicRaceMode
        .startProcedure
        .automatedStartProcedure
        .sayReady;
  }

  if (settings.hasCompetitionRelayMode() &&
      settings.competitionRelayMode.hasManualStartProcedure() &&
      settings.competitionRelayMode.manualStartProcedure.hasSayReady()) {
    return settings.competitionRelayMode.manualStartProcedure.sayReady;
  }

  return null;
}

CompetitionRound? _competitionRoundOf(StopwatchSettings? settings) {
  if (settings == null) return null;

  if (settings.hasTrainingClassicRaceMode() &&
      settings.trainingClassicRaceMode.hasRound()) {
    return settings.trainingClassicRaceMode.round;
  }

  if (settings.hasCompetitionClassicRaceMode() &&
      settings.competitionClassicRaceMode.hasRound()) {
    return settings.competitionClassicRaceMode.round;
  }

  if (settings.hasCompetitionRelayMode() &&
      settings.competitionRelayMode.hasRound()) {
    return settings.competitionRelayMode.round;
  }

  return null;
}
