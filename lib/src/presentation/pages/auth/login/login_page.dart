import 'package:flutter/material.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      //backgroundColor:AppTheme.getPrimaryColor(context),
      body: LoginContent(),
    );
  }
}