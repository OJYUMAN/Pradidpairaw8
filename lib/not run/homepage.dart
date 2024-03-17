import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'addproject.dart';

String? title;

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Button App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('One Button App'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => AddNote(),
                  ),
                )
                    .then((value) {
                  print("Calling Set  State !");

                });

                // Define what happens when the button is pressed
                print('Button pressed!');
              },
              child: Text('create new project'),
            ),
          ],

        ),
      ),
    );
  }
}


// void add() async {
//     // save to db
//     CollectionReference ref = FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser?.email)
//         .collection('notes');
//
//     var data = {
//       'title': title,
//       'description': "des",
//       'created': DateTime.now(),
//     };
//
//     ref.add(data);
//
//
// }

