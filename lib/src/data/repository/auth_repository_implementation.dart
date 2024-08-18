import 'package:indrive_clone/src/data/dataSource/local/shared_pref.dart';
import 'package:indrive_clone/src/data/dataSource/remote/services/auth_service.dart';
import 'package:indrive_clone/src/domain/models/auth_response.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/repository/auth_repository.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';

class AuthRepositoryImplementation implements AuthRepository {
  AuthService authService;
  SharedPref sharedPref;

  AuthRepositoryImplementation(this.authService, this.sharedPref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  
  @override
  Future<void> saveUserSession(AuthResponse authResponse) async{
    sharedPref.save('user',authResponse.toJson());
  }
  @override
  Future<AuthResponse?> getUserSession() async{
    final data = await sharedPref.read('user');
    if(data!= null){
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }
  
  @override
  Future<bool> logout() async {
    sharedPref.remove('user');
    return Future.value(true);
  }
}
