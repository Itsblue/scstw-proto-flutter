import 'package:scstw_lib/proto_out/RaceState.pb.dart';

const startSequenceDurationMilliseconds = 3000;
const raceClockCompensationMilliseconds = 40;
const fallbackRunningTimeMilliseconds = 100;
const liveTimeDisplayResolutionMilliseconds = 100;

/// Converts the base station's race timestamp into the elapsed climbing time
/// used to initialize the local race clock.
int synchronizedRaceElapsedMilliseconds(int currentTime) {
  if (currentTime <= 0) return fallbackRunningTimeMilliseconds;

  return currentTime -
      startSequenceDurationMilliseconds +
      raceClockCompensationMilliseconds;
}

class RelayLaneTiming {
  final int secondReactionTimeMilliseconds;
  final bool showClimbingTimes;
  final int firstClimbingTimeMilliseconds;
  final int secondClimbingTimeMilliseconds;

  const RelayLaneTiming({
    required this.secondReactionTimeMilliseconds,
    required this.showClimbingTimes,
    required this.firstClimbingTimeMilliseconds,
    required this.secondClimbingTimeMilliseconds,
  });
}

class LaneTiming {
  final int primaryTimeMilliseconds;
  final int? reactionTimeMilliseconds;
  final RelayLaneTiming? relay;

  const LaneTiming({
    required this.primaryTimeMilliseconds,
    required this.reactionTimeMilliseconds,
    required this.relay,
  });
}

/// Calculates all mode-specific lane times without applying UI formatting.
LaneTiming calculateLaneTiming(LaneFullState lane, Duration? liveRaceTime) {
  final liveRaceTimeMilliseconds = liveRaceTime?.inMilliseconds;
  final laneIsRunning =
      lane.state == LaneFullState_State.RUNNING_FOOT_DOWN ||
      lane.state == LaneFullState_State.RUNNING;
  final startOnReleaseState =
      lane.hasExtraState() &&
              lane.extraState.hasTrainingStartOnReleaseExtraState()
          ? lane.extraState.trainingStartOnReleaseExtraState
          : null;
  final timeSinceRaceStart =
      laneIsRunning && liveRaceTimeMilliseconds != null
          ? liveRaceTimeMilliseconds
          : lane.climbingTime;

  var primaryTime = timeSinceRaceStart;
  if (laneIsRunning &&
      liveRaceTimeMilliseconds != null &&
      startOnReleaseState != null) {
    primaryTime = _truncateToDisplayResolution(
      liveRaceTimeMilliseconds +
          startSequenceDurationMilliseconds -
          startOnReleaseState.startedAt,
    );
  } else if (laneIsRunning && liveRaceTimeMilliseconds != null) {
    primaryTime = _truncateToDisplayResolution(timeSinceRaceStart);
  }

  final reactionTime =
      lane.reactionTime > 0
          ? lane.reactionTime - startSequenceDurationMilliseconds
          : null;

  RelayLaneTiming? relayTiming;
  if (lane.hasExtraState() && lane.extraState.hasCompetitionRelayExtraState()) {
    final relay = lane.extraState.competitionRelayExtraState;
    final firstLaneClimbingTime = relay.firstLaneClimbingTime;
    final currentLiveRaceTime = liveRaceTimeMilliseconds ?? 0;
    final showClimbingTimes =
        currentLiveRaceTime != 0 ||
        lane.climbingTime != 0 ||
        firstLaneClimbingTime != 0;

    final displayedFirstLaneClimbingTime =
        firstLaneClimbingTime != 0
            ? firstLaneClimbingTime
            : currentLiveRaceTime != 0
            ? currentLiveRaceTime
            : 0;

    final secondLaneClimbingTime =
        lane.climbingTime != 0
            ? lane.climbingTime - firstLaneClimbingTime
            : firstLaneClimbingTime != 0 && currentLiveRaceTime != 0
            ? currentLiveRaceTime - firstLaneClimbingTime
            : 0;

    relayTiming = RelayLaneTiming(
      secondReactionTimeMilliseconds:
          relay.secondLaneReactionTime > 0
              ? relay.secondLaneReactionTime - startSequenceDurationMilliseconds
              : 0,
      showClimbingTimes: showClimbingTimes,
      firstClimbingTimeMilliseconds: displayedFirstLaneClimbingTime,
      secondClimbingTimeMilliseconds: secondLaneClimbingTime,
    );
  }

  return LaneTiming(
    primaryTimeMilliseconds: primaryTime,
    reactionTimeMilliseconds: reactionTime,
    relay: relayTiming,
  );
}

int _truncateToDisplayResolution(int milliseconds) {
  return (milliseconds ~/ liveTimeDisplayResolutionMilliseconds) *
      liveTimeDisplayResolutionMilliseconds;
}
