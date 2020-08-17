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
                // 本来であればkey.currentState.postTweetForm()で呼び出すべき？
                //_formKey.currentState.postTweetForm();
              },
            ),
          ],
        ),
        backgroundColor: darkColor,
      ),
      body: TweetPostForm(),
    );
  }
}

class TweetPostFormState extends State<TweetPostForm> {
  final _formKey = GlobalKey<TweetPostFormState>();
  final _tweetEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            // 仮置のボタン
            RaisedButton(
              child: Text(
                "ツイートする(仮)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: twitterColor,
              shape: StadiumBorder(),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(_tweetEditingController.text)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void postTweetForm() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Processing Data'),
      ),
    );
  }
}

class TweetPostForm extends StatefulWidget {
  TweetPostForm({Key key}) : super(key: key);

  @override
  State<TweetPostForm> createState() => TweetPostFormState();
}
