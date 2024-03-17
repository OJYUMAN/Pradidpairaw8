import 'package:flutter/material.dart';

void main() {
  runApp(ToggleButtonsApp());
}

class ToggleButtonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toggle Buttons Example'),
        ),
        body: Center(
          child: ToggleButtonsDemo(),
        ),
      ),
    );
  }
}

class ToggleButtonsDemo extends StatefulWidget {
  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}

class _ToggleButtonsDemoState extends State<ToggleButtonsDemo> {
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ToggleButtons(
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.play_arrow),
            Icon(Icons.fast_rewind),
          ],
          isSelected: _selections,
          onPressed: (int index) {
            setState(() {
              // Toggle the state of the buttons
              for (int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
                if (buttonIndex == index) {
                  _selections[buttonIndex] = !_selections[buttonIndex];
                } else {
                  _selections[buttonIndex] = false;
                }
              }

              // Perform action based on the pressed button
              switch (index) {
                case 0:
                // Handle pause action
                  print('Pause');
                  break;
                case 1:
                // Handle play action
                  print('Play');
                  break;
                case 2:
                // Handle rewind action
                  print('Rewind');
                  break;
              }
            });
          },
        ),
      ],
    );
  }
}
