import 'package:document/pages/root/test.dart';
import 'package:flutter/material.dart';
import 'package:document/colors.dart';
import 'package:document/pages/root/timeline.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNaviCurrentIndex = 0;
  final _pageWidgets = [
    TimeLine(),
    SearchPage(),
    PageWidget(color: Colors.yellow, title: 'Notice'),
    PageWidget(color: Colors.orange, title: 'DM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn',
        onPressed: () {
          Navigator.of(context).pushNamed("/tweet_post");
        },
        child: Icon(Icons.add),
        backgroundColor: twitterColor,
      ),
      body: _pageWidgets.elementAt(_bottomNaviCurrentIndex),
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
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) =>
      setState(() => _bottomNaviCurrentIndex = index);
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  PageWidget({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
