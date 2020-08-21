import 'package:document/core/db/sqflite_repository.dart';

class MyTableRepository {
  final sqfliteRepository = SqfliteRepository(table: 'my_table');

  void insert() async {
    Map<String, dynamic> row = {
      'name': 'Bob',
      'age': 23,
    };
    final id = await sqfliteRepository.insert(row);
    print('inserted row id: $id');
  }

  void query() async {
    final allRows = await sqfliteRepository.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void update() async {
    Map<String, dynamic> row = {
      'name': 'Mary',
      'age': 33,
    };
    int id = 1;
    final rowsAffected = await sqfliteRepository.update(id, row);
    print('updated $rowsAffected row(s)');
  }

  void delete() async {
    final id = await sqfliteRepository.queryRowCount();
    final rowsDeleted = await sqfliteRepository.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
