import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_clone/src/domain/models/auth_response.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indrive_clone/src/presentation/pages/pages_export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //LoginBloc? _bloc;
  @override
  Widget build(BuildContext context) {
    //_bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      //backgroundColor:AppTheme.getPrimaryColor(context),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
                msg: response.message, toastLength: Toast.LENGTH_LONG);
          } else if (response is Success) {
            Fluttertoast.showToast(
                msg: "Inicio de sesión exitoso!",
                toastLength: Toast.LENGTH_LONG);
            context.read<LoginBloc>().add(FormReset());

            final authResponse = response.data as AuthResponse;
            context
                .read<LoginBloc>()
                .add(SaveUserSession(authResponse: authResponse));
            Navigator.pushNamedAndRemoveUntil(context, 'client/home', (route) => false);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final response = state.response;
            if (response is Loading) {
              return Stack(
                children: [
                  LoginContent(state),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return LoginContent(state);
          },
        ),
      ),
    );
  }
}
