// import 'dart:async';
// import 'dart:core';
//
//
// import 'package:audioplayers/audioplayers.dart';
//
// class AudioAssetPlayer{
//   final String filename;
//   final _progressStreamController = StreamController<double>();
//
//   late final AudioPlayer _audioPlayer;
//   late final StreamSubscription _progressSubscription;
//   late final int _audioDurationMS;
//
//   Stream<double> get progressStream => _progressStreamController.stream;
//   Stream<PlayerState> get stateStream =>_audioPlayer.onPlayerStateChanged;
//
//   AudioAssetPlayer(this.filename);
//
//   Future<void> int() async {
//     _audioPlayer = await AudioCache().play(filename);
//
//     await Future.delayed(const Duration(milliseconds: 200));
//
//     _audioDurationMS = await _audioPlayer.getDuration();
//
//     await _audioPlayer.stop();
//
//     _progressStreamController.add(0.0);
//
//     _progressSubscription = _audioPlayer.onAudioPositionChanged.listen((duration) => _progressStreamController.add(duration.inMilliseconds / _audioDurationMS)
//     );
//     Future<void> dispose() => Future.wait([
//       _audioPlayer.dispose(),
//       _progressStreamController.close(),
//       _progressSubscription.cancel(),
//     ]);
//
//     Future<void> play() => _audioPlayer.resume();
//     Future<void> pause() => _audioPlayer.pause();
//
//     Future<void> reset() async {
//       await _audioPlayer.stop();
//       _progressStreamController.add(0.0);
//     }
//   }
// }
//
//
