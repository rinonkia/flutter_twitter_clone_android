import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:document/pages/root_widget.dart';
import 'package:document/pages/home.dart';
import 'package:document/pages/register.dart';
import 'package:document/pages/login.dart';
import 'package:document/pages/tweet_post.dart';
import 'package:document/pages/tweet_draft.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      home: RootWidget(),
      routes: <String, WidgetBuilder>{
        '/root': (BuildContext context) => HomePage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/tweet_post': (BuildContext context) => TweetPost(),
        '/tweet_draft': (BuildContext context) => TweetDraftPage(),
      },
    );
  }
}
