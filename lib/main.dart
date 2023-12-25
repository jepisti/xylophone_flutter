import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        body: SafeArea(
          child: Center(
            child: TextButton(
              onPressed: () async {
                AudioCache.instance = AudioCache(prefix: '');
                final player = AudioPlayer();
                await player.setVolume(1.0);
                //await player.play(AssetSource('/note1.wav'));
                await player.play(AssetSource('assets/note1.wav'));
              },
              child: const Text('Click me'),
            ),
          ),
        ),
      ),
    );
  }
}
