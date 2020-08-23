import 'package:flutter/material.dart';
import 'package:document/colors.dart';
import 'package:document/core/model/tweet_draft.dart';
import 'package:document/core/db/sqflite/tweet_draft_repository.dart';

class TweetDraftPage extends StatelessWidget {
  final TweetDraftRepository repository = TweetDraftRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下書き'),
        backgroundColor: darkColor,
      ),
      backgroundColor: darkColor,
      body: Container(
        decoration: BoxDecoration(color: darkColor),
        child: FutureBuilder(
          future: repository.getAll(),
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              print('projectc snapshot data is: ${projectSnap.data}');
              return Container();
            }
            return ListView.builder(
              itemCount: projectSnap.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _tweetDraftContent(context, projectSnap.data[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _tweetDraftContent(BuildContext context, TweetDraft tweet) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: ListTile(
        title: Text(
          tweet.body,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        onTap: () => print('select text'),
        onLongPress: () => showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: darkColor,
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "下書きを編集",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "下書きを削除",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
