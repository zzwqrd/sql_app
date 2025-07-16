import 'package:sqflite/sqflite.dart';

abstract class Migration {
  String get name;

  // تم تغيير النوع إلى DatabaseExecutor ليتوافق مع Transaction
  Future<void> up(DatabaseExecutor db);
  Future<void> down(DatabaseExecutor db);

  Future<void> createTable(
      DatabaseExecutor db, String table, String columns) async {
    await db.execute('CREATE TABLE IF NOT EXISTS $table ($columns)');
  }

  Future<void> dropTable(DatabaseExecutor db, String table) async {
    await db.execute('DROP TABLE IF EXISTS $table');
  }

  Future<void> addColumn(
      DatabaseExecutor db, String table, String column, String type) async {
    await db.execute('ALTER TABLE $table ADD COLUMN $column $type');
  }

  Future<void> renameTable(
      DatabaseExecutor db, String oldName, String newName) async {
    await db.execute('ALTER TABLE $oldName RENAME TO $newName');
  }

  Future<void> createIndex(DatabaseExecutor db, String indexName, String table,
      String columns) async {
    await db
        .execute('CREATE INDEX IF NOT EXISTS $indexName ON $table ($columns)');
  }

  Future<void> dropIndex(DatabaseExecutor db, String indexName) async {
    await db.execute('DROP INDEX IF EXISTS $indexName');
  }

  Future<void> insertData(DatabaseExecutor db, String table,
      List<Map<String, dynamic>> data) async {
    for (final row in data) {
      await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.ignore);
    }
  }
}
