import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioApiProvider = Provider<AudioApi>(
  (ref) {
    return AudioApi();
  });

class AudioApi {
  AudioApi();
  final _playerStart = AudioPlayer();
  final _playerRed = AudioPlayer();

  Future<void> playStartAudio() async {
    await _playerStart.setAsset('assets/audios/yoroshiku.mp3');
    await _playerStart.play();
  }

  Future<void> playRedAudio() async {
    await _playerRed.setAsset('assets/audios/bakuhatsu.mp3');
    await _playerRed.play();
  }
}