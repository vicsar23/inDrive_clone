import 'package:indrive_clone/src/domain/useCases/auth/login_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/auth/register_use_cases.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCases register;

  AuthUseCases({required this.login, required this.register});
}
