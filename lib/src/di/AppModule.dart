import 'package:indrive_clone/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indrive_clone/src/data/repository/auth_repository_implementation.dart';
import 'package:indrive_clone/src/domain/repository/auth_repository.dart';
import 'package:indrive_clone/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indrive_clone/src/domain/useCases/auth/login_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/auth/register_use_cases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImplementation(authService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCases(authRepository));
}
