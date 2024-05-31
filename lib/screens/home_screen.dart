import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wavenet/wavenet.dart';

import '../env/env.dart';
import '../services/speech_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final speechService = SpeechService();

  final TextToSpeechService textToSpeechService = TextToSpeechService(Env.apiKey);

  final audioPlayer = AudioPlayer();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              speechService.getCharacterName()!.toUpperCase(),
              style: const TextStyle(fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              speechService.getCharacterText()!,
              style: const TextStyle(fontSize: 17.5, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playDemo,
        tooltip: 'Play Demo',
        child: const Icon(Icons.arrow_right_alt_outlined),
      ),
    );
  }

  ///
  Future<void> _playDemo() async {
    setState(() {
      if (speechService.isFinished() != true) {
        speechService.nextQuestion();
      } else {
        speechService.reset();
      }
    });

    var file = File('');

    switch (speechService.getCharacterName()) {
      case 'jap1':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Standard-A',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );
        break;

      case 'jap2':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Standard-B',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );
        break;

      case 'jap3':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Standard-C',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );
        break;

      case 'jap4':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Standard-D',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );
        break;

      case 'jap5':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Wavenet-A',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );
        break;

      case 'jap6':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Wavenet-B',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );
        break;

      case 'jap7':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Wavenet-C',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );
        break;

      case 'jap8':
        file = await textToSpeechService.textToSpeech(
          text: speechService.getCharacterText().toString(),
          voiceName: 'ja-JP-Wavenet-D',
          languageCode: 'ja-JP',
          audioEncoding: 'LINEAR16',
          pitch: -7,
          speakingRate: 1.2,
        );

        break;

      default:
        break;
    }

    getAudioPlayer(file.path);
  }

  ///
  void getAudioPlayer(dynamic file) {
    audioPlayer.play(DeviceFileSource(file));
  }
}
