import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/repository/auth_repository.dart';

class RegisterUseCases{

  AuthRepository authRepository;
  RegisterUseCases( this.authRepository);

  run(User user) => authRepository.register(user);
}