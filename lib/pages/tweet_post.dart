import 'package:flutter/material.dart';
import 'package:document/colors.dart';

class TweetPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () => print("下書き tapped!"),
              child: Text(
                "下書き",
                style: TextStyle(
                  color: twitterColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 18.0),
            RaisedButton(
              child: Text(
                "ツイートする",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: twitterColor,
              shape: StadiumBorder(),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: darkColor,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Sub'),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
