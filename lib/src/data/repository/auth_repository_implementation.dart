import 'package:indrive_clone/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indrive_clone/src/domain/models/auth_response.dart';
import 'package:indrive_clone/src/domain/repository/auth_repository.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';

class AuthRepositoryImplementation implements AuthRepository {
  AuthService authService;

  AuthRepositoryImplementation(this.authService);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }
}
