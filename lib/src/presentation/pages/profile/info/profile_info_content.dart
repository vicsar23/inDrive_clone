import 'package:flutter/material.dart';

class ProfileInfoContent extends StatelessWidget {
  const ProfileInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(size),
            Spacer(),
            _actionProfile('Editar Perfil', Icons.edit),
            _actionProfile('Cerrar sesión', Icons.settings_power),
            SizedBox(
              height: 40,
            )
          ],
        ),
        _cardUserInfo(size)
      ],
    );
  }
}

Widget _cardUserInfo(Size size) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: size.height * 0.14),
    height: size.height * 0.25,
    width: size.width ,
    child: Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          Container(
            width: 120,
            margin: EdgeInsets.only(top: 15,bottom: 14),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user_image.png',
                  image:
                      'https://htmlstream.com/preview/unify-v2.6/assets/img-temp/400x450/img5.jpg',
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ),
              ),
            ),
          ), 
          Text('Nombre de usuaruio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          Text('Correro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),),
          Text('5610371157',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[600]),),

        ],
      ),
    ),
  );
}

Widget _headerProfile(Size size) {
  return Container(
    alignment: Alignment.topCenter,
    padding: EdgeInsets.only(top: 40),
    height: size.height * 0.3,
    width: size.width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 14, 29, 166).withOpacity(1),
          Color.fromARGB(255, 30, 112, 227).withOpacity(1)
        ],
      ),
    ),
    child: Text('Perfil de usario',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
  );
}

Widget _actionProfile(String option, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
    child: ListTile(
      title: Text(option,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 29, 166).withOpacity(1),
                  Color.fromARGB(255, 30, 112, 227).withOpacity(1)
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Icon(
            icon,
            color: Colors.white,
          )),
    ),
  );
}
