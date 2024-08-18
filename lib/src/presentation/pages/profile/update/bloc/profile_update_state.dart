import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

class ProfileUpdateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  const ProfileUpdateState(
      {this.name = const BlocFormItem(error: 'Ingresa el nombre'),
      this.lastName = const BlocFormItem(error: 'Ingresa los apeliidos'),
      this.phone = const BlocFormItem(error: 'Ingresa el teléfono'),
      this.formKey});

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? phone, 
     GlobalKey<FormState>? formKey
    }) {
    return ProfileUpdateState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [name, lastName, phone];
}
