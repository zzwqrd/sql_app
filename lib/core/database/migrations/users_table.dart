import 'package:sqflite/sqflite.dart';

import '../seeder/users_seeder.dart';
import 'migration.dart';

class CreateUsersTable extends Migration {
  @override
  String get name => '2024_01_01_000002_create_users_table';

  @override
  Future<void> up(DatabaseExecutor db) async {
    await createTable(db, 'users', '''
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT UNIQUE NOT NULL,
      email TEXT UNIQUE NOT NULL,
      password_hash TEXT NOT NULL,
      token TEXT UNIQUE NOT NULL,
      first_name TEXT,
      last_name TEXT,
      phone TEXT,
      avatar TEXT,
      is_active INTEGER DEFAULT 1,
      is_verified INTEGER DEFAULT 0,
      last_login_at TEXT,
      created_at TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%S', 'now', 'localtime')),
      updated_at TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%S', 'now', 'localtime'))
    ''');

    await createIndex(db, 'idx_users_username', 'users', 'username');
    await createIndex(db, 'idx_users_email', 'users', 'email');
    await createIndex(db, 'idx_users_active', 'users', 'is_active');

    // إنشاء trigger لتحديث updated_at
    await db.execute('''
      CREATE TRIGGER IF NOT EXISTS update_users_timestamp
      AFTER UPDATE ON users
      BEGIN
        UPDATE users SET updated_at = strftime('%Y-%m-%d %H:%M:%S', 'now', 'localtime') 
        WHERE id = NEW.id;
      END
    ''');
    await UsersSeeder().run(db);
  }

  @override
  Future<void> down(DatabaseExecutor db) async {
    await db.execute('DROP TRIGGER IF EXISTS update_users_timestamp');
    await dropIndex(db, 'idx_users_username');
    await dropIndex(db, 'idx_users_email');
    await dropIndex(db, 'idx_users_active');
    await dropTable(db, 'users');
  }
}
