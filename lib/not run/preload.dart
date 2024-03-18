import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayNoteScreen(),
    );
  }
}

class PlayNoteScreen extends StatefulWidget {
  @override
  _PlayNoteScreenState createState() => _PlayNoteScreenState();
}

class _PlayNoteScreenState extends State<PlayNoteScreen> {
  final Map<String, String> noteMap = {
    'c': 'notes/c3.mp3',
    'd': 'notes/d3.mp3',
    'e': 'notes/e3.mp3',
    'f': 'notes/f3.mp3',
  };


  final audioPlayer = AudioPlayer();

  void playNote(String note) async {
    String? audioFile = noteMap[note.toLowerCase()];
    if (audioFile != null) {
      audioPlayer.play(AssetSource(audioFile));
      //audioCache.play(audioFile);
      print('Note $note is playing.');
    } else {
      print('Note $note not found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Note'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter a note (e.g., c, d, e, f):',
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                // Optionally, you can add validation here
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call playNote method when the button is pressed
                String note = 'd'; // Example default value
                playNote(note);
              },
              child: Text('Play Note'),
            ),
          ],
        ),
      ),
    );
  }
}

