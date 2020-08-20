import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'db_provider.dart';

// 名前があまり相応しくないかも
class SqfliteRepository {
  final String table;
  final DBProvider provider = DBProvider.instance;

  SqfliteRepository({
    @required this.table,
  }) : assert(table != null);

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await provider.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await provider.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await provider.database;
    return Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $table'),
    );
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(int id, Map<String, dynamic> row) async {
    Database db = await provider.database;
    return await db.update(table, row, where: '_id = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await provider.database;
    return await db.delete(table, where: '_id = ?', whereArgs: [id]);
  }
}
