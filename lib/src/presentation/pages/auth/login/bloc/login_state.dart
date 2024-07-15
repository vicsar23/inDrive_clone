import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final String email;
  final String password;

  const LoginState({this.formKey, this.email = "",  this.password = ""});

  @override
  List<Object?> get props => [email, password];

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    String? email,
    String? password,
  }) {
    return LoginState(
      formKey: formKey,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
