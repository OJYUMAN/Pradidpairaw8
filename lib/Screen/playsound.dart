import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import '../FirebaseAction.dart';
import '../UiFunc.dart';
import '../variable.dart';
import 'dart:html' as html;




Stopwatch stopwatch = Stopwatch();
late Timer _timer;
var MT = 250; //1000milisec/4

void playsound(){
  stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: MT), (timer) {
    ppcolor = Color.fromRGBO(103, 164, 255, 0.7019607843137254);
    newcursor();
    refreshui();

    playNote(labelarr[ppcount.toInt()]);
    //invertnotetonumbernew(labelarr[ppcount.toInt()]);
    ppcount += 1; //1
  });
}

void stop() {
  //showpp1 = false;
  //ppcolor = Colors.yellow;
  ppcolor = Color.fromRGBO(255, 228, 103, 0.7);
  stopwatch.stop();
  _timer.cancel();
}

// void invertnotetonumbernew(x) {
//   //ทําแบบใหม่รวมโน้ตของทุ้มและเอก
//   var i = 0;
//
//   if (x == 'มฺ') {
//     i = 0;
//   } else if (x == 'ฟฺ') {
//     i = 1;
//   } else if (x == 'ซฺ') {
//     i = 2;
//   } else if (x == 'ลฺ') {
//     i = 3;
//   } else if (x == 'ทฺ') {
//     i = 4;
//   } else if (x == 'ด') {
//     audioPlayer.play(AssetSource('notes/c3.mp3'));
//   } else if (x == 'ร') {
//     audioPlayer2.play(AssetSource('notes/d3.mp3'));
//   } else if (x == 'ม') {
//     audioPlayer3.play(AssetSource('notes/e3.mp3'));
//   } else if (x == 'ฟ') {
//     audioPlayer4.play(AssetSource('notes/f3.mp3'));
//   } else if (x == 'ซ') {
//     audioPlayer5.play(AssetSource('notes/g3.mp3'));
//   } else if (x == 'ล') {
//     audioPlayer6.play(AssetSource('notes/a3.mp3'));
//   } else if (x == 'ท') {
//     audioPlayer7.play(AssetSource('notes/b3.mp3'));
//   } else if (x == 'ดํ') {
//     audioPlayer8.play(AssetSource('notes/c3.mp3'));
//   } else if (x == 'รํ') {
//     audioPlayer9.play(AssetSource('notes/d3.mp3'));
//   } else if (x == 'มํ') {
//     audioPlayer10.play(AssetSource('notes/e3.mp3'));
//   } else if (x == 'ฟํ') {
//     i = 15;
//   } else if (x == 'ซํ') {
//     i = 16;
//   } else {
//     i = -1; // หรือค่าเริ่มต้นที่คุณต้องการในกรณีอื่นๆ
//   }
//   //playRanatek(i);
//
// }

// void playRanatek(int noteIndex) async {
//
//     final audioPlayer = AudioPlayer();
//     final tj = allNotes[noteIndex]; //เปลี่ยนตัวเลขเป็นชื่อไฟล์
//     audioPlayer.play(AssetSource("Sound/$selectedInstrument2/$tj"));
//
// }
final audioPlayer = AudioPlayer();

// final audioPlayer2 = AudioPlayer();
// final audioPlayer3 = AudioPlayer();
// final audioPlayer4 = AudioPlayer();
// final audioPlayer5 = AudioPlayer();
// final audioPlayer6 = AudioPlayer();
// final audioPlayer7 = AudioPlayer();
// final audioPlayer8 = AudioPlayer();
// final audioPlayer9 = AudioPlayer();
// final audioPlayer10 = AudioPlayer();
// final audioPlayer11 = AudioPlayer();





void playRanatek(int noteIndex) async {
  var tj = piano[noteIndex];
  audioPlayer.play(AssetSource("notes/$tj"));

}

final Map<String, String> noteMap = {
  'ด': 'notes/c3.mp3',
  'ร': 'notes/d3.mp3',
  'ม': 'notes/e3.mp3',
  'ฟ': 'notes/f3.mp3',
  'ซ': 'notes/g3.mp3',
  'ล': 'notes/a3.mp3',
  'ท': 'notes/b3.mp3',
  'ดํ': 'notes/c4.mp3',
  'รํ': 'notes/d4.mp3',
  'มํ': 'notes/e4.mp3',
  'ฟํ': 'notes/f4.mp3',
  'ซํ': 'notes/g4.mp3',
};




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

// void playNote(String note) {
//   String? audioFile = noteMap[note.toLowerCase()];
//   if (audioFile != null) {
//     var audio = html.AudioElement(audioFile);
//     audio.play();
//     //audioCache.play(audioFile);
//     print('Note $note is playing.');
//   } else {
//     print('Note $note not found.');
//   }
//
//   // Create an audio element
//
//
//   // Play the audio
//
//
// }
//
// void preloadAssets() {
//   for (var audioFile in noteMap.values) {
//     final audio = html.AudioElement(audioFile);
//     audio.preload = 'auto'; // Preload the audio file
//     html.document.body!.append(audio); // Append the audio element to the body
//   }
// }
//
// void playSound() {
//   print("play");
//   // Path to your audio file
//   String soundPath = 'assets/notes/g3.mp3';
//
//   // Create an audio element
//   var audio = html.AudioElement(soundPath);
//
//   // Play the audio
//   audio.play();
// }
//







