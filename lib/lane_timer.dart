import 'dart:async';
import 'package:logger/logger.dart';

class LaneTimer {
  late DateTime _startTime;
  bool _isRunning = false;
  final Logger logger = Logger();

  late Timer _timer;


  void start(Function(Duration) callback, [int updateInterval = 100]) {
    if (_isRunning) {
      _timer.cancel();
    }

    _startTime = DateTime.now();
    _isRunning = true;
    _timer = Timer.periodic(Duration(milliseconds: updateInterval), (Timer timer) {
      final DateTime now = DateTime.now();
      final Duration elapsed = now.difference(_startTime);
      callback(elapsed);
    });
  }

  void stop() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
    }
  }

  void reset() {
    _isRunning = false;
  }

  void cancel() {
    if (_isRunning) {
      _isRunning = false;
      _timer.cancel();
    }
  }


  bool get isRunning => _isRunning;
}
