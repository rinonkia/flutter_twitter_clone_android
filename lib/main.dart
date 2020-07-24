import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column & Row',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Welcome Twitter'),
            backgroundColor: darkColor,
            elevation: 1),
        body: Container(
          color: darkColor,
          child: Center(
            child: Text(
              'happen',
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
