import 'package:flutter/foundation.dart';

class TweetDraft {
  const TweetDraft({
    @required this.id,
    @required this.body,
    @required this.createdAt,
  })  : assert(id != null),
        assert(body != null),
        assert(createdAt != null);

  final int id;
  final String body;
  final String createdAt;

  int get getId => id;
  String get getBody => '$body';
  String get getCreatedAt => '$createdAt';
}
