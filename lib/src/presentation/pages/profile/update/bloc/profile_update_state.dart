import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

class ProfileUpdateState extends Equatable {
  final int id;

  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const ProfileUpdateState(
      {this.id = 0,
      this.name = const BlocFormItem(error: 'Ingresa el nombre'),
      this.lastName = const BlocFormItem(error: 'Ingresa los apeliidos'),
      this.phone = const BlocFormItem(error: 'Ingresa el teléfono'),
      this.response,
      this.formKey});

  toUser() =>
      User(name: name.value, lastname: lastName.value, phone: phone.value);

  ProfileUpdateState copyWith(
      {BlocFormItem? name,
      int? id,
      BlocFormItem? lastName,
      BlocFormItem? phone,
      GlobalKey<FormState>? formKey,
      Resource? response}) {
    return ProfileUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        formKey: formKey,
        response: response);
  }

  @override
  List<Object?> get props => [id, name, lastName, phone, response];
}
