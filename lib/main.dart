import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
    ];
    return MaterialApp(
      title: 'Column & Row',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome Twitter'),
          backgroundColor: darkColor,
          elevation: 1,
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= list.length) {
              list.addAll([
                "messageこんにちはこんにちはこんにちはこんにちは",
                "messageこんにちはこんにちはこんにちはこんにちは",
                "messageこんにちはこんにちはこんにちはこんにちは",
              ]);
            }
            return _userProfilePhoto(list[index]);
          },
        ),
      ),
    );
  }

  Widget _userProfilePhoto(title) {
    return Container(
      color: darkColor,
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("images/default.jpg"),
              ),
              SizedBox(width: 15.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'UserName',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
