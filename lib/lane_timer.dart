import 'dart:async';

class LaneTimer {
  final Stopwatch _stopwatch = Stopwatch();
  Duration _initialElapsed = Duration.zero;
  bool _isRunning = false;
  Timer? _timer;

  void start(
    void Function(Duration) callback, [
    int updateInterval = 100,
    Duration initialElapsed = Duration.zero,
  ]) {
    _timer?.cancel();
    _initialElapsed = initialElapsed;
    _stopwatch
      ..reset()
      ..start();
    _isRunning = true;
    _timer = Timer.periodic(
      Duration(milliseconds: updateInterval),
      (_) => callback(_initialElapsed + _stopwatch.elapsed),
    );
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _stopwatch.stop();
    _isRunning = false;
  }

  void reset() {
    stop();
    _stopwatch.reset();
    _initialElapsed = Duration.zero;
  }

  void cancel() {
    reset();
  }

  bool get isRunning => _isRunning;
}
