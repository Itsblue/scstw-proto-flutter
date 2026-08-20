import 'package:flutter_test/flutter_test.dart';
import 'package:scstw_lib/util.dart';

void main() {
  test('determineFeatures defaults to no versioned features', () {
    final features = determineFeatures(null);

    expect(features.settings.storeAsDefault, isFalse);
    expect(features.settings.stopwatch, isFalse);
    expect(features.settings.security, isFalse);
    expect(features.settings.muteInternalSpeaker, isFalse);
    expect(
      features.settings.trainingClassicRaceModeFalseStartBehavior,
      isFalse,
    );
    expect(features.settings.relayMode, isFalse);
    expect(features.settings.startOnReleaseMode, isFalse);
    expect(features.settings.raceModesRound, isFalse);
    expect(features.settings.raceModesRoundFinal2026, isFalse);
    expect(features.stopwatch.raceStateLaneExtraState, isFalse);
    expect(features.command.sayAtYourMarks, isFalse);
    expect(features.command.muteFalseStart, isFalse);
    expect(features.command.sayBackToPresentation, isFalse);
  });

  test('determineFeatures handles 1.1.0 feature set', () {
    final features = determineFeatures('v1.1.0');

    expect(features.settings.storeAsDefault, isTrue);
    expect(features.settings.stopwatch, isTrue);
    expect(features.settings.security, isTrue);
    expect(features.settings.muteInternalSpeaker, isTrue);
    expect(features.settings.trainingClassicRaceModeFalseStartBehavior, isTrue);
    expect(features.settings.relayMode, isFalse);
    expect(features.settings.startOnReleaseMode, isFalse);
    expect(features.settings.raceModesRound, isFalse);
    expect(features.settings.raceModesRoundFinal2026, isFalse);
    expect(features.stopwatch.raceStateLaneExtraState, isTrue);
    expect(features.command.sayAtYourMarks, isTrue);
    expect(features.command.muteFalseStart, isTrue);
    expect(features.command.sayBackToPresentation, isFalse);
  });

  test('determineFeatures handles 1.2.0 feature set with suffixes', () {
    final features = determineFeatures('v1.2.0-beta.1');

    expect(features.settings.storeAsDefault, isTrue);
    expect(features.settings.trainingClassicRaceModeFalseStartBehavior, isTrue);
    expect(features.settings.relayMode, isTrue);
    expect(features.settings.startOnReleaseMode, isTrue);
    expect(features.settings.raceModesRound, isFalse);
    expect(features.settings.raceModesRoundFinal2026, isFalse);
    expect(features.stopwatch.raceStateLaneExtraState, isTrue);
    expect(features.command.sayAtYourMarks, isTrue);
    expect(features.command.muteFalseStart, isTrue);
    expect(features.command.sayBackToPresentation, isFalse);
  });

  test('determineFeatures handles 1.3.0 feature set', () {
    final features = determineFeatures('1.3.0');

    expect(features.settings.storeAsDefault, isTrue);
    expect(
      features.settings.trainingClassicRaceModeFalseStartBehavior,
      isFalse,
    );
    expect(features.settings.relayMode, isTrue);
    expect(features.settings.startOnReleaseMode, isTrue);
    expect(features.settings.raceModesRound, isTrue);
    expect(features.settings.raceModesRoundFinal2026, isFalse);
    expect(features.stopwatch.raceStateLaneExtraState, isTrue);
    expect(features.command.sayAtYourMarks, isTrue);
    expect(features.command.muteFalseStart, isTrue);
    expect(features.command.sayBackToPresentation, isFalse);
  });

  test('determineFeatures handles 1.4.0 feature set', () {
    final features = determineFeatures('v1.4.0-rc.1');

    expect(features.settings.storeAsDefault, isTrue);
    expect(
      features.settings.trainingClassicRaceModeFalseStartBehavior,
      isFalse,
    );
    expect(features.settings.relayMode, isTrue);
    expect(features.settings.startOnReleaseMode, isTrue);
    expect(features.settings.raceModesRound, isTrue);
    expect(features.settings.raceModesRoundFinal2026, isTrue);
    expect(features.stopwatch.raceStateLaneExtraState, isTrue);
    expect(features.command.sayAtYourMarks, isTrue);
    expect(features.command.muteFalseStart, isTrue);
    expect(features.command.sayBackToPresentation, isTrue);
  });
}
