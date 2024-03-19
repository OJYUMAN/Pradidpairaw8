import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import '../FirebaseAction.dart';
import '../UiFunc.dart';
import '../variable.dart';
import 'dart:html' as html;
import 'dart:js' as js;

import 'main.dart';


// void simulator(int noteIndex) async {
//   //play sound without editing
//   final audioPlayer3 = AudioPlayer();
//   if (intru == 2) {
//     final aj = duoNotes[noteIndex];
//     audioPlayer3.play(AssetSource("Sound/$selectedInstrument2/$aj"));
//   } else {
//     final aj = piano[noteIndex];
//     audioPlayer3.play(AssetSource("notes/$aj"));
//   }
// }

final List<String> audioUrls = [
  'assets/assets/Sound/Ranatek/G0.mp3',
  'assets/assets/Sound/Ranatek/A0.mp3',
  'assets/assets/Sound/Ranatek/B0.mp3',
  'assets/assets/Sound/Ranatek/C.mp3',
  'assets/assets/Sound/Ranatek/D.mp3',
  'assets/assets/Sound/Ranatek/E.mp3',
  'assets/assets/Sound/Ranatek/F.mp3',
  'assets/assets/Sound/Ranatek/Ghh.mp3',
  'assets/assets/Sound/Ranatek/A.mp3',
  'assets/assets/Sound/Ranatek/B.mp3',
  'assets/assets/Sound/Ranatek/C2.mp3',
  'assets/assets/Sound/Ranatek/D2.mp3',
  'assets/assets/Sound/Ranatek/E2.mp3',
  'assets/assets/Sound/Ranatek/F2.mp3',
  'assets/assets/Sound/Ranatek/G3.mp3',
];


void simulator(int noteIndex) async {
  js.context.callMethod('playAudio', [audioUrls[noteIndex]]);
}


Stopwatch stopwatch = Stopwatch();
late Timer _timer;
var MT = 250; //1000milisec/4

void playsound(){
  stopwatch.start();
  _timer = Timer.periodic(Duration(milliseconds: MT), (timer) {
    ppcolor = Color.fromRGBO(103, 164, 255, 0.7019607843137254);
    playNoteJs(labelarr[ppcount.toInt()]);
    newcursor();
    refreshui();
    //playNote(labelarr[ppcount.toInt()]);
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

void playNoteJs(x) {
  if (x == 'มฺ') {

  } else if (x == 'ฟฺ') {

  } else if (x == 'ซฺ') {
    js.context.callMethod('playAudio', [audioUrls[0]]);
  } else if (x == 'ลฺ') {
    js.context.callMethod('playAudio', [audioUrls[1]]);
  } else if (x == 'ทฺ') {
    js.context.callMethod('playAudio', [audioUrls[2]]);
  } else if (x == 'ด') {
    js.context.callMethod('playAudio', [audioUrls[3]]);
  } else if (x == 'ร') {
    js.context.callMethod('playAudio', [audioUrls[4]]);
  } else if (x == 'ม') {
    js.context.callMethod('playAudio', [audioUrls[5]]);
  } else if (x == 'ฟ') {
    js.context.callMethod('playAudio', [audioUrls[6]]);
  } else if (x == 'ซ') {
    js.context.callMethod('playAudio', [audioUrls[7]]);
  } else if (x == 'ล') {
    js.context.callMethod('playAudio', [audioUrls[8]]);
  } else if (x == 'ท') {
    js.context.callMethod('playAudio', [audioUrls[9]]);
  } else if (x == 'ดํ') {
    js.context.callMethod('playAudio', [audioUrls[10]]);
  } else if (x == 'รํ') {
    js.context.callMethod('playAudio', [audioUrls[10]]);
  } else if (x == 'มํ') {
    js.context.callMethod('playAudio', [audioUrls[12]]);
  } else if (x == 'ฟํ') {
    js.context.callMethod('playAudio', [audioUrls[13]]);
  } else if (x == 'ซํ') {
    js.context.callMethod('playAudio', [audioUrls[14]]);
  } else {
  }
  //v(i);
  //playRanatek(i);

}

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




// void playNoteJs(note)  {
//   print(note);
//   if(note == -1){
//
//   }else{
//     js.context.callMethod('playAudio', [audioUrls[note]]);
//   }
// }
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