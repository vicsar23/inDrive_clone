import 'package:flutter/material.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/profile_update_content.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileUpdateContent(),
    );
  }
}