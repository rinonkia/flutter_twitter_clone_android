import 'dart:io';
import 'package:document/core/model/tweet_draft.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        return await db.execute("CREATE DATABASE tweet_draft("
            "id INTEGER AUTO_INCREMENT PRIMARY KEY,"
            "body TEXT,"
            "created_at TEXT,"
            ")");
      },
    );
  }

  static final _tableName = 'TweetDraft';

  createDraft(TweetDraft draft) async {
    final db = await database;
    var res = await db.insert(_tableName, draft.toMap());
    return res;
  }

  getAllDrafts() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<TweetDraft> list =
        res.isNotEmpty ? res.map((c) => TweetDraft.fromMap(c)).toList() : [];
    return list;
  }

  deleteTodo(String id) async {
    final db = await database;
    var res = db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    return res;
  }
}
