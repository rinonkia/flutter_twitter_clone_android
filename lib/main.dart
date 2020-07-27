import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _bottomNaviCurrentIndex = 0;
    var list = [
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
      "メッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージメッセージ",
    ];
    return MaterialApp(
      title: 'Column & Row',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/myprofile.jpg'),
              ),
              Center(
                child: Image.asset(
                  'images/twitter_blue.png',
                  height: 20,
                ),
              ),
              IconButton(
                icon: Icon(Icons.flare),
                color: twitterColor,
                onPressed: () {
                  print('Yoga Flame');
                },
              )
            ],
          ),
          backgroundColor: darkColor,
          elevation: 3,
        ),
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
            print('FloatActionButton Pressed!');
          },
          child: Icon(Icons.add),
          backgroundColor: twitterColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          backgroundColor: darkColor,
          iconSize: 30.0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: SizedBox.shrink(),
            ),
          ],
          currentIndex: _bottomNaviCurrentIndex,
          fixedColor: twitterColor,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _userTweetContent(String tweetText) {
    return Container(
      color: darkColor,
      padding: EdgeInsets.all(15.0),
      child: Row(
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
    );
  }
}
