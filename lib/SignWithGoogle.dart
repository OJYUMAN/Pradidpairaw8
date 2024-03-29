import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/FileView.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}
String? name, imageUrl, userEmail, uid;

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: InkWell(
            onTap: () async {
              await signInWithGoogle();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('Sign In with Google'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    // The `GoogleAuthProvider` can only be
    // used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
      await auth.signInWithPopup(authProvider);
      final User? user = userCredential.user;
      if (user != null) {
        setState(() {
          uid = user.uid;
          name = user.displayName;
          userEmail = user.email;
          imageUrl = user.photoURL;
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('auth', true);
        print("name: $name");
        print("userEmail: $userEmail");
        print("imageUrl: $imageUrl");

        // Navigate to the homepage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage2(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}


