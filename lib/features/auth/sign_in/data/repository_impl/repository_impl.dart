import '../../domain/entity/auth_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote/data_source.dart';

class LoginRepositoryImp implements LoginRepository {
  final dataSource = AuthDataSource();

  @override
  Future<AuthEntity?> loginAdmin(String email, String password) async {
    final admin = await dataSource.getAdminByEmail(email);
    if (admin != null && admin.passwordHash == password) {
      return AuthEntity(
        id: admin.id,
        username: admin.username,
        email: admin.email,
        firstName: admin.firstName,
        lastName: admin.lastName,
        phone: admin.phone,
      );
    }
    return null;
  }

  @override
  Future<AuthEntity?> loginUser(String email, String password) async {
    final user = await dataSource.getUserByEmail(email);
    if (user != null && user.passwordHash == password) {
      return AuthEntity(
        id: user.id,
        username: user.username,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        phone: user.phone,
      );
    }
    return null;
  }

  @override
  Future<void> updateLastLogin(String table, int id) async {
    await dataSource.updateLastLogin(table, id);
  }
}
