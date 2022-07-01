import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final timeControllerProvider = StateNotifierProvider<TimeController, DateTime>(
  (ref) {
    return TimeController();
  }
);

class TimeController extends StateNotifier<DateTime> {
  TimeController() : super(DateTime.utc(0, 0, 0));
  Timer? _timer;
  final orangeTime = DateTime.utc(0, 0, 0, 0, 1);
  final redTime = DateTime.utc(0, 0, 0, 0, 2);

  void reset() {
    state = DateTime.utc(0, 0, 0);
    _timer?.cancel();
  }

  void start() {
    reset();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        state = state.add(const Duration(seconds: 1));  
      },
    );
  }

  Color get timeTextColor {
    if (state.isAfter(redTime)) {
      return Colors.red;
    } else if (state.isAfter(orangeTime)) {
      return Colors.orange;
    }
    return Colors.black;
  }
}
