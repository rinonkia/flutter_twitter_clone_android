import 'package:document/core/db/db_provider.dart';
import 'package:document/core/db/sqflite_repository.dart';
import 'package:flutter/material.dart';

class SqflitePage extends StatelessWidget {
  SqflitePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchPage());
  }
}

class SearchPage extends StatelessWidget {
  // reference to our single class that manages the database
  final sqfliteRepository = SqfliteRepository(table: 'my_table');

  // layout
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('insert', style: TextStyle(fontSize: 20)),
            onPressed: () => _insert(),
          ),
          RaisedButton(
            child: Text('query', style: TextStyle(fontSize: 20)),
            onPressed: () => _query(),
          ),
          RaisedButton(
            child: Text('update', style: TextStyle(fontSize: 20)),
            onPressed: () => _update(),
          ),
          RaisedButton(
            child: Text('delete', style: TextStyle(fontSize: 20)),
            onPressed: () => _delete(),
          ),
        ],
      ),
    );
  }

  // Button onPressed methods

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DBProvider.columnName: 'Bob',
      DBProvider.columnAge: 23,
    };
    final id = await sqfliteRepository.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await sqfliteRepository.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DBProvider.columnId: 1,
      DBProvider.columnName: 'Mary',
      DBProvider.columnAge: 32
    };
    int id = 1;
    final rowsAffected = await sqfliteRepository.update(id, row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await sqfliteRepository.queryRowCount();
    final rowsDeleted = await sqfliteRepository.delete(id);
    print('deleted $rowsDeleted  row(s): row $id');
  }
}
