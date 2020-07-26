import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = ["メッセージ", "メッセージ", "メッセージ", "メッセージ"];
    return MaterialApp(
      title: 'Column & Row',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Welcome Twitter'),
            backgroundColor: darkColor,
            elevation: 1),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= list.length) {
              list.addAll(
                  ["message", "message", "message", "message", "message"]);
            }
            return _messageItem(list[index]);
          },
        ),
      ),
    );
  }

  Widget _messageItem(String title) {
    return Container(
      decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.white)),
      ),
      child: ListTile(
        leading: Image.asset('images/default.jpg'),
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        contentPadding: EdgeInsets.all(10.0),
        onTap: () {
          print('onTap called.');
        },
        onLongPress: () {
          print('onLongPress called.');
        },
      ),
    );
  }
}
