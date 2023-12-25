import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> playSound(int soundNumber) async {
    AudioCache.instance = AudioCache(prefix: '');
    final player = AudioPlayer();
    await player.setVolume(1.0);
    await player.play(AssetSource('assets/note$soundNumber.wav'));
  }

  Expanded buildKey(
      {required int soundNum,
      required Color foreColor,
      required Color backColor}) {
    return Expanded(
      child: TextButton(
        onPressed: () async {
          playSound(soundNum);
        },
        style: TextButton.styleFrom(
          foregroundColor: foreColor,
          backgroundColor: backColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 5.0,
          ),
        ),
        child: const Text('Click me'),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildKey(
                    soundNum: 1,
                    foreColor: Colors.teal,
                    backColor: Colors.amber),
                buildKey(
                    soundNum: 2,
                    foreColor: Colors.white,
                    backColor: Colors.blueGrey),
                buildKey(
                    soundNum: 3,
                    foreColor: Colors.black26,
                    backColor: Colors.blue),
                buildKey(
                    soundNum: 4,
                    foreColor: Colors.black,
                    backColor: Colors.amberAccent),
                buildKey(
                    soundNum: 5, foreColor: Colors.red, backColor: Colors.blue),
                buildKey(
                    soundNum: 6,
                    foreColor: Colors.white,
                    backColor: Colors.indigo),
                buildKey(
                    soundNum: 7,
                    foreColor: Colors.teal,
                    backColor: Colors.yellowAccent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
