import 'package:flutter_test/flutter_test.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';
import 'package:scstw_lib/race_timing.dart';

void main() {
  group('synchronizedRaceElapsedMilliseconds', () {
    test('uses the fallback when currentTime is not positive', () {
      expect(synchronizedRaceElapsedMilliseconds(0), 100);
      expect(synchronizedRaceElapsedMilliseconds(-1), 100);
    });

    test('removes the start sequence and applies clock compensation', () {
      expect(synchronizedRaceElapsedMilliseconds(4500), 1540);
      expect(synchronizedRaceElapsedMilliseconds(3000), 40);
      expect(synchronizedRaceElapsedMilliseconds(1000), -1960);
    });
  });

  group('calculateLaneTiming', () {
    test('uses and truncates live time for a running lane', () {
      final timing = calculateLaneTiming(
        LaneFullState(state: LaneFullState_State.RUNNING),
        const Duration(milliseconds: 1549),
      );

      expect(timing.primaryTimeMilliseconds, 1500);
    });

    test('uses recorded climbing time for a finished lane', () {
      final timing = calculateLaneTiming(
        LaneFullState(state: LaneFullState_State.FINISHED, climbingTime: 1234),
        const Duration(milliseconds: 5000),
      );

      expect(timing.primaryTimeMilliseconds, 1234);
    });

    test('calculates time from a startpad release and truncates it', () {
      final timing = calculateLaneTiming(
        LaneFullState(
          state: LaneFullState_State.RUNNING,
          extraState: LaneExtraState(
            trainingStartOnReleaseExtraState: TrainingStartOnReleaseExtraState(
              startedAt: 4000,
            ),
          ),
        ),
        const Duration(milliseconds: 2549),
      );

      expect(timing.primaryTimeMilliseconds, 1500);
    });

    test('uses recorded time for a finished start-on-release lane', () {
      final timing = calculateLaneTiming(
        LaneFullState(
          state: LaneFullState_State.FINISHED,
          climbingTime: 2345,
          extraState: LaneExtraState(
            trainingStartOnReleaseExtraState: TrainingStartOnReleaseExtraState(
              startedAt: 3500,
            ),
          ),
        ),
        null,
      );

      expect(timing.primaryTimeMilliseconds, 2345);
    });

    test('does not apply the running offset to an idle lane', () {
      final timing = calculateLaneTiming(
        LaneFullState(
          state: LaneFullState_State.IDLE,
          extraState: LaneExtraState(
            trainingStartOnReleaseExtraState: TrainingStartOnReleaseExtraState(
              startedAt: 2500,
            ),
          ),
        ),
        const Duration(milliseconds: 149),
      );

      expect(timing.primaryTimeMilliseconds, 0);
    });

    test('subtracts the start sequence from reaction times', () {
      final timing = calculateLaneTiming(
        LaneFullState(reactionTime: 3123),
        null,
      );

      expect(timing.reactionTimeMilliseconds, 123);
    });

    test('calculates recorded relay reaction and climbing splits', () {
      final timing = calculateLaneTiming(
        LaneFullState(
          reactionTime: 3100,
          climbingTime: 12345,
          extraState: LaneExtraState(
            competitionRelayExtraState: CompetitionRelayExtraState(
              firstLaneClimbingTime: 5000,
              secondLaneReactionTime: 3200,
            ),
          ),
        ),
        null,
      );

      expect(timing.reactionTimeMilliseconds, 100);
      expect(timing.relay, isNotNull);
      expect(timing.relay!.secondReactionTimeMilliseconds, 200);
      expect(timing.relay!.showClimbingTimes, isTrue);
      expect(timing.relay!.firstClimbingTimeMilliseconds, 5000);
      expect(timing.relay!.secondClimbingTimeMilliseconds, 7345);
    });

    test('calculates a live second relay climbing time', () {
      final timing = calculateLaneTiming(
        LaneFullState(
          state: LaneFullState_State.RUNNING,
          extraState: LaneExtraState(
            competitionRelayExtraState: CompetitionRelayExtraState(
              firstLaneClimbingTime: 5000,
            ),
          ),
        ),
        const Duration(milliseconds: 7250),
      );

      expect(timing.relay!.secondReactionTimeMilliseconds, 0);
      expect(timing.relay!.showClimbingTimes, isTrue);
      expect(timing.relay!.firstClimbingTimeMilliseconds, 5000);
      expect(timing.relay!.secondClimbingTimeMilliseconds, 2250);
    });

    test('uses live time for the first relay climber', () {
      final timing = calculateLaneTiming(
        LaneFullState(
          state: LaneFullState_State.RUNNING,
          extraState: LaneExtraState(
            competitionRelayExtraState: CompetitionRelayExtraState(),
          ),
        ),
        const Duration(milliseconds: 2250),
      );

      expect(timing.relay!.showClimbingTimes, isTrue);
      expect(timing.relay!.firstClimbingTimeMilliseconds, 2250);
      expect(timing.relay!.secondClimbingTimeMilliseconds, 0);
    });

    test('hides empty relay climbing times', () {
      final timing = calculateLaneTiming(
        LaneFullState(
          extraState: LaneExtraState(
            competitionRelayExtraState: CompetitionRelayExtraState(),
          ),
        ),
        null,
      );

      expect(timing.relay!.showClimbingTimes, isFalse);
    });
  });
}
