import 'package:flutter/material.dart';
import 'package:menu_bar/menu_bar.dart';

List<BarButton> menuBarButtons() {
  return [
    BarButton(
      text: const Text(
        'File',
        style: TextStyle(color: Colors.black),
      ),
      submenu: SubMenu(
        menuItems: [
          MenuButton(
            onTap: () async {
            },
            text: const Text('Save'),
            shortcutText: 'Cmd+S',
            //shortcutText: 'Ctrl+S',
           // shortcut:
            //const SingleActivator(LogicalKeyboardKey.keyS, control: true),
          ),
          MenuButton(
            onTap: () async {
             // saveas();
            },
            text: const Text('Save as'),
            shortcutText: 'Cmd+Shift+S',
          ),
          const MenuDivider(),
          MenuButton(
            text: const Text('New Project'),
            submenu: SubMenu(
              menuItems: [
                MenuButton(
                  onTap: () async {
                    // fakefile =
                    // "ชื่อเพลง\nผู้ประพันธ์\n \n-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-\n \n                                ";
                    // setState(() {
                    //   readfile(fakefile);
                    // });
                  },
                  text: const Text('บรรทัดเดี่ยว'),
                ),
                MenuButton(
                  onTap: () async {
                    // fakefile =
                    // "ชื่อเพลง\nผู้ประพันธ์\n \n-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-\n-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-,-\n                                ";
                    // setState(() {
                    //   readfile(fakefile);
                    // });
                    // intru = 2;
                  },
                  text: const Text('บรรทัดคู่'),
                ),
              ],
            ),
          ),
          MenuButton(
            onTap: () async {
              // strings.clear();
              // final result =
              // await FilePicker.platform.pickFiles(); //เปิดfider
              // if (result != null) {
              //   final file = result.files.first; //เก็บfile path
              //   filePath =
              //       p.join(Directory.current.path, file.path); //อ่านไฟล์
              //   File file2 = File(filePath);
              //   var fileContent = file2.readAsStringSync(); //ทําให้เป็นstring
              //   print(fileContent);
              //   setState(() {
              //     readfile(fileContent);
              //   });
              // }
            },
            text: const Text('Open File'),
          ),
          const MenuDivider(),
          MenuButton(
            text: const Text('Export'),
            submenu: SubMenu(
              menuItems: [
                MenuButton(
                  onTap: () async {
                  //   final name = await showDialog<String>(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         title: const Text('File name'),
                  //         content: TextField(
                  //           controller: myController,
                  //           //obscureText: true,
                  //           decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             //labelText: 'Password',
                  //           ),
                  //         ),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             style: TextButton.styleFrom(
                  //               textStyle:
                  //               Theme.of(context).textTheme.labelLarge,
                  //             ),
                  //             child: const Text('Cencel'),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           ),
                  //           TextButton(
                  //             style: TextButton.styleFrom(
                  //               textStyle:
                  //               Theme.of(context).textTheme.labelLarge,
                  //             ),
                  //             child: const Text('Save'),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //               //createfile();
                  //             },
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  //   String? selectedDirectory = await FilePicker.platform
                  //       .getDirectoryPath(); // เลือก path
                  //   final filePath = '$selectedDirectory';
                  //   final name2 = myController.text;
                  //
                  //   screenshotController.captureAndSave(
                  //       filePath, //set path where screenshot will be saved
                  //       fileName: "$name2.png");
                   },
                   text: const Text('image'),
                ),
                MenuButton(
                  onTap: () async {
                    // final name = await showDialog<String>(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: const Text('File name'),
                    //       content: TextField(
                    //         controller: myController,
                    //         //obscureText: true,
                    //         decoration: InputDecoration(
                    //           border: OutlineInputBorder(),
                    //           //labelText: 'Password',
                    //         ),
                    //       ),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           style: TextButton.styleFrom(
                    //             textStyle:
                    //             Theme.of(context).textTheme.labelLarge,
                    //           ),
                    //           child: const Text('Cencel'),
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //         ),
                    //         TextButton(
                    //           style: TextButton.styleFrom(
                    //             textStyle:
                    //             Theme.of(context).textTheme.labelLarge,
                    //           ),
                    //           child: const Text('Save'),
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //             //createfile();
                    //           },
                    //         ),
                    //       ],
                    //     );
                 //     },
                 //   )
                  //   if (title == "") {
                  //     title = _textEditingController.text;
                  //     composer = _textEditingController2.text;
                  //   }
                  //   savePdfToFilePicker(myController.text);
                   },
                  text: const Text('PDF'),
                ),
              ],
            ),
          ),
          MenuButton(
            onTap: () {
           //   SystemNavigator.pop();
            },
            shortcutText: 'Cmd+Q',
            text: const Text('Exit'),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    ),
    BarButton(
      text: const Text(
        'Edit',
        style: TextStyle(color: Colors.black),
      ),
      submenu: SubMenu(
        menuItems: [
          MenuButton(
            onTap: () {
             // undo();
            },
            text: const Text('Undo'),
            shortcutText: 'Cmd+Z',
          ),
          MenuButton(
            onTap: () {
            //  redo();
            },
            text: const Text('Redo'),
            shortcutText: 'Cmd+Y',
          ),
          const MenuDivider(),
          MenuButton(
            onTap: () {
            //  cut();
            },
            text: const Text('Cut'),
            shortcutText: 'Cmd+X',
          ),
          MenuButton(
            onTap: () {
              //copy2();
            },
            text: const Text('Copy'),
            shortcutText: 'Cmd+C',
          ),
          MenuButton(
            onTap: () {
             // paste2();
            },
            text: const Text('Paste'),
            shortcutText: 'Cmd+V',
          ),
        ],
      ),
    ),
    BarButton(
      text: const Text(
        'Help',
        style: TextStyle(color: Colors.black),
      ),
      submenu: SubMenu(
        menuItems: [
          MenuButton(
            onTap: () {},
            text: const Text('Check for updates'),
          ),
          const MenuDivider(),
          MenuButton(
            onTap: () {},
            icon: const Icon(Icons.web),
            text: const Text('Manual'),
          ),
        ],
      ),
    ),
  ];
}