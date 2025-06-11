

import 'package:flutter/foundation.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';

import 'lane_timer.dart';

class Progress {
  double _progress = 0.0;
  final LaneTimer _timer = LaneTimer();
  Iterable<bool> oldLaneAutostartPending = [];


  void stateUpdate(RaceFullState newFullState, double standstillDurationBeforeStart, Function(double) callback) {
    Iterable<bool> currentLaneAutostartPending = newFullState.laneStates.map((laneState) =>
      laneState.extraState.trainingClassicRaceExtraState.autostartPending);

    _timer.cancel();
    _progress = 0.0;
    callback(_progress);

    if (currentLaneAutostartPending.any((element) => element) && !listEquals(oldLaneAutostartPending.toList(), currentLaneAutostartPending.toList())) {
      _timer.start((elapsed) {
        _progress = elapsed.inMilliseconds / standstillDurationBeforeStart;
        callback(_progress);
      }, 10);
    }
    oldLaneAutostartPending = currentLaneAutostartPending;
  }

  double get progress => _progress;
}