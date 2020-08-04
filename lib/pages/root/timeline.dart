import 'package:flutter/material.dart';
import 'package:document/colors.dart';
import 'package:document/core/model/tweet.dart';

class TimeLine extends StatelessWidget {
  final Color color; // 使っていない
  final String title; // 使っていない

  TimeLine({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tweet> list = [
      Tweet(
        userName: 'akinori',
        body: 'メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ',
        pictureUrl: 'images/myprofile.jpg',
      ),
      Tweet(
        userName: 'tomohiro',
        body: 'こんにちは',
        pictureUrl: 'images/default.jpg',
      ),
      Tweet(
        userName: 'daisuke',
        body: 'こんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんは',
        pictureUrl: 'images/twitter_blue.png',
      ),
    ];

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= list.length) {
            list.addAll([
              Tweet(
                  userName: 'hogehoge',
                  body: 'hugahuga',
                  pictureUrl: 'images/twitter_blue.png'),
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
    );
  }

  Widget _userTweetContent(Tweet tweet) {
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
                    backgroundImage: AssetImage(tweet.getrPictureUrl),
                  ),
                ],
              ),
              SizedBox(width: 10.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      tweet.getUserName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      tweet.getrBody,
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
