import 'package:document/core/model/tweet_draft.dart';
import 'package:document/core/db/sqflite_repository.dart';

class TweetDraftRepository {
  static String table = 'tweet_draft';
  static final sqfliteRepository = SqfliteRepository(table: table);

  Future<TweetDraft> create(Map<String, dynamic> row,
      {body, String createdAt}) async {
    final db = await sqfliteRepository.provider.database;
    final id = await db.insert(table, row);

    return TweetDraft(
      id: id,
      body: row["body"],
      createdAt: row["created_at"],
    );
  }

  static Future<List<TweetDraft>> getAll() async {
    final db = await sqfliteRepository.provider.database;
    final rows = await db.rawQuery('SELECT * FROM $table ORDER BY id DESC');
    if (rows.isEmpty) return null;

    return rows.map((e) => TweetDraft.fromMap(e)).toList();
  }

  static Future<TweetDraft> single(int id) async {
    final db = await sqfliteRepository.provider.database;
    final rows = await db.rawQuery('SELECT * FROM $table WHERE id = ?', [id]);
    if (rows.isEmpty) return null;

    return TweetDraft.fromMap(rows.first);
  }

  static Future<int> delete(int id) async {
    final rowsDeleted = await sqfliteRepository.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
    return rowsDeleted;
  }
}
