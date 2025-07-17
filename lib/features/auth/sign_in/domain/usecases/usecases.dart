import 'package:sq_app/features/auth/sign_in/data/repository_impl/repository_impl.dart';

import '../entity/auth_entity.dart';

abstract class LoginUseCase {
  Future<AuthEntity?> loginAdmin(String email, String password);
  Future<AuthEntity?> loginUser(String email, String password);
  Future<void> updateLastLogin(String table, int id);
}

class LoginUseCaseImp implements LoginUseCase {
  final repository = LoginRepositoryImp();

  @override
  Future<AuthEntity?> loginAdmin(String email, String password) {
    return repository.loginAdmin(email, password);
  }

  @override
  Future<AuthEntity?> loginUser(String email, String password) {
    return repository.loginUser(email, password);
  }

  @override
  Future<void> updateLastLogin(String table, int id) {
    return repository.updateLastLogin(table, id);
  }
}
