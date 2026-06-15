import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/app-text-field.dart';
import 'package:saa_f/features/profile/presntaion/screen/profile%20.dart';
import 'package:saa_f/features/profile/presntaion/widget/edit/edit_profile_image.dart';

import '../../../../core/functions/show_cool_alert_function.dart';
import '../../../../core/router/animation_route.dart';
import '../../data/repository/profile_repo.dart';
import '../../domain/bloc/profile_bloc.dart';
import '../../domain/bloc/profile_event.dart';
import '../../domain/bloc/profile_state.dart';
import '../widget/edit/edit_button.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key, required this.name, this.image = null});
  ProfileBloc profileBloc = ProfileBloc(profileRepo: ProfileRepo());
  final String name;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state)  {
              print("Edit profile state $state");
              if (state is ProfileEditSuccessState) {
                appCoolAlertMethod(
                    text: "تم تعديل الملف الشخصي",
                    context: context,
                    thenAction: () {
                      Navigator.of(context).pop();
                    }
                );
          }
              else if (state is ProfileEditErrorState) {
                print("ProfileEditErrorState");
                appErrorAlertMethod(
                    title: "عذراً",
                    text: "حصل خطأ أثناء تعديل البيانات\nالرجاء المحاولة لاحقا",
                    context: context);
              }
        },
            child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
              if (state is ProfileInitialState) {
                profileBloc.nameController.text = name;
              }
              return Scaffold(
                appBar: AppBar(
                  title: Text('تعديل الملف الشخصي'),
            ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                    child: Form(
                      key: profileBloc.editFormKey,
                      child: Column(

                        children: [
                          AppTextField(
                            prefixIcon: Icon(Icons.person),
                            labelText: "اسم المستخدم",
                            controller: profileBloc.nameController,
                            validate: (value){
                              if(value!.isEmpty){
                                return "لا يمكن أن يظل هذا الحقل فارغاً";
                              }
                            },
                          ),
                          EditProfileLoadImageRow(img: image, profileBloc: profileBloc),
                          EditProfileButton(profileBloc: profileBloc,)
                  ],
                ),
                    ),
              ),
            ),
          );
        })));\n  }\n}
