import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:indrive_clone/src/presentation/pages/profile/info/bloc/profile_info_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/profile/info/bloc/profile_info_event.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_event.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_state.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/profile_update_content.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  User? user;

  @override
  void initState() {
    // PRIMER EVENTO EN DISPARARSE - UNA SOLA VEZ
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileUpdateBloc>().add(ProfileUpdateInitEvent(user: user));
    });
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)?.settings.arguments as User?;
    return Scaffold(
      body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
                msg: response.message, toastLength: Toast.LENGTH_LONG);
          } else if (response is Success) {
            User user = response.data as User;
            Fluttertoast.showToast(
                msg: 'Actualizacion exitosa', toastLength: Toast.LENGTH_LONG);
            context.read<ProfileUpdateBloc>().add(UpdateUserSession(user: user));
            Future.delayed(Duration(seconds: 1), () {
              context.read<ProfileInfoBloc>().add(GetUserInfo());
            });
          }
        },
        child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
          builder: (context, state) {
            final response = state.response;
            if (response is Loading) {
              return Stack(
                children: [
                  ProfileUpdateContent(
                    state: state,
                    user: user,
                  ),
                  Center(child: CircularProgressIndicator())
                ],
              );
            }
            return ProfileUpdateContent(
              state: state,
              user: user,
            );
          },
        ),
      ),
    );
  }
}
