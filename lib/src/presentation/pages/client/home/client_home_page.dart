import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/main.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_event.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_state.dart';
import 'package:indrive_clone/src/presentation/pages/client/mapSeeker/client_map_seeker_page.dart';
import 'package:indrive_clone/src/presentation/pages/profile/info/profile_info_page.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[
    ClientMapSeekerPage(),
    ProfileInfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
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
                  child: Text('Menú del cliente',
                      style: TextStyle(color: Colors.white))),
              ListTile(
                  title: Text("Mapa de búsqueda"),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    context
                        .read<ClientHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 1));
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Perfil de usuario"),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context
                        .read<ClientHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Cerrar sesión"),
                  onTap: () {
                    context.read<ClientHomeBloc>().add(Logout());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (context) => false);
                  })
            ],
          ));
        },
      ),
      appBar: AppBar(
        title: Text('Menú'),
      ),
    );
  }
}
