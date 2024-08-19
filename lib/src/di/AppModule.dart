import 'package:indrive_clone/src/data/dataSource/local/shared_pref.dart';
import 'package:indrive_clone/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indrive_clone/src/data/dataSource/remote/services/users_service.dart';
import 'package:indrive_clone/src/data/repository/auth_repository_implementation.dart';
import 'package:indrive_clone/src/data/repository/geolocator_repository_impl.dart';
import 'package:indrive_clone/src/data/repository/users_repository_impl.dart';
import 'package:indrive_clone/src/domain/models/auth_response.dart';
import 'package:indrive_clone/src/domain/repository/auth_repository.dart';
import 'package:indrive_clone/src/domain/repository/geolocator_repository.dart';
import 'package:indrive_clone/src/domain/repository/users_repository.dart';
import 'package:indrive_clone/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indrive_clone/src/domain/useCases/auth/get_user_session_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/auth/login_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/auth/logout_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/auth/register_use_cases.dart';
import 'package:indrive_clone/src/domain/useCases/auth/save_user_session_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/geolocator/find_position_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/geolocator/geolocator_use_cases.dart';
import 'package:indrive_clone/src/domain/useCases/users/update_user_use_case.dart';
import 'package:indrive_clone/src/domain/useCases/users/users_use_cases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  SharedPref get sharedPref => SharedPref();
  @injectable
  Future<String> get token async {
    String token = '';
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImplementation(authService, sharedPref);
  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);
  @injectable
  GeolocatorRepository get geolocatorRepository => GeolocatorRepositoryImpl();

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCases(authRepository),
      saveUserSession: SaveUserSessionUseCase(authRepository),
      getUserSession: GetUserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository));

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(update: UpdateUserUseCase(usersRepository));
  @injectable
  GeolocatorUseCases get geolocatorUseCases => GeolocatorUseCases(
      findPosition: FindPositionUseCase(geolocatorRepository));
}
