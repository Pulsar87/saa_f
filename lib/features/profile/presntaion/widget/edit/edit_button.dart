import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/profile/domain/bloc/profile_event.dart';

import '../../../../../core/components/material-button-componat.dart';
import '../../../domain/bloc/profile_bloc.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key, required this.profileBloc});
  final ProfileBloc profileBloc;
  @override
  Widget build(BuildContext context) {
    return MaterialButtonComponent(
      child: Text(
        "تعديل", style: buttonTextStyle(),
      ),
      onPressed: (){
        context.read<ProfileBloc>().add(ProfileEditEvent(
          image: profileBloc.newProfileImage == null? File("path") : profileBloc.newProfileImage!,
          name: profileBloc.nameController.text,
        ));
        if(profileBloc.editFormKey.currentState!.validate()){
          print("edit");
        }
      },
    );
  }
}
