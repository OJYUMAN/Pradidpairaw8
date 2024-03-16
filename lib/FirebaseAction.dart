import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screen/PaperView.dart';
import 'variable.dart';

String? title;
String? instrument;
String? composer;
var labelarr = [];
var kroarr = [];
var labelarr2 = [];

void newproject() {
  //สร้างไฟล์
  title = "ชื่อเพลง";
  instrument = "เครื่องดนตรี";
  composer = "ผู้ประพันธ์";
  labelarr.clear();
  kroarr.clear();
  for (int i = 0; i < 32; i++) {
    labelarr.add("-"); // Add the current index to the array
    kroarr.add(" ");
  }
  //add();//นําไปเก็บบนfirebase
  pagepaper.clear();
  PaperManager.addPaper(pagepaper); //สร้างหน้ากระดาษ
  //savetofirebase();
}

void saveasproject() async {
  // save to db
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.email)
      .collection('notes');

  var data = {
    'title': title,
    'instrument': instrument,
    'composer': composer,
    'labelarr': labelarr,
    'kroarr': kroarr,
    'created': DateTime.now(),
  };

  ref.add(data);
}

Object? referenceinfo;

void openproject(Map<String, dynamic> data, String formattedTime,
    DocumentReference<Object?> reference) {
  title = data['title'];
  composer = data['composer'];
  labelarr = data['labelarr'];
  kroarr = data['kroarr'];

  referenceinfo = reference.path;

  pagepaper.clear();
  PaperManager.addPaper(pagepaper); //สร้างหน้ากระดาษ
}

void deleteproject(path) async {
  // Construct the document reference using the provided path
  DocumentReference documentReference = FirebaseFirestore.instance.doc(path);

  // Delete the document
  try {
    await documentReference.delete();
    print('Document deleted successfully.');
  } catch (e) {
    print('Error deleting document: $e');
  }
}

void saveDocument(path, Map<String, dynamic> data) async {
  // Construct the document reference using the provided path
  DocumentReference documentReference = FirebaseFirestore.instance.doc(path);

  // Save the document
  try {
    // If you want to completely overwrite the document, you can use set()
    // await documentReference.set(data);

    // If you want to update the document without overwriting it, you can use update()
    await documentReference.update(data);

    print('Document saved successfully.');
  } catch (e) {
    print('Error saving document: $e');
  }
}
