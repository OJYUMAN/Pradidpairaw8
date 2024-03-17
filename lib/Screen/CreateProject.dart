import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../FirebaseAction.dart';
import 'ProjectView.dart';

void createproject(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('New Project'),
      content: Container(
          height: 61,
          width: 50,
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Change the button color here
                ),
                onPressed: () {
                  newproject();
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  )
                      .then((value) {

                  });

                  //Navigator.pop(context);
                  // Add your onPressed logic here
                },
                child: Text('บรรทัดเดี่ยว'),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Change the button color here
                ),
                onPressed: () {

                  Navigator.pop(context);
                  // Add your onPressed logic here
                },
                child: Text('บรรทัดคู่'),
              ),
            ],
          )),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}