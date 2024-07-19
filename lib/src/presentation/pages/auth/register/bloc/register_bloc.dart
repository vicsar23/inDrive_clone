import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indrive_clone/src/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formKey = GlobalKey<FormState>();
  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
          formKey: formKey,
          name: BlocFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? 'Ingresa el nombre' : null)));
    });

    on<SourceNameChanged>((event, emit) {
      emit(state.copyWith(
          formKey: formKey,
          sourceName: BlocFormItem(
              value: event.sourceName.value,
              error: event.sourceName.value.isEmpty
                  ? 'Ingresa los apellidos fuente'
                  : null)));
    });

    on<EmailChangedRegister>((event, emit) {
      emit(state.copyWith(
          formKey: formKey,
          email: BlocFormItem(
              value: event.email.value,
              error:
                  event.email.value.isEmpty || !event.email.value.contains('@')
                      ? 'Ingresa un email válido'
                      : null)));
    });

    on<PasswordChangedRegister>((event, emit) {
      emit(state.copyWith(
          formKey: formKey,
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty ||
                      event.password.value.length < 6
                  ? 'Ingresa una contraseña de 6 caracteres o más'
                  : null)));
    });
    on<ConfirmPasswordChangedRegister>((event, emit) {
      emit(state.copyWith(
          formKey: formKey,
          password: BlocFormItem(
              value: event.confirmPassword.value,
              error: event.confirmPassword.value.isEmpty ||
                      event.confirmPassword.value.length < 6
                  ? 'Ingresa una contraseña de 6 caracteres o más'
                  : event.confirmPassword.value != state.password.value
                      ? 'Las contraseñas no coinciden'
                      : null)));
    });
    on<FormSubmitRegister>((event, emit) {
      if (kDebugMode) {
        print(state.name.value);
        print(state.sourceName.value);
        print(state.phone.value);
        print(state.email.value);
        print(state.password.value);
        print(state.confirmPassword.value);
      }
    });

    on<FormResetRegister>((event, emit) {
      state.formKey?.currentState?.reset();
      // emit(state.copyWith(
      //     formKey: formKey,
      //     name: BlocFormItem(value: ''),
      //     sourceName: BlocFormItem(value: ''),
      //     phone: BlocFormItem(value: ''),
      //     email: BlocFormItem(value: ''),
      //     password: BlocFormItem(value: ''),
      //     confirmPassword: BlocFormItem(value: '')));
    });
  }
}
