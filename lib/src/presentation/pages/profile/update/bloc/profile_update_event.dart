import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

abstract class ProfileUpdateEvent {}

class ProfileUpdateInitEvent extends ProfileUpdateEvent{
  final User? user;

  ProfileUpdateInitEvent({required this.user});
}

class NameChanged extends ProfileUpdateEvent {
  final BlocFormItem name;

  NameChanged({required this.name});
}
class LastNameChanged extends ProfileUpdateEvent {
  final BlocFormItem lastName;

  LastNameChanged({required this.lastName});
}
class PhoneChanged extends ProfileUpdateEvent {
  final BlocFormItem phone;
  PhoneChanged({required this.phone});
}
class FormSubmit extends ProfileUpdateEvent {

}