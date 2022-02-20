import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ImageAudio extends StatefulWidget {
  const ImageAudio({Key? key}) : super(key: key);

  @override
  _ImageAudioState createState() => _ImageAudioState();
}

class _ImageAudioState extends State<ImageAudio> {
  AudioPlayer audioPlayer = AudioPlayer();
  play() async {
    int result = await audioPlayer.play("pie.mp4");
    if (result == 1) {
      // success
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        play();
      },
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage(''),)
        ),
      ),
    );
  }
}
