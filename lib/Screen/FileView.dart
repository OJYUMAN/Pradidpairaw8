import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'CreateProject.dart';
import 'ProjectView.dart';
import '../SignWithGoogle.dart';
import 'package:intl/intl.dart';
import '../FirebaseAction.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.email)
      .collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Recent projects",
          style: TextStyle(
            color: Color.fromARGB(255, 169, 143, 127),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 169, 143, 127),
                ),
                onPressed: () {
                  createproject(context);
                },
                child: Text('Create new project')),
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
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.docs.length == 0) {
              return Center(
                child: Text(
                  "You have no saved Notes !",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              );
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0, // Maximum width for each box
                childAspectRatio:
                    2 / 3, // Aspect ratio (width/height) of each box
                crossAxisSpacing: 10.0, // Horizontal spacing
                mainAxisSpacing: 20.0, // Vertical spacing
              ),
              itemCount: snapshot.data?.docs.length ?? 0,
              itemBuilder: (context, index) {
                Color bg = Colors.white;
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                DateTime? mydateTime =
                    (data['created'] as Timestamp?)?.toDate();

                String formatDate(DateTime dateTime) {
                  final formatter = DateFormat('MMM d, yyyy');
                  return formatter.format(dateTime);
                }

                final formattedTime = formatDate(mydateTime!);

                return InkWell(
                  onTap: () {
                    openproject(
                      data,
                      formattedTime,
                      snapshot.data!.docs[index].reference,
                    );
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    )
                        .then((value) {
                      print("Calling Set  State !");
                      setState(() {});
                    });
                  },
                  child: Card(
                    color: bg,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['title']}",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "lato",
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              formattedTime,
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: "lato",
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("Loading..."),
            );
          }
        },
      ),
    );
  }
}
