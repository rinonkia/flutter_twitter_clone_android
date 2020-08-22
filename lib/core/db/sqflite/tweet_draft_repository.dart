import 'package:document/core/model/tweet_draft.dart';
import 'package:document/core/db/sqflite_repository.dart';

class TweetDraftRepository extends SqfliteRepository {
  final table = 'tweet_draft';

  Future<TweetDraft> create(Map<String, dynamic> row) async {
    final id = await super.insert(row);

    return TweetDraft(
      id: id,
      body: row["body"],
      createdAt: row["created_at"],
    );
  }

  Future<List<TweetDraft>> getAll() async {
    final db = await super.provider.database;
    final rows = await db.rawQuery('SELECT * FROM $table ORDER BY _id DESC');
    if (rows.isEmpty) return null;

    return rows.map((e) => TweetDraft.fromMap(e)).toList();
  }

  Future<TweetDraft> single(int id) async {
    final db = await super.provider.database;
    final rows = await db.rawQuery('SELECT * FROM $table WHERE _id = ?', [id]);
    if (rows.isEmpty) return null;

    return TweetDraft.fromMap(rows.first);
  }
}
