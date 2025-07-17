import '../entity/auth_entity.dart';

abstract class LoginRepository {
  Future<AuthEntity?> loginAdmin(String email, String password);
  Future<AuthEntity?> loginUser(String email, String password);
  Future<void> updateLastLogin(String table, int id);
}
