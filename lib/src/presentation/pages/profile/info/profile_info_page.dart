import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:indrive_clone/src/presentation/pages/profile/info/profile_info_content.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileInfoContent()
    );
  }
}
