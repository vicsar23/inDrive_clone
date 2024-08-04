import 'package:indrive_clone/src/domain/repository/auth_repository.dart';

class LoginUseCase {
  AuthRepository repository;

  LoginUseCase(this.repository);
  run(String email, String password) => repository.login(email, password);
}
