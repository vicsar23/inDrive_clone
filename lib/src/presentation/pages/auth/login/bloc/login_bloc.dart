import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();
  AuthUseCases authUseCases;

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKeyLogin: formKey));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingresa el email' : null),
          formKeyLogin: formKey));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingresa la contraseña'
                  : event.password.value.length < 6
                      ? 'La contraseña debe tener al menos 6 caracteres'
                      : null),
          formKeyLogin: formKey));
    });
    on<FormSubmit>((event, emit) async {
      if (kDebugMode) {
        print("Emai: ${state.email.value}");
        print("Password: ${state.password.value}");
      }
      emit(state.copyWith(response: Loading(), formKeyLogin: formKey));

      await Future.delayed(Duration(seconds: 2));
      Resource response =
          await authUseCases.login.run(state.email.value, state.password.value);

      emit(state.copyWith(response: response, formKeyLogin: formKey));
    });
    on<FormReset>((event, emit) {
      state.formKeyLogin?.currentState?.reset();
      emit(state.copyWith(
        formKeyLogin: formKey,
        email: BlocFormItem(value: ''),
        password: BlocFormItem(value: ''),
      ));
    });
  }
}
