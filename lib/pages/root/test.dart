import 'package:document/core/db/sqflite/my_table_repository.dart';
import 'package:flutter/material.dart';

class SqflitePage extends StatelessWidget {
  SqflitePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchPage());
  }
}

final MyTableRepository repository = MyTableRepository();

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  // layout
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('insert', style: TextStyle(fontSize: 20)),
            onPressed: () => repository.insert(),
          ),
          RaisedButton(
            child: Text('query', style: TextStyle(fontSize: 20)),
            onPressed: () => repository.query(),
          ),
          RaisedButton(
            child: Text('update', style: TextStyle(fontSize: 20)),
            onPressed: () => repository.update(),
          ),
          RaisedButton(
            child: Text('delete', style: TextStyle(fontSize: 20)),
            onPressed: () => repository.delete(),
          ),
        ],
      ),
    );
  }
}
