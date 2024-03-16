import 'package:flutter/material.dart';
import 'package:untitled1/FirebaseAction.dart';

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
                              top: 8, // ปรับตำแหน่งตามที่คุณต้องการ
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
