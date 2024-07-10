import 'package:flutter/material.dart';
import 'package:indrive_clone/src/presentation/widgets/widgets_export.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Stack(children: [
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
              _rotatedText(1, "Inciar sesión", Colors.white),
              SizedBox(
                height: sizeScreen.height * 0.1,
              ),
              _rotatedText(1, "Registro", Colors.white),
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
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 35, right: 35),
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
                title: "Correo",
                icon: Icons.email_rounded,
              ),
              CustomTextField(
                title: "Contraseña",
                icon: Icons.lock,
                margin: EdgeInsets.only(top: 40, left: 4, right: 4),
              ),
              Spacer(),
              DefaulButton(text: "Iniciar sesión"),
              SizedBox(
                height: 10,
              ),
              _separatorOr(),
              SizedBox(
                height: 10,
              ),
              _textDontHaveAccount(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

Widget _textDontHaveAccount() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "¿No tienes cuenta?",
        style: TextStyle(color: Colors.grey[100], fontSize: 17),
      ),
      SizedBox(width: 10),
      InkWell(
        onTap: () {},
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
    final int quarterTurns, final String text, final Color textColor) {
  return RotatedBox(
    quarterTurns: quarterTurns,
    child: Text(
      text,
      style: TextStyle(
          color: textColor, fontSize: 26, fontWeight: FontWeight.bold),
    ),
  );
}
