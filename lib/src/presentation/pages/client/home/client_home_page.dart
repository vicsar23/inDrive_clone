import 'package:flutter/material.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ClientHomePage",style: TextStyle(color: Colors.black),),),
    );
  }
}