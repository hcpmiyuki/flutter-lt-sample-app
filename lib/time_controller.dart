import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeControllerProvider = StateNotifierProvider<TimeController, DateTime>(
  (ref) {
    return TimeController();
  }
);

class TimeController extends StateNotifier<DateTime> {
  TimeController() : super(DateTime.utc(0, 0, 0));
  Timer? _timer;

  void reset() {
    state = DateTime.utc(0, 0, 0);
    _timer?.cancel();
  }

  void start() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        state = state.add(const Duration(seconds: 1));  
      },
    );
  }

  @override
  void dispose() {
    reset();
    super.dispose();
  }
}
