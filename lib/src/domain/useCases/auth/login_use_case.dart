
import 'package:indrive_clone/src/data/repository/auth_repository_implementation.dart';
import 'package:indrive_clone/src/domain/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepository repository = AuthRepositoryImplementation();

  run(String email, String password) => repository.login(email, password);
}