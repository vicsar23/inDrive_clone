import 'package:equatable/equatable.dart';
import 'package:indrive_clone/src/domain/models/user.dart';

class ProfileInfoState extends Equatable {
  final User? user;

  const ProfileInfoState({this.user});

  ProfileInfoState copyWith({User? user}) {
    return ProfileInfoState(user: user);
  }

  @override
  List<Object?> get props => [user];
}
