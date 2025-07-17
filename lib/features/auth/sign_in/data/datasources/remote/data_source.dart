import '../../../../../../core/database/db_helper.dart';
import '../../models/model.dart';

class AuthDataSource {
  final DBHelper _db = DBHelper();

  Future<AuthModel?> getAdminByEmail(String email) async {
    final admin = await _db
        .table('admins')
        .join('roles', 'admins.role_id', '=', 'roles.id')
        .select([
          'admins.*',
          'roles.name as role_name',
          'roles.display_name as role_display_name'
        ])
        .where('admins.email', email)
        .first();

    if (admin != null && admin['is_active'] != 1) {
      return null;
    }

    return admin != null ? AuthModel.fromMap(admin) : null;
  }

  Future<AuthModel?> getUserByEmail(String email) async {
    final user = await _db
        .table('users')
        .where('email', email)
        .where('is_active', 1)
        .first();

    return user != null ? AuthModel.fromMap(user) : null;
  }

  Future<void> updateLastLogin(String table, int id) async {
    await _db.table(table).where('id', id).update({
      'last_login_at': DateTime.now().toIso8601String(),
    });
  }
}
