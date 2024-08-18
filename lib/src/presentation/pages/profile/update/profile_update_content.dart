import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_event.dart';
import 'package:indrive_clone/src/presentation/pages/profile/update/bloc/profile_update_state.dart';
import 'package:indrive_clone/src/presentation/utils/bloc_form_item.dart';
import 'package:indrive_clone/src/presentation/widgets/custom_text_field.dart';
import 'package:indrive_clone/src/presentation/widgets/default_icon_back.dart';

class ProfileUpdateContent extends StatelessWidget {
  User? user;
  ProfileUpdateState state;
  ProfileUpdateContent({super.key, this.user, required this.state});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(size),
            Spacer(),
            _actionProfile(context, 'ACTUALIZAR USUARIO', Icons.check),
            SizedBox(
              height: 40,
            )
          ],
        ),
        _cardUserInfo(size, context),
        DefaultIconBack(
          color: Colors.white,
          margin: EdgeInsets.only(
            top: 60,
            left: 30,
          ),
        ),
      ],
    );
  }

  Widget _cardUserInfo(
    Size size,
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: size.height * 0.14),
      height: size.height * 0.42,
      width: size.width,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: 120,
              margin: EdgeInsets.only(top: 15, bottom: 14),
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
            CustomTextField(
                validator: (value) {
                  return state!.name.error;
                },
                initialValue: user?.name ?? '',
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                backgoundColor: Colors.grey[200],
                title: 'Nombre',
                icon: Icons.person,
                onChanged: (text) {
                  context
                      .read<ProfileUpdateBloc>()
                      .add(NameChanged(name: BlocFormItem(value: text)));
                }),
            CustomTextField(
                validator: (value) {
                  return state!.lastName.error;
                },
                initialValue: user?.lastname ?? '',
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                backgoundColor: Colors.grey[200],
                title: 'Apellido',
                icon: Icons.person_2_outlined,
                onChanged: (text) {
                  context.read<ProfileUpdateBloc>().add(
                      LastNameChanged(lastName: BlocFormItem(value: text)));
                }),
            CustomTextField(
                validator: (value) {
                  return state!.phone.error;
                },
                initialValue: user?.phone ?? '',
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                backgoundColor: Colors.grey[200],
                title: 'Teléfono',
                icon: Icons.phone,
                onChanged: (text) {
                  context
                      .read<ProfileUpdateBloc>()
                      .add(PhoneChanged(phone: BlocFormItem(value: text)));
                }),
          ],
        ),
      ),
    );
  }

  Widget _headerProfile(Size size) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: size.height * 0.42,
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text('Actualizar Perfil',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }

  Widget _actionProfile(BuildContext context, String option, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (state.formKey!.currentState != null) {
          if (state.formKey!.currentState!.validate()) {
            context.read<ProfileUpdateBloc>().add(FormSubmit());
          }
        } else {
          context.read<ProfileUpdateBloc>().add(FormSubmit());
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: ListTile(
          title: Text(
            option,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 19, 58, 213),
                      Color.fromARGB(255, 65, 173, 255),
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
