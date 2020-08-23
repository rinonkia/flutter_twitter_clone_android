import 'package:flutter/foundation.dart';

class TweetDraft {
  TweetDraft({
    @required this.id,
    @required this.body,
    @required this.createdAt,
  })  : assert(id != null),
        assert(body != null),
        assert(createdAt != null);

  int id;
  String body;
  String createdAt;

  int get getId => id;
  String get getBody => '$body';
  String get getCreatedAt => '$createdAt';

  TweetDraft.newDraft(String text) {
    body = text;
    createdAt = '2020-08-13 00:00:00';
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": body,
        "created_at": createdAt,
      };

  factory TweetDraft.fromMap(Map<String, dynamic> json) => TweetDraft(
        id: json["id"],
        body: json["body"],
        createdAt: json["created_at"],
      );
}
