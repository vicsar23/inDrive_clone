import 'package:flutter/material.dart';
import 'package:indrive_clone/src/presentation/widgets/widgets_export.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          //padding: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromARGB(255, 12, 38, 145).withOpacity(1),
                Color.fromARGB(255, 34, 156, 249).withOpacity(1)
              ])),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotated(context),
                SizedBox(
                  height: sizeScreen.height * 0.1,
                ),
                _textRegisterRotated(),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 12, 38, 145).withOpacity(1),
                    Color.fromARGB(255, 34, 156, 249).withOpacity(1)
                  ])),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _imageBanner(),
                    CustomTextFieldOutline(
                      title: 'Nombre',
                      icon: Icons.person_2,
                      margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                    ),
                    CustomTextFieldOutline(
                      title: 'Apellidos',
                      icon: Icons.person_2,
                      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    ),
                    CustomTextFieldOutline(
                      title: 'Correo electrónico',
                      icon: Icons.email,
                      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    ),
                    CustomTextFieldOutline(
                      title: 'Teléfono',
                      icon: Icons.email,
                      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    ),
                    CustomTextFieldOutline(
                      title: 'Contraseña',
                      icon: Icons.lock,
                      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    ),
                    CustomTextFieldOutline(
                      title: 'Confirmar Contraseña',
                      icon: Icons.lock,
                      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    DefaulButton(
                        onPressed: () {},
                        text: 'Crear Cuenta',
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20)),
                    SizedBox(
                      height: 16,
                    ),
                    _separatorOr(),
                    SizedBox(
                      height: 16,
                    ),
                    _textIAlreadyHaveAccount(context),
                  ],
                ),
              ),
              _imageBackground()
            ],
          ),
        ),
      ],
    );
  }
}

Widget _textIAlreadyHaveAccount(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed('login_page');
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('¿Tienes una cuenta?',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal)),
        SizedBox(
          width: 6,
        ),
        Text('Iniciar sesión',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _separatorOr() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 26,
        height: 1,
        color: Colors.black,
        margin: EdgeInsets.only(right: 5),
      ),
      Text(
        "O",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      Container(
        width: 26,
        height: 1,
        color: Colors.black,
        margin: EdgeInsets.only(left: 5),
      ),
    ],
  );
}

Widget _imageBanner() {
  return Container(
    margin: EdgeInsets.only(top: 60),
    alignment: Alignment.center,
    child: Image.asset(
      'assets/img/delivery.png',
      height: 180,
      width: 180,
    ),
  );
}

Widget _imageBackground() {
  return Container(
    margin: EdgeInsets.only(bottom: 50),
    alignment: Alignment.bottomCenter,
    child: Image.asset(
      opacity: AlwaysStoppedAnimation(0.32),
      'assets/img/destination.png',
      height: 200,
      width: 200,
    ),
  );
}

Widget _textLoginRotated(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('login_page');
    },
    child: RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    ),
  );
}

Widget _textRegisterRotated() {
  return RotatedBox(
    quarterTurns: 1,
    child: Text(
      'Registro',
      style: TextStyle(
          fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
