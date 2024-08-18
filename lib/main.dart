import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_clone/bloc_provider.dart';
import 'package:indrive_clone/injection.dart';
import 'package:indrive_clone/src/config/theme/app_theme.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/login_page.dart';
import 'package:indrive_clone/src/presentation/pages/auth/register/register_page.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/client_home_page.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/profile_update_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder:FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme(selectedColor: 0).getTheme(),
        home: const LoginPage(),
        initialRoute: 'login',
        routes: {
          'login_page': (BuildContext context) => LoginPage(),
          'register_page': (BuildContext context) => RegisterPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),
        },
      ),
    );
  }
}
