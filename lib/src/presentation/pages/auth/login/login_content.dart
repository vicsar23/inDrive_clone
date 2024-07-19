import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indrive_clone/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';
import 'package:indrive_clone/src/presentation/widgets/widgets_export.dart';

class LoginContent extends StatelessWidget {
  LoginState? state;
  LoginContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Form(
      key: state?.formKeyLogin,
      child: Stack(children: [
        Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 12, 38, 145).withOpacity(1),
                Color.fromARGB(255, 34, 156, 249).withOpacity(1)
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _rotatedText(context, 1, "Login", Colors.white, 'login_page',
                    27, FontWeight.bold),
                SizedBox(
                  height: sizeScreen.height * 0.1,
                ),
                _rotatedText(context, 1, "Registro", Colors.white,
                    'register_page', 25, FontWeight.normal),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 60),
          decoration: BoxDecoration(
              //color: Color.fromARGB(255, 24, 181, 254).withOpacity(1),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 29, 166).withOpacity(1),
                  Color.fromARGB(255, 30, 112, 227).withOpacity(1)
                ],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          child: Container(
            height: sizeScreen.height,
            padding: EdgeInsets.only(top: 50, left: 35, right: 35),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textWelcome("Bienvenido"),
                  _textWelcome("de nuevo"),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "assets/img/car.png",
                        width: 150,
                        height: 150,
                      )),
                  _textWelcome("Iniciar sesión"),
                  CustomTextField(
                    validator: (value) {
                      return state?.email.error;
                    },
                    onChanged: (text) {
                      context
                          .read<LoginBloc>()
                          .add(EmailChanged(email: BlocFormItem(value: text)));
                    },
                    title: "Correo",
                    icon: Icons.email_rounded,
                  ),
                  CustomTextField(
                    validator: (value) {
                      return state?.password.error;
                    },
                    onChanged: (text) {
                      context.read<LoginBloc>().add(
                          PasswordChanged(password: BlocFormItem(value: text)));
                    },
                    title: "Contraseña",
                    icon: Icons.lock,
                    margin: EdgeInsets.only(top: 40, left: 4, right: 4),
                  ),
                  SizedBox(
                    height: sizeScreen.height * 0.2,
                  ),
                  DefaulButton(
                    text: "Iniciar sesión",
                    onPressed: () {
                      if (state!.formKeyLogin!.currentState!.validate()) {
                        context.read<LoginBloc>().add(FormSubmit());
                      } else {
                        print("El formulario no es válido");
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _separatorOr(),
                  SizedBox(
                    height: 10,
                  ),
                  _textDontHaveAccount(context),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Widget _textDontHaveAccount(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "¿No tienes cuenta?",
        style: TextStyle(color: Colors.grey[100], fontSize: 17),
      ),
      SizedBox(width: 10),
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, 'register_page');
        },
        child: Text(
          "Regístrate",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      )
    ],
  );
}

Widget _separatorOr() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 26,
        height: 1,
        color: Colors.white,
        margin: EdgeInsets.only(right: 5),
      ),
      Text(
        "O",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      Container(
        width: 26,
        height: 1,
        color: Colors.white,
        margin: EdgeInsets.only(left: 5),
      ),
    ],
  );
}

Widget _textWelcome(String text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

Widget _rotatedText(
    BuildContext context,
    final int quarterTurns,
    final String text,
    final Color textColor,
    String routeName,
    double fontSize,
    FontWeight fontWeight) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, routeName);
    },
    child: RotatedBox(
      quarterTurns: quarterTurns,
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    ),
  );
}
