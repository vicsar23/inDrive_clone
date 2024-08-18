import 'dart:io';

import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/repository/users_repository.dart';

class UpdateUserUseCase {
  UsersRepository usersRepository;

  UpdateUserUseCase(this.usersRepository);

  run(int id, User user, File? file) => usersRepository.update(id, user, file );
}
