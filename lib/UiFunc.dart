import 'package:flutter/material.dart';

import 'variable.dart';
import 'Screen/PaperView.dart';
import 'Screen/ProjectView.dart';

void newcursor() {
  recursor();
  buttonColors[ppcount.toInt()] = ppcolor; // ในกรณีนี้จะเปลี่ยนเป็นสีเหลือง
}

void recursor() {
  for (int x = 0; x < buttonColors.length; x++) {
    buttonColors[x] =
        Color.fromRGBO(255, 228, 103, 0.0); // ในกรณีนี้จะเปลี่ยนเป็นสีแดง
  }
  // refresh();
  buttonColors =
      List.generate(1000000, (index) => Color.fromRGBO(255, 228, 103, 0.0));
}

void refreshui(){
  pagepaper.clear();
  PaperManager.addPaper(pagepaper); //สร้างหน้ากระดาษ
  refresh();
}