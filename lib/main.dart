import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const data = [Text("item0"), Text("item1"), Text("item3"), Text("item4")];
    print(context);
    return MaterialApp(
      home: Scaffold(
        body: ListView(children: data),
      ),
    );
  }
}
