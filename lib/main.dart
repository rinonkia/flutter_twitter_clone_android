import 'package:flutter/material.dart';
import 'package:document/pages/root_widget.dart';
import 'package:document/pages/tweet_post.dart';
import 'package:document/pages/tweet_draft.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      home: RootWidget(),
      routes: <String, WidgetBuilder>{
        '/root': (BuildContext context) => RootWidget(),
        '/tweet_post': (BuildContext context) => TweetPost(),
        '/tweet_draft': (BuildContext context) => TweetDraftPage(),
      },
    );
  }
}
