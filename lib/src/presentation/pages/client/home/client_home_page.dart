import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_event.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_state.dart';
import 'package:indrive_clone/src/presentation/pages/profile/info/profile_info_page.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[ProfileInfoPage()];
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
                  title: Text("Perfil de usuaruio"),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context
                        .read<ClientHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
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
