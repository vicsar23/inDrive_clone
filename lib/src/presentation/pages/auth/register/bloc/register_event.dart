
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

abstract class RegisterEvent{}

class RegisterInitEvent extends RegisterEvent{}

class NameChanged extends RegisterEvent{
  final BlocFormItem name;
  NameChanged({required this.name});
}

class SourceNameChanged extends RegisterEvent{
  final BlocFormItem sourceName;
  SourceNameChanged({required this.sourceName});
}
class EmailChangedRegister extends RegisterEvent{
  final BlocFormItem email;
  EmailChangedRegister({required this.email});
}
class PhoneChangedRegister extends RegisterEvent{
  final BlocFormItem phone;
  PhoneChangedRegister({required this.phone});
}
class PasswordChangedRegister extends RegisterEvent{
  final BlocFormItem password;
  PasswordChangedRegister({required this.password});
}
class ConfirmPasswordChangedRegister extends RegisterEvent{
  final BlocFormItem confirmPassword;
  ConfirmPasswordChangedRegister({required this.confirmPassword});
}

class FormSubmitRegister extends RegisterEvent{}
class FormResetRegister extends RegisterEvent{}