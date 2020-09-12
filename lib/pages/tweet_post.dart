import 'package:document/core/db/sqflite/tweet_draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:document/colors.dart';

// WANTTO: Navigatorの戻るボタンを xボタンにしたい
// WANTTO: BottomBarを作成したい

class TweetPost extends StatefulWidget {
  TweetPost({Key key}) : super(key: key);

  @override
  State<TweetPost> createState() => TweetPostState();
}

class TweetPostState extends State<TweetPost> {
  final _tweetEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/tweet_draft");
              },
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
              onPressed: () {
                TweetDraftRepository.create({
                  'body': _tweetEditingController.text,
                  'created_at': '2020-10-10 00:00:00'
                });
              },
            ),
          ],
        ),
        backgroundColor: darkColor,
      ),
      body: Form(
        child: Container(
          decoration: BoxDecoration(color: darkColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/myprofile.jpg'),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: _tweetEditingController,
                  autofocus: true,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "いまどうしてる？",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
