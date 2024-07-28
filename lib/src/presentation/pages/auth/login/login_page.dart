import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_bloc.dart';
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
            print("Error Data: ${response.message}");
          } else if (response is Success) {
            print("Success Data: ${response.data}");
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
