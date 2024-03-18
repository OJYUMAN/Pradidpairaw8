import 'package:flutter/material.dart';
import 'package:untitled1/FirebaseAction.dart';
import 'package:untitled1/Screen/ProjectView.dart';

import '../variable.dart';
import '../UiFunc.dart';

final image1 = Image.asset(
  'assets/images/table%20fix.png',
  // height: 100,
  width: 730,
  //fit: BoxFit.fitWidth,
);

class PaperManager {
  static void addPaper(List<Widget> pagepaper) {
    pagepaper.add(
      Column(
        children: [
          Container(
            width: 840, // adjust width as needed
            height: 1188, // adjust height as needed
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.1,
                ), // no shadow color set, defaults to black
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintStyle: TextStyle(fontSize: 40), hintText: title),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40),
                    onChanged: (_val) {
                      title = _val;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 300 - 180, // <-- Fixed width.
                        child: TextField(
                          decoration: new InputDecoration.collapsed(
                              hintStyle: TextStyle(fontSize: 20),
                              hintText: composer),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          onChanged: (_val) {
                            composer = _val;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < (labelarr.length / 32); i++) ...[
                        Row(children: [
                          SizedBox(
                            width: 54,
                          ),
                          Stack(children: [
                            Container(
                              height: 50,
                              child: image1,
                            ),
                            Positioned(
                              top: 10, // ปรับตำแหน่งตามที่คุณต้องการ
                              left: -1, // ปรับตำแหน่งตามที่คุณต้องการ
                              child: Row(
                                children: [
                                  SizedBox(width: 13),
                                  for (int x = 0; x < 32; x++) ...[
                                    SizedBox(width: 5),
                                    Container(
                                      width: 17,
                                      child: Text(
                                        labelarr[(32 * i) + x],
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0, // ปรับตำแหน่งตามที่คุณต้องการ
                              left: -1, // ปรับตำแหน่งตามที่คุณต้องการ
                              child: Row(
                                children: [
                                  SizedBox(width: 13),
                                  for (int x = 0; x < 32; x++) ...[
                                    SizedBox(width: 5),
                                    Container(
                                      width: 17,
                                      child: Text(
                                        kroarr[(32 * i) + x],
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Row(
                              //สร้างปุ่มซ้อนกับlabelเพื่อรับinput
                              children: [
                                SizedBox(width: 13),
                                //textarr[0-32]
                                for (int x = 0; x < 32; x++) ...[
                                  //ให้รับค่าตัวเริ่มและตัวจบเพิ่มที่ละ32
                                  //add textarr32ตัวลงบนภาพ
                                  Container(
                                    width: 22,
                                    height: 48,

                                    // color: Colors.yellow,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                       // primary: Colors.transparent,
                                        //foregroundColor: Colors.transparent,  // กำหนดสีโปร่ง
                                        backgroundColor: buttonColors[(32 * i) + x],

                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              0), // ปรับขอบให้เป็นเหลี่ยม
                                        ),
                                      ),
                                      onPressed: () {
                                        int value = (32 * i) + x;
                                        ppcolor = Color.fromRGBO(255, 235, 59, 90);
                                        ppcount = value.toDouble();
                                        print((32 * i) + x);
                                        newcursor();
                                        refreshui();


                                        // setState(() {
                                        //   if (JK == true) {
                                        //     ppcount = t.toDouble();
                                        //     newcursor();
                                        //     refresh();
                                        //   }
                                        //   if (editing == true) {
                                        //     co.add(t);
                                        //     print(co);
                                        //     longcursor();
                                        //     final x = co[1] - co[0];
                                        //     // ppcolor = Colors.red;
                                        //     //cwidth = 11.00*x+11.00;
                                        //     //ppcount = t.toDouble();
                                        //     //ifppcountnolabel();
                                        //     refresh();
                                        //   }
                                        //   if (copied == true) {
                                        //     print(copiedarr);
                                        //     paste = t;
                                        //   }
                                        // });
                                      },
                                      onLongPress: () {
                                        // co.clear();
                                        // setState(() {
                                        //   if (JK == true) {
                                        //     ppcount = t.toDouble();
                                        //     newcursor2();
                                        //     refresh();
                                        //     editing = true;
                                        //     co.add(t);
                                        //   }
                                        // });
                                      },
                                      child: const Text(''),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ]), //labelarr1
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}


