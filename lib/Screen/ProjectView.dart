import 'package:flutter/material.dart';
import 'PageView.dart';
import 'MenuBar.dart';
import 'package:menu_bar/menu_bar.dart';
import '../variable.dart';
import '../Keyboard.dart';

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
        body: SafeArea(
          child: MenuBarWidget(
            barButtons: menuBarButtons(),
            barStyle: const MenuStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.zero),
              backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 250, 250, 250)),
              maximumSize: MaterialStatePropertyAll(Size(double.infinity, 28.0)),
            ),
            barButtonStyle: const ButtonStyle(
              padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 6.0)),
              minimumSize: MaterialStatePropertyAll(Size(0.0, 32.0)),
            ),
            menuButtonStyle: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size.fromHeight(36.0)),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0)),
            ),
            enabled: true,
            child: Column(
              children: [
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
      ),
    );
  }
}
