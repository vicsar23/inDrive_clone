import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKeyLogin;
  final BlocFormItem email;
  final BlocFormItem password;

  const LoginState(
      {this.formKeyLogin,
      this.email = const BlocFormItem( error: "Ingresa un email"),
      this.password = const BlocFormItem(error: "Ingresa una contraseña")});

  @override
  List<Object?> get props => [email, password];

  LoginState copyWith({
    GlobalKey<FormState>? formKeyLogin,
    BlocFormItem? email,
    BlocFormItem? password,
  }) {
    return LoginState(
      formKeyLogin: formKeyLogin,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
