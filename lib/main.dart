import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Material Design',
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 300.0,
            height: 300.0,
            child: Text('word'),
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.1),
          ),
        ),
      ),
    );
  }
}
