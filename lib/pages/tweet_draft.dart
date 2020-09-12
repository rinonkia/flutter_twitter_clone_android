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

// class TweetDraftPage extends StatelessWidget {
//   final TweetDraftRepository repository = TweetDraftRepository();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('下書き'),
//         backgroundColor: darkColor,
//       ),
//       backgroundColor: darkColor,
//       body: Container(
//         decoration: BoxDecoration(color: darkColor),
//         child: FutureBuilder(
//           future: TweetDraftRepository.getAll(),
//           builder: (context, projectSnap) {
//             if (projectSnap.connectionState == ConnectionState.none &&
//                 projectSnap.hasData == null) {
//               print('projectc snapshot data is: ${projectSnap.data}');
//               return Container();
//             }
//             return ListView.builder(
//               itemCount: projectSnap.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return _tweetDraftContent(context, projectSnap.data[index]);
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _tweetDraftContent(BuildContext context, TweetDraft tweet) {
//     return Container(
//       padding: EdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(color: Colors.grey),
//         ),
//       ),
//       child: ListTile(
//         title: Text(
//           tweet.body,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18.0,
//           ),
//         ),
//         onTap: () => print('select text'),
//         onLongPress: () => showDialog(
//           context: context,
//           builder: (context) {
//             return SimpleDialog(
//               backgroundColor: darkColor,
//               children: <Widget>[
//                 SimpleDialogOption(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text(
//                     "下書きを編集",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ),
//                 SimpleDialogOption(
//                   onPressed: () {
//                     TweetDraftRepository.sqfliteRepository.delete(tweet.getId);
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     "下書きを削除",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
