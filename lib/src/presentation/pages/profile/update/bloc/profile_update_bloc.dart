import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indrive_clone/src/domain/models/auth_response.dart';
import 'package:indrive_clone/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indrive_clone/src/domain/useCases/users/users_use_cases.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_event.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_state.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  AuthUseCases authUseCases;
  UsersUseCases usersUseCases;
  final formKey = GlobalKey<FormState>();
  ProfileUpdateBloc(this.usersUseCases, this.authUseCases)
      : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(state.copyWith(
          id: event.user?.id,
          name: BlocFormItem(value: event.user?.name ?? ''),
          lastName: BlocFormItem(value: event.user?.lastname ?? ''),
          phone: BlocFormItem(value: event.user?.phone ?? ''),
          formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
        formKey: formKey,
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isEmpty ? 'Ingresa el nombre' : null),
      ));
    });
    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(
        formKey: formKey,
        lastName: BlocFormItem(
            value: event.lastName.value,
            error:
                event.lastName.value.isEmpty ? 'Ingresa los apellidos' : null),
      ));
    });
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
        formKey: formKey,
        phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isEmpty ? 'Ingresa el teléfono' : null),
      ));
    });

    on<FormSubmit>((event, emit) async {
      if (kDebugMode) {
        print('Name: ${state.name.value}');
        print('LastName: ${state.lastName.value}');
        print('Phone: ${state.phone.value}');
      }

      emit(state.copyWith(response: Loading(), formKey: formKey));

      Resource response =
          await usersUseCases.update.run(state.id, state.toUser(), state.image);
      emit(state.copyWith(response: response, formKey: formKey));
    });

    on<UpdateUserSession>((event, emit) async {
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      authResponse.user.name = event.user.name;
      authResponse.user.lastname = event.user.lastname;
      authResponse.user.phone = event.user.phone;
      authResponse.user.image = event.user.image;
      await authUseCases.saveUserSession.run(authResponse);
    });

    on<PickImage>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // SI EL USUARIO SELECCIONO UNA IMAGEN
        emit(state.copyWith(image: File(image.path), formKey: formKey));
      }
    });
    on<TakePhoto>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // SI EL USUARIO SELECCIONO UNA IMAGEN
        emit(state.copyWith(image: File(image.path), formKey: formKey));
      }
    });
  }
}
