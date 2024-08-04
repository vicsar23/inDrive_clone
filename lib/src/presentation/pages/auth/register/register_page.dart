import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indrive_clone/src/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indrive_clone/src/presentation/pages/pages_export.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        final response = state.response;
        if (response is ErrorData) {
          Fluttertoast.showToast(
              msg: response.message, toastLength: Toast.LENGTH_SHORT);
        } else if (response is Success) {
          Fluttertoast.showToast(
              msg: "Registro exitoso!", toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          final response = state.response;
          if (response is Loading) {
            return Stack(
              children: [
                RegisterContent(state),
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
          return RegisterContent(
            state,
          );
        },
      ),
    ));
  }
}
