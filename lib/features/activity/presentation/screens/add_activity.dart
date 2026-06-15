import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/app-text-field.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/_drawer/presntiaion/widgets/drawer/my_drawer.dart';
import 'package:saa_f/features/activity/data/repository/activity_repo.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_event.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_state.dart';
import 'package:saa_f/features/auth/presentation/widgets/auth_clipbath.dart';

import '../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/assets-const.dart';
import '../method/add_success_method.dart';
import '../widgets/add_activity/add_activity_age.dart';
import '../widgets/add_activity/add_activity_button.dart';
import '../widgets/add_activity/add_activity_data.dart';
import '../widgets/add_activity/add_activity_img.dart';
import '../widgets/add_activity/add_activity_time.dart';

class AddActivityScreen extends StatelessWidget {
   AddActivityScreen({super.key});
  final ActivityBloc activityBloc = ActivityBloc(activityRepository: ActivityRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => activityBloc,
        child: BlocListener<ActivityBloc, ActivityState>(listener: (context, state) {
          if (state is ActivityAddSuccessState){

            activitySuccessMetohd(context,"تم إضافة النشاط بنجاح");
            ActivityBloc.nameController.text = "";
            ActivityBloc.descriptionController.text = "";
            ActivityBloc.mainActivityImage = null;
            context.read<ActivityBloc>().add(ActivitySetStateEvent());
          }
          else if (state is ActivityAddErrorState) {
            activityErrorMethod(context,StringConst.somethingWrong,);
          }
          // else if(state is AuthErrorState) {authErrorCoolAlert(context); }
        }, child: BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
          if (state is ActivityAddLoadingState) {
            return MyLoadingScreen();
          } else {
            return Scaffold(
              // drawer: MyDrawer(),
              appBar: AppBar(
                title: const Text(AppConst.addActivity),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ScreenClipPath(imagePath: AssetsConst.img4,h:4,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Form(
                          key: ActivityBloc.addActivityKey,
                          child: Column(
                            children: [
                              Text("إضافة نشاط جديد",style: authTitleTextStyle(fontSize: 25  ),),
                              // SizedBox(height: 20,),
                              AppTextField(
                                verticalPadding: 20,
                                prefixIcon: Icon(Icons.drive_file_rename_outline),
                                labelText: "اسم النشاط",
                                controller: ActivityBloc.nameController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "لا يمكن أن يظل هذا الحقل فارغاً";
                                  } else if (value!.length<3)
                                    return "يجب أن يكون الاسم أكثر من 3 محارف";
                                },
                              ),
                              AppTextField(
                                verticalPadding: 20,
                                prefixIcon: Icon(Icons.people),
                                labelText: "وصف النشاط",
                                controller: ActivityBloc.descriptionController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "لا يمكن أن يظل هذا الحقل فارغاً";
                                  }
                                },
                              ),
                              AddActivityAge(),
                              AddActivityDate(),
                              AddActivityTime(),
                              MainPropertyImage(),
                              AddActivityButton(),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),

            );
          }
        })));

  }
}
