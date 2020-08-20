import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  final _databaseName = "MyDatabase.db";
  final _databaseVersion = 1;

  static final table = 'my_table'; // 削除して良さそう
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // make this singleton class
  DBProvider._();
  static final DBProvider instance = DBProvider._();

  // only have a single app-wide reference to the database
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  //this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnAge INTEGER NOT NULL
    )''');
  }
}
