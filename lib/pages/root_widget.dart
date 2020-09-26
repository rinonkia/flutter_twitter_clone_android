import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:document/pages/home.dart';

class RootWidget extends StatefulWidget {
  RootWidget({Key key}) : super(key: key);
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  @override
  initState() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser = null) {
      Navigator.pushReplacementNamed(context, "/login");
    }

    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((DocumentSnapshot result) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())))
        .catchError((err) => print(err));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading..."),
        ),
      ),
    );
  }
}
