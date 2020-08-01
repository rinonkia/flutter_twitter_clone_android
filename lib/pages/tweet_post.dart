import 'package:flutter/material.dart';
// import 'package:document/colors.dart';

class TweetPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
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
