import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import '../FirebaseAction.dart';
import '../UiFunc.dart';
import '../variable.dart';


Stopwatch stopwatch = Stopwatch();
late Timer _timer;
var MT = 250; //1000milisec/4

void playsound(){
  print("playing");
  stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: MT), (timer) {
    ppcolor = Color.fromRGBO(103, 164, 255, 0.7019607843137254);
    newcursor();
    refreshui();
    print(ppcount);
    invertnotetonumbernew(labelarr[ppcount.toInt()]);
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

void invertnotetonumbernew(x) {
  //ทําแบบใหม่รวมโน้ตของทุ้มและเอก
  var i = 0;

  if (x == 'มฺ') {
    i = 0;
  } else if (x == 'ฟฺ') {
    i = 1;
  } else if (x == 'ซฺ') {
    i = 2;
  } else if (x == 'ลฺ') {
    i = 3;
  } else if (x == 'ทฺ') {
    i = 4;
  } else if (x == 'ด') {
    i = 5;
  } else if (x == 'ร') {
    i = 6;
  } else if (x == 'ม') {
    i = 7;
  } else if (x == 'ฟ') {
    i = 8;
  } else if (x == 'ซ') {
    i = 9;
  } else if (x == 'ล') {
    i = 10;
  } else if (x == 'ท') {
    i = 11;
  } else if (x == 'ดํ') {
    i = 12;
  } else if (x == 'รํ') {
    i = 13;
  } else if (x == 'มํ') {
    i = 14;
  } else if (x == 'ฟํ') {
    i = 15;
  } else if (x == 'ซํ') {
    i = 16;
  } else {
    i = -1; // หรือค่าเริ่มต้นที่คุณต้องการในกรณีอื่นๆ
  }
  playRanatek(i);

}

void playRanatek(int noteIndex) async {

    final audioPlayer =
    AudioPlayer();
    final tj = allNotes[noteIndex]; //เปลี่ยนตัวเลขเป็นชื่อไฟล์
    audioPlayer.play(AssetSource("Sound/$selectedInstrument2/$tj"));



}