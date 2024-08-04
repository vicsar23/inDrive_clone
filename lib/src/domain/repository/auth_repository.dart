
import 'package:indrive_clone/src/domain/models/auth_response.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';

abstract class AuthRepository{
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
}