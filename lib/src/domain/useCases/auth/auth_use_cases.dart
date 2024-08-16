import 'package:indrive_clone/src/domain/useCases/auth/get_user_session_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/auth/login_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/auth/register_use_cases.dart';
import 'package:indrive_clone/src/domain/useCases/auth/save_user_session_use_case.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCases register;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;

  AuthUseCases(
      {required this.login,
      required this.register,
      required this.saveUserSession,
      required this.getUserSession});
}
