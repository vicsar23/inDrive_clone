import 'dart:io';

import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';

abstract class UsersRepository {
  Future<Resource<User>> update(int id, User user, File? file);
}
