import 'package:flutter/material.dart';
import 'package:document/pages/timeline.dart';
import 'package:document/pages/tweet_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column & Row',
      home: TimeLine(),
      routes: <String, WidgetBuilder>{
        '/timeline': (BuildContext context) => TimeLine(),
        '/tweet_post': (BuildContext context) => TweetPost(),
      },
    );
  }
}
