import 'package:flutter/material.dart';
import 'package:document/colors.dart';
import 'package:document/core/model/tweet_draft.dart';
import 'package:document/core/db/sqflite/tweet_draft_repository.dart';

class TweetDraftPage extends StatefulWidget {
  @override
  _TweetDraftPageState createState() => _TweetDraftPageState();
}

class _TweetDraftPageState extends State<TweetDraftPage> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: TweetDraftRepository.getAll(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text('loading...');
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("下書き"),
        backgroundColor: darkColor,
      ),
      backgroundColor: darkColor,
      body: futureBuilder,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<TweetDraft> tweetDraftList = snapshot.data;
    return ListView.builder(
      itemCount: tweetDraftList != null ? tweetDraftList.length : 0,
      itemBuilder: (BuildContext context, int index) {
        TweetDraft tweetDraft = tweetDraftList[index];
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(
                tweetDraft.getBody,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              onTap: () {
                final draftBody = tweetDraft.getBody;
                TweetDraftRepository.delete(tweetDraft.getId);
                Navigator.of(context).pop(draftBody);
              },
              onLongPress: () => showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    backgroundColor: darkColor,
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          final draftBody = tweetDraft.getBody;
                          TweetDraftRepository.delete(tweetDraft.getId);
                          // MyHomePageにtextを持っていく（力技っぽい）
                          Navigator.of(context).pop(draftBody);
                          Navigator.of(context).pop(draftBody);
                        },
                        child: Text(
                          "編集する",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          setState(() {
                            TweetDraftRepository.delete(tweetDraft.id);
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          "削除する",
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
            Divider(height: 1.0),
          ],
        );
      },
    );
  }
}
