import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, formKey: formKey));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, formKey: formKey));
    });
    on<FormSubmit>((event, emit) {
      if (kDebugMode) {
        print("Emai: ${state.email}");
        print("Password: ${state.password}");
      }
    });
  }
}
