import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lt_sample_app/audio_api.dart';

final timeControllerProvider = StateNotifierProvider<TimeController, DateTime>(
  (ref) {
    final audioApi = ref.watch(audioApiProvider);
    return TimeController(audioApi);
  }
);

class TimeController extends StateNotifier<DateTime> {
  TimeController(this._audioApi) : super(DateTime.utc(0, 0, 0));
  final AudioApi _audioApi;
  Timer? _timer;
  final orangeTime = DateTime.utc(0, 0, 0, 0, 1);
  final redTime = DateTime.utc(0, 0, 0, 0, 2);

  void reset() {
    state = DateTime.utc(0, 0, 0);
    _timer?.cancel();
  }

  void start() {
    reset();
    _audioApi.playStartAudio();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        state = state.add(const Duration(seconds: 1)); 

        if (state.isAtSameMomentAs(redTime)) {
          _audioApi.playRedAudio();
        }
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

  double get faceSize {
    if (state.isAfter(redTime)) return 180;

    final stateSeconds = state.minute * 60 + state.second;
    return stateSeconds / 3;
  }
}
