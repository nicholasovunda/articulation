import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:audioplayers/audioplayers.dart';
final pathToSave = '/storage/emulated/0/';

class SoundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialized = false;

  bool get isRecording => _audioRecorder!.isRecording;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();
      final status = await Permission.microphone.request();
      if(status != PermissionStatus.granted){
        throw RecordingPermissionException("Microphone Permission not granted");

      }
      _audioRecorder!.openRecorder();
      _isRecorderInitialized = true;
      await _audioRecorder!.setSubscriptionDuration(const Duration(milliseconds: (1)));
    }
    void dispose() {
      if(!_isRecorderInitialized) return;
      _audioRecorder!.closeRecorder();
      _audioRecorder = null;
      _isRecorderInitialized = false;
    }

    Future _record() async{
      if(!_isRecorderInitialized) return;
      await _audioRecorder!.startRecorder(toFile: pathToSave);

    }

    Future _stop() async{
      if(!_isRecorderInitialized) return;
      await _audioRecorder!.stopRecorder();
    }
    Future toggleRecorder() async{
      if(_audioRecorder!.isStopped){
        await _record();
      }else{
        _stop();
      }
    }
  }
