import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SignWithGoogle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        // these are variable
        // for each firebase project
          apiKey: "AIzaSyBRCEXs6WtllMa_QvK3vAWWC2R2eEGCqak",
          authDomain: "testdata-fc7b2.firebaseapp.com",
          projectId: "testdata-fc7b2",
          storageBucket: "testdata-fc7b2.appspot.com",
          messagingSenderId: "200891038132",
          appId: "1:200891038132:web:719321f06dd52045451ae1",
          measurementId: "G-610D7GK2QW")
  );
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleSignInScreen(),
    );
  }
}
