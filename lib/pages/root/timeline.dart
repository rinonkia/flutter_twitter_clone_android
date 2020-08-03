import 'package:flutter/material.dart';
import 'package:document/colors.dart';

class TimeLine extends StatelessWidget {
  final Color color; // 使っていない
  final String title; // 使っていない

  TimeLine({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
    ];

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= list.length) {
            list.addAll([
              "messageこんにちはこんにちはこんにちはこんにちは",
              "messageこんにちはこんにちはこんにちはこんにちは",
              "messageこんにちはこんにちはこんにちはこんにちは",
            ]);
          }
          return _userTweetContent(list[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/tweet_post");
        },
        child: Icon(Icons.add),
        backgroundColor: twitterColor,
      ),
      // body: _pageWidgets.elementAt(_bottomNaviCurrentIndex),
    );
  }

  Widget _userTweetContent(String tweetText) {
    return Container(
      color: darkColor,
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("images/default.jpg"),
                  ),
                ],
              ),
              SizedBox(width: 10.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      tweetText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                color: Colors.grey,
                onPressed: () => print('reply'),
              ),
              IconButton(
                icon: Icon(Icons.repeat),
                color: Colors.grey,
                onPressed: () => print('retweet'),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.grey,
                onPressed: () => print('favorite'),
              ),
              IconButton(
                icon: Icon(Icons.share),
                color: Colors.grey,
                onPressed: () => print('share'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
