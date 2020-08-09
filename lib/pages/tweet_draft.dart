import 'package:flutter/material.dart';
import 'package:document/colors.dart';
import 'package:document/core/model/tweet_draft.dart';

class TweetDraftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<TweetDraft> list = [
      TweetDraft(
        id: 1,
        body: 'こんにちはこんにちこんにちこんにちこんにちこんにちこんにちこんにちこんにちはははははははは',
        createdAt: '2001-10-10 00:00:00',
      ),
      TweetDraft(
        id: 2,
        body: 'test',
        createdAt: '2001-10-12 00:00:00',
      ),
      TweetDraft(
        id: 3,
        body:
            '下書きできてます下書きできてます下書きできてます下書きできてます\n下書きできてます下書きできてます下書きできてます下書きできてますか',
        createdAt: '2001-10-13 00:00:00',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('下書き'),
      ),
      backgroundColor: darkColor,
      body: Container(
        decoration: BoxDecoration(color: darkColor),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _tweetDraftContent(list[index]);
          },
        ),
      ),
    );
  }

  Widget _tweetDraftContent(TweetDraft tweet) {
    return Container(
      color: darkColor,
      padding: EdgeInsets.all(15.0),
      child: Text(
        tweet.body,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
