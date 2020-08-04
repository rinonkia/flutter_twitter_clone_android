import 'package:flutter/foundation.dart';

class Tweet {
  const Tweet({
    @required this.userName,
    @required this.body,
    @required this.pictureUrl,
  })  : assert(userName != null),
        assert(body != null),
        assert(pictureUrl != null);

  final String userName;
  final String body;
  final String pictureUrl;

  String get getUserName => '$userName';
  String get getrBody => '$body';
  String get getrPictureUrl => '$pictureUrl';
}
