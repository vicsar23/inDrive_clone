import 'package:flutter/material.dart';
import 'package:indrive_clone/src/config/theme/app_theme.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: const LoginPage(),
    );
  }
}
