import 'package:flutter/material.dart';
import '../FirebaseAction.dart';
import '../SignWithGoogle.dart';
import '../UiFunc.dart';
import '../not run/preload.dart';
import '../playsound.dart';
import 'FileView.dart';
import 'PageView.dart';
import '../variable.dart';
import '../Keyboard.dart';
import 'package:async/async.dart';


void refresh() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    keyboardwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 210, 210),
        appBar: AppBar(
          toolbarHeight: 35.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.home),
            // Customize leading icon
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => HomePage2(),
                ),
              )
                  .then((value) {
              });
              // Add onPressed action
            },
          ),
          actions: [
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.cloud), // Customize leading icon
              onPressed: () {
                if(referenceinfo == null){
                  saveasproject();
                  print("save as");
                }else{
                  Map<String, dynamic> data = {
                    'title': title,
                    'instrument': instrument,
                    'composer': composer,
                    'labelarr': labelarr,
                    'kroarr': kroarr,
                    'created': DateTime.now(),
                    // Add other fields as needed
                  };
                  saveproject(referenceinfo, data);
                  print("save");
                }
                // Add onPressed action
              },
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.undo_outlined), // Customize leading icon
              onPressed: () {
                // Add onPressed action
              },
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.redo_outlined), // Customize leading icon
              onPressed: () {
                // Add onPressed action
              },
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.ios_share_outlined), // Customize leading icon
              onPressed: () {
                // Add onPressed action
              },
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.delete_outline), // Customize leading icon
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Delete project"),
                      content: Text("Are you sure you want to delete?"), // Customize confirmation message
                      actions: <Widget>[
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        TextButton(
                          child: Text("Delete"),
                          onPressed: () {
                            deleteproject(referenceinfo);
                            // Perform delete action here
                            // Once delete action is performed, close the dialog
                            Navigator.of(context)
                                .push(
                              MaterialPageRoute(
                                builder: (context) => HomePage2(),
                              ),
                            )
                                .then((value) {
                            });
                          },
                        ),

                      ],
                    );
                  },
                );
                // Add onPressed action
              },
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl!),
            ),
            SizedBox(width: 16),
          ],

        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 169, 143, 127),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  height: 60,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        ToggleButtons(
                          //ปุ่มplay pause
                          direction:
                          vertical ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                              selectedVegetables[index] =
                              !selectedVegetables[
                              index]; //สําหรับควบคุมui
                              if (index == 0) {
                                //เมื่อกดปุ่มplay
                                if (play == true) {
                                  play = false;
                                  stop();

                                } else {
                                  play = true;
                                  playsound();


                                }
                              }
                              if (index == 1) {
                                //เมื่อกดปุ่มkip
                                // _stopStopwatch();
                                selectedVegetables[0] = false;
                                selectedVegetables[1] = false;
                                play = false;
                                stop();
                                ppcount = 0;

                                //_resetStopwatch();
                                newcursor();

                                refreshui();

                              }
                              refresh();

                          },
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.black,
                          selectedColor: Color.fromARGB(247, 255, 216, 116),
                          //fillColor: Color.fromARGB(255, 75, 58, 44),
                          fillColor: Color.fromARGB(224, 144, 131, 122),
                          color: Colors.black,
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 40.0,
                          ),
                          isSelected: selectedVegetables,
                          children: vegetables,
                        ),
                        const SizedBox(height: 20), //Button spacing
                        const SizedBox(width: 15),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                      'assets/images/$selectedInstrument2.png'),
                                  iconSize: 80,
                                  onPressed: () {
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return InstrumentSelector(
                                    //       instruments: instruments,
                                    //       onInstrumentSelected:
                                    //           (selectedInstrument) {
                                    //         setState(() {
                                    //           print(
                                    //               'Selected Instrument: $selectedInstrument');
                                    //           selectedInstrument2 =
                                    //               selectedInstrument;
                                    //         });
                                    //         // Handle the selected instrument here
                                    //       },
                                    //     );
                                    //   },
                                    // );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    // setState(() {
                                    //   Tempo -= 1;
                                    //   MT += 1;
                                    //
                                    //   print(Tempo);
                                    // });
                                  },
                                ),
                                Text(Tempo.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {

                                    // setState(() {
                                    //   Tempo += 1;
                                    //   MT -= 1;
                                    //   print(Tempo);
                                    // });
                                  },
                                ),
                                // TextButton(
                                //   onPressed: () {
                                //     // showDialog(
                                //     //   context: context,
                                //     //   builder: (context) {
                                //     //     return ChanSelector(
                                //     //       chan: chan,
                                //     //       onChanSelected: (selectedChan) {
                                //     //         // Handle the selected instrument here
                                //     //         print(
                                //     //             'Selected Instrument: $selectedChan');
                                //     //         setState(() {
                                //     //           chan2 =
                                //     //               selectedChan; // อัปเดตค่า chan โดยใช้ setState
                                //     //         });
                                //     //         //Navigator.pop(context); // ปิด dialog หลังจากเลือก
                                //     //       },
                                //     //     );
                                //     //   },
                                //     // );
                                //   },
                                //   // child: Text(
                                //   //   chan2,
                                //   //   // ใช้ค่า chan ที่อัปเดตแล้วเป็นชื่อของปุ่ม
                                //   //   style: TextStyle(
                                //   //     color: Colors.black.withOpacity(0.8),
                                //   //   ),
                                //   // ),
                                // )
                              ]),
                          width: 256.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 228, 195, 180),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),

                        Row(children: [
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              // setState(() {
                              //   ppheight = 34.00;
                              //   isSwitched = value; //ปุ่มเปิดปิดedit mode
                              //   print(isSwitched);
                              //   if (isSwitched == true) {
                              //     //ppcolor = Colors.yellow;
                              //     JK = true;
                              //     // showpp1 = true;
                              //     editin = true;
                              //     newcursor();
                              //     refresh();
                              //   } else {
                              //     JK = false;
                              //
                              //     editing = false;
                              //     copied = false;
                              //     recursor();
                              //     refresh();
                              //   }
                              //   //pages.clear();
                              //   //pages.add(Page());
                              // });
                            },
                            activeTrackColor:
                            Color.fromARGB(255, 255, 249, 89),
                            activeColor: Color.fromARGB(255, 206, 191, 91),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_alert_outlined,
                              color: isYellow
                                  ? Colors.yellow
                                  : Colors.black, // ใช้สีและสถานะปรับสี
                            ),
                            alignment: Alignment.topCenter,
                            onPressed: () {
                              // setState(() {
                              //   isYellow =
                              //   !isYellow; // สลับสถานะสีเมื่อปุ่มถูกกด
                              // });
                              // print(isYellow
                              //     ? "ฉิ่ง (เหลือง)"
                              //     : "ฉิ่ง"); // พิมพ์ข้อความตามสี
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_forever_sharp),
                            // color: Colors.white,
                            alignment: Alignment.topCenter,
                            onPressed: () {
                              // if (intru == 2) {
                              //   for (int j = 0; j < 32; j++) {
                              //     //สร้างarraysสําหรับเก็บค่าตัวโน้ต
                              //     labelarr.removeLast();
                              //     labelarr2.removeLast();
                              //     kroarr.removeLast();
                              //   }
                              // } else {
                              //   for (int j = 0; j < 32; j++) {
                              //     //สร้างarraysสําหรับเก็บค่าตัวโน้ต
                              //     labelarr.removeLast();
                              //     kroarr.removeLast();
                              //   }
                              // }
                              // refresh();
                              // print("remove table");
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add_box),
                            // color: Colors.white,
                            alignment: Alignment.topCenter,
                            onPressed: () {
                              // setState(() {
                              //   //isSwitched = false;
                              //   if (intru == 2) {
                              //     fornewtable2();
                              //   } else {
                              //     fornewtable();
                              //   }
                              //   refresh();
                              //
                              //   if (tbcount % 12 == 0) {
                              //     //เพิ่มพื้นที่เหนือกระดาษจะได้
                              //     // print("gg");
                              //     boxsize += pages.length * 10;
                              //   }
                              //   tbcount += 1;
                              // });
                            },
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.black45), // กำหนดสีพื้นหลัง
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white), // กำหนดสีขอบข้อความ
                              ),
                              child: Text("กรอ"),
                              onPressed: () {
                                // kroarr[ppcount.toInt()] = "~";
                                // setState(() {
                                //   refresh();
                                // });
                                // //labelarr[ppcount]
                              },
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ToggleButtons(
                            children: [
                              Text("  1  ",
                                  style: TextStyle(
                                      color: isSelected[0]
                                          ? Colors.yellow
                                          : Colors.black)),
                              Text("  2  ",
                                  style: TextStyle(
                                      color: isSelected[1]
                                          ? Colors.lightGreenAccent
                                          : Colors.black)),
                            ],
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            selectedBorderColor: Colors.black,
                            selectedColor:
                            Color.fromARGB(247, 255, 216, 116),
                            fillColor: Color.fromARGB(224, 144, 131, 122),
                            color: Colors.black,
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 40.0,
                            ),
                            isSelected: isSelected,
                            onPressed: (int index) {
                              if (intru == 2) {
                                // setState(() {
                                //   for (int buttonIndex = 0;
                                //   buttonIndex < isSelected.length;
                                //   buttonIndex++) {
                                //     isSelected[buttonIndex] =
                                //     (buttonIndex == index);
                                //   }
                                //   if (index == 1) {
                                //     ppcolor =
                                //         Color.fromRGBO(75, 183, 67, 0.6);
                                //   } else {
                                //     ppcolor =
                                //         Color.fromRGBO(255, 228, 103, 0.7);
                                //   }
                                //   newcursor();
                                //   refresh();
                                // });
                              }
                            },
                          ),
                        ])
                      ])),
              Expanded(
                child: PageViewContainer(),
              ),
              // Slider at the bottom
              keyboard(intru),
              //BottomSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
