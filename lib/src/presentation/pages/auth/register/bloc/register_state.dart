import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem sourceName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const RegisterState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.sourceName = const BlocFormItem(error: 'Ingresa los apellidos'),
    this.email = const BlocFormItem(error: 'Ingresa el email'),
    this.phone = const BlocFormItem(error: 'Ingresa el número de teléfono'),
    this.password = const BlocFormItem(error: 'Ingresa la contraseña'),
    this.confirmPassword = const BlocFormItem(error: 'Confirma la contraseña'),
    this.formKey,
    this.response,
  });

  toUser() => User(
    name: name.value,
    lastname: sourceName.value,
    email: email.value,
    phone: phone.value,
    password: password.value,
  );

  RegisterState copyWith(
      {BlocFormItem? name,
      BlocFormItem? sourceName,
      BlocFormItem? email,
      BlocFormItem? phone,
      BlocFormItem? password,
      BlocFormItem? confirmPassword,
      GlobalKey<FormState>? formKey,
      Resource? response}) {
    return RegisterState(
      name: name ?? this.name,
      sourceName: sourceName ?? this.sourceName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props =>
      [name, sourceName, email, phone, password, confirmPassword, response];
}
