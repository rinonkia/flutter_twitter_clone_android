import 'package:flutter/material.dart';
import 'package:document/colors.dart';
import 'package:document/core/model/tweet.dart';

class TimeLine extends StatelessWidget {
  TimeLine({Key key}) : super(key: key);

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
                pictureUrl: 'images/twitter_blue.png',
              ),
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
              RetweetIconButton(),
              TweetLikeIconButton(),
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

class _TweetLikeIconButtonState extends State<TweetLikeIconButton> {
  bool alreadyLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(alreadyLiked ? Icons.favorite : Icons.favorite_border),
      color: alreadyLiked ? Colors.pink : Colors.grey,
      onPressed: () {
        setState(
          () {
            if (alreadyLiked) {
              alreadyLiked = false;
            } else {
              alreadyLiked = true;
            }
          },
        );
      },
    );
  }
}

class TweetLikeIconButton extends StatefulWidget {
  @override
  State<TweetLikeIconButton> createState() => _TweetLikeIconButtonState();
}

class _RetweetIconButtonState extends State<RetweetIconButton> {
  bool alreadyRetweet = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.repeat),
      color: alreadyRetweet ? Colors.lightGreen : Colors.grey,
      onPressed: () {
        setState(
          () {
            if (alreadyRetweet) {
              alreadyRetweet = false;
            } else {
              alreadyRetweet = true;
            }
          },
        );
      },
    );
  }
}

class RetweetIconButton extends StatefulWidget {
  @override
  State<RetweetIconButton> createState() => _RetweetIconButtonState();
}
