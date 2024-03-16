import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/FirebaseAction.dart';
import 'ProjectView.dart';
import 'PaperView.dart';
import 'FileView.dart';
import '../variable.dart';
import '../main.dart';

class PageViewContainer extends StatefulWidget {
  @override
  _FloatingContainerState createState() => _FloatingContainerState();
}

class _FloatingContainerState extends State<PageViewContainer> {
  double scale = 1.0;
  double _dx = 0.0;
  double _dy = 0.0;

  @override
  Widget build(BuildContext context) {
    if (left == 0.0) {
      // If the paper is close to the edge Rearrange it to center.
      left = MediaQuery.of(context).size.width / 2 - 420;
    }
    return Stack(
      children: [
        Positioned(
          top: top + _dy,
          left: left + _dx,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _dx += details.delta.dx;
                _dy += details.delta.dy;
              });
            },
            child: Listener(
              onPointerSignal: (PointerSignalEvent event) {
                if (event is PointerScrollEvent) {
                  setState(() {
                    _dy -= event.scrollDelta.dy;
                    _dx -= event.scrollDelta.dx;
                  });
                }
              },
              child: Transform.scale(
                scale: scale,
                child: Column(
                  children: [
                    ...pagepaper,
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // Add Container Button
          bottom: 16,
          right: 16,
          child: Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    Map<String, dynamic> data = {
                      'title': title,
                      'instrument': instrument,
                      'composer': composer,
                      'labelarr': labelarr,
                      'kroarr': kroarr,
                      'created': DateTime.now(),
                      // Add other fields as needed
                    };

                    //
                    saveDocument(referenceinfo, data);
                  });
                },
                child: Icon(Icons.save),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    // delete();
                    print(referenceinfo);
                    deleteproject(referenceinfo);
                  });
                },
                child: Icon(Icons.delete),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 32; i++) {
                      labelarr.add("-"); // Add the current index to the array
                      kroarr.add(" ");
                    }
                    pagepaper.clear();

                    PaperManager.addPaper(pagepaper); //สร้างหน้ากระดาษ
                    print(labelarr.length);
                    print(pagepaper.length);
                    PageViewContainer();
                  });
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    saveasproject();

                    //PaperManager.addPaper(pagepaper);
                  });
                },
                child: Icon(Icons.save_as),
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    scale -= 0.1; // Decrease scale by 0.1
                  });
                },
                child: Icon(Icons.zoom_out),
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    scale += 0.1; // Increase scale by 0.1
                  });
                },
                child: Icon(Icons.zoom_in),
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 169, 143, 127),
                onPressed: () {
                  showkeyboard = !showkeyboard;
                  print(showkeyboard);
                  if (showkeyboard == true) {
                    setState(() {
                      ranadsize = 200;
                      refresh();
                    });
                  } else {
                    setState(() {
                      ranadsize = 0;
                      refresh();
                    });
                  }
                },
                child: const Icon(
                  Icons.piano,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
