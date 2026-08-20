import 'package:flutter_test/flutter_test.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';
import 'package:scstw_lib/stopwatch_settings.dart';

void main() {
  group('stopwatchModeOf', () {
    final modes = <StopwatchMode, StopwatchSettings>{
      StopwatchMode.competitionClassicRaceMode: StopwatchSettings(
        competitionClassicRaceMode: CompetitionClassicRaceMode(),
      ),
      StopwatchMode.trainingClassicRaceMode: StopwatchSettings(
        trainingClassicRaceMode: TrainingClassicRaceMode(),
      ),
      StopwatchMode.competitionRelayMode: StopwatchSettings(
        competitionRelayMode: CompetitionRelayMode(),
      ),
      StopwatchMode.trainingStartOnReleaseMode: StopwatchSettings(
        trainingStartOnReleaseMode: TrainingStartOnReleaseMode(),
      ),
    };

    for (final MapEntry(key: mode, value: settings) in modes.entries) {
      test('detects ${mode.name}', () {
        expect(stopwatchModeOf(settings), mode);
      });
    }

    test('returns null when settings or mode is absent', () {
      expect(stopwatchModeOf(null), isNull);
      expect(stopwatchModeOf(StopwatchSettings()), isNull);
    });
  });

  group('updateStopwatchMode', () {
    test('does nothing when mode or draft settings is absent', () {
      final draft = StopwatchSettings(
        competitionClassicRaceMode: CompetitionClassicRaceMode(),
      );
      final before = draft.writeToBuffer();

      expect(
        updateStopwatchMode(
          currentSettings: StopwatchSettings(),
          newSettings: draft,
          mode: null,
        ),
        isFalse,
      );
      expect(draft.writeToBuffer(), before);
      expect(
        updateStopwatchMode(
          currentSettings: StopwatchSettings(),
          newSettings: null,
          mode: StopwatchMode.trainingClassicRaceMode,
        ),
        isFalse,
      );
    });

    test('does not mutate or report a change for the pending mode', () {
      final draft = StopwatchSettings(
        competitionClassicRaceMode: CompetitionClassicRaceMode(
          manualStartProcedure: ManualStartProcedure(sayReady: false),
          round: CompetitionRound.FINAL,
        ),
      );
      final before = draft.writeToBuffer();

      final changed = updateStopwatchMode(
        currentSettings: StopwatchSettings(),
        newSettings: draft,
        mode: StopwatchMode.competitionClassicRaceMode,
      );

      expect(changed, isFalse);
      expect(draft.writeToBuffer(), before);
    });

    test('creates training mode with the exact defaults', () {
      final current = StopwatchSettings(
        competitionClassicRaceMode: CompetitionClassicRaceMode(
          manualStartProcedure: ManualStartProcedure(sayReady: false),
          round: CompetitionRound.FINAL,
        ),
      );
      final currentBefore = current.writeToBuffer();
      final draft = StopwatchSettings(
        competitionClassicRaceMode: CompetitionClassicRaceMode(),
      );

      final changed = updateStopwatchMode(
        currentSettings: current,
        newSettings: draft,
        mode: StopwatchMode.trainingClassicRaceMode,
      );
      final training = draft.trainingClassicRaceMode;

      expect(changed, isTrue);
      expect(stopwatchModeOf(draft), StopwatchMode.trainingClassicRaceMode);
      expect(training.startProcedure.hasAutomatedStartProcedure(), isTrue);
      expect(training.startProcedure.automatedStartProcedure.sayReady, isFalse);
      expect(training.startProcedure.automatedStartProcedure.autoReset, isTrue);
      expect(
        training
            .startProcedure
            .automatedStartProcedure
            .standstillDurationBeforeStart,
        3000,
      );
      expect(training.lanes, hasLength(4));
      expect(training.lanes.every((lane) => !lane.disabled), isTrue);
      expect(training.falseStartSettings.soundDuration, 3000);
      expect(training.falseStartSettings.assumedReactionTime, 100);
      expect(training.falseStartSettings.hasBehaviour(), isFalse);
      expect(training.indicatorSettings.brightness, 254);
      expect(
        training.indicatorSettings.turnOffWhenFalseStartSoundIsMuted,
        isFalse,
      );
      expect(training.indicatorSettings.turnOffWhenIdle, isFalse);
      expect(training.round, CompetitionRound.FINAL);
      expect(current.writeToBuffer(), currentBefore);
    });

    final sayReadySources = <String, StopwatchSettings>{
      'competition classic manual': StopwatchSettings(
        competitionClassicRaceMode: CompetitionClassicRaceMode(
          manualStartProcedure: ManualStartProcedure(sayReady: false),
        ),
      ),
      'training classic manual': StopwatchSettings(
        trainingClassicRaceMode: TrainingClassicRaceMode(
          startProcedure: StartProcedure(
            manualStartProcedure: ManualStartProcedure(sayReady: false),
          ),
        ),
      ),
      'training classic automated': StopwatchSettings(
        trainingClassicRaceMode: TrainingClassicRaceMode(
          startProcedure: StartProcedure(
            automatedStartProcedure: AutomatedStartProcedure(sayReady: false),
          ),
        ),
      ),
      'competition relay manual': StopwatchSettings(
        competitionRelayMode: CompetitionRelayMode(
          manualStartProcedure: ManualStartProcedure(sayReady: false),
        ),
      ),
    };

    for (final MapEntry(key: sourceName, value: current)
        in sayReadySources.entries) {
      test('preserves sayReady from $sourceName', () {
        final target =
            stopwatchModeOf(current) == StopwatchMode.competitionClassicRaceMode
                ? StopwatchMode.competitionRelayMode
                : StopwatchMode.competitionClassicRaceMode;
        final draft = StopwatchSettings(
          trainingStartOnReleaseMode: TrainingStartOnReleaseMode(),
        );

        expect(
          updateStopwatchMode(
            currentSettings: current,
            newSettings: draft,
            mode: target,
          ),
          isTrue,
        );

        final sayReady =
            target == StopwatchMode.competitionClassicRaceMode
                ? draft.competitionClassicRaceMode.manualStartProcedure.sayReady
                : draft.competitionRelayMode.manualStartProcedure.sayReady;
        expect(sayReady, isFalse);
      });
    }

    test('preserves round for competition and relay modes', () {
      final sources = [
        StopwatchSettings(
          trainingClassicRaceMode: TrainingClassicRaceMode(
            round: CompetitionRound.FINAL,
          ),
        ),
        StopwatchSettings(
          competitionClassicRaceMode: CompetitionClassicRaceMode(
            round: CompetitionRound.FINAL,
          ),
        ),
        StopwatchSettings(
          competitionRelayMode: CompetitionRelayMode(
            round: CompetitionRound.FINAL,
          ),
        ),
      ];

      for (final current in sources) {
        final draft = StopwatchSettings(
          trainingStartOnReleaseMode: TrainingStartOnReleaseMode(),
        );
        updateStopwatchMode(
          currentSettings: current,
          newSettings: draft,
          mode: StopwatchMode.competitionClassicRaceMode,
        );
        expect(draft.competitionClassicRaceMode.round, CompetitionRound.FINAL);
      }
    });

    test('uses the provided fallbacks when values are absent', () {
      final draft = StopwatchSettings(
        trainingStartOnReleaseMode: TrainingStartOnReleaseMode(),
      );

      updateStopwatchMode(
        currentSettings: StopwatchSettings(),
        newSettings: draft,
        mode: StopwatchMode.competitionClassicRaceMode,
      );

      final competition = draft.competitionClassicRaceMode;
      expect(competition.manualStartProcedure.sayReady, isTrue);
      expect(competition.round, CompetitionRound.QUALIFICATION);
    });

    test('creates relay mode and clears every other mode', () {
      final draft = StopwatchSettings(
        trainingClassicRaceMode: TrainingClassicRaceMode(),
      );

      updateStopwatchMode(
        currentSettings: StopwatchSettings(
          competitionClassicRaceMode: CompetitionClassicRaceMode(
            manualStartProcedure: ManualStartProcedure(sayReady: false),
            round: CompetitionRound.FINAL,
          ),
        ),
        newSettings: draft,
        mode: StopwatchMode.competitionRelayMode,
      );

      expect(stopwatchModeOf(draft), StopwatchMode.competitionRelayMode);
      expect(draft.competitionRelayMode.manualStartProcedure.sayReady, isFalse);
      expect(draft.competitionRelayMode.round, CompetitionRound.FINAL);
      expect(draft.hasCompetitionClassicRaceMode(), isFalse);
      expect(draft.hasTrainingClassicRaceMode(), isFalse);
      expect(draft.hasTrainingStartOnReleaseMode(), isFalse);
    });

    test('creates an empty start-on-release mode', () {
      final draft = StopwatchSettings(
        competitionRelayMode: CompetitionRelayMode(),
      );

      updateStopwatchMode(
        currentSettings: StopwatchSettings(),
        newSettings: draft,
        mode: StopwatchMode.trainingStartOnReleaseMode,
      );

      expect(stopwatchModeOf(draft), StopwatchMode.trainingStartOnReleaseMode);
      expect(draft.trainingStartOnReleaseMode.hasIndicatorSettings(), isFalse);
      expect(draft.hasCompetitionClassicRaceMode(), isFalse);
      expect(draft.hasTrainingClassicRaceMode(), isFalse);
      expect(draft.hasCompetitionRelayMode(), isFalse);
    });
  });
}
