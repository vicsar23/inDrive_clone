import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size  sizeScreen = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        color: Color.fromARGB(255, 21, 152, 213),
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "Iniciar sesión",
                  style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: sizeScreen.height *0.1,),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "Registro",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 60, bottom: 60),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 24, 181, 254).withOpacity(1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 35, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bienvenido",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text(
                "de nuevo",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "assets/img/car.png",
                    width: 150,
                    height: 150,
                  )),
              Text(
                "Iniciar sesión",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Correo"),
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Contraseña"),
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text("Iniciar sesión",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
