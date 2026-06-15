import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/app-text-field.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/data/repository/activity_repo.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_event.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_state.dart';
import 'package:saa_f/features/auth/presentation/widgets/auth_clipbath.dart';

import '../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/router/animation_route.dart';
import '../method/add_success_method.dart';
import '../widgets/add_activity/add_activity_age.dart';
import '../widgets/add_activity/add_activity_button.dart';
import '../widgets/add_activity/add_activity_data.dart';
import '../widgets/add_activity/add_activity_img.dart';
import '../widgets/add_activity/add_activity_time.dart';
import '../widgets/edit_activity/edit_activity_age.dart';
import '../widgets/edit_activity/edit_activity_button.dart';
import '../widgets/edit_activity/edit_activity_date.dart';
import '../widgets/edit_activity/edit_activity_time.dart';
import '../widgets/edit_activity/edit_images.dart';
import 'get_announced_activities_screen.dart';

class EditActivityScreen extends StatelessWidget {
   EditActivityScreen({super.key, required this.id, required this.title, required this.age, required this.img, required this.time, required this.description, required this.activityDate, required this.activityTime});
  final ActivityBloc activityBloc = ActivityBloc(activityRepository: ActivityRepo());
  final int id;
  final String title;
  final String description;
  final String activityDate;
  final String activityTime;
  final String age;
  final String img;
  final String time;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => activityBloc,
        child: BlocListener<ActivityBloc, ActivityState>(listener: (context, state) {
          // if (state is ActivityAddSuccessState){
          //
          print(state);
          if(state is EditActivityLoadingState) {
            CoolAlert.show(
              width: displayWidth(context) / 4,
              context: context,
              type: CoolAlertType.loading,
              // title: 'تم',
              // textTextStyle: normalTextStyle(fontSize: 20),
              // text: "تم تثبيت النشاط",
              // autoCloseDuration: const Duration(seconds: 2),
            );

            }

          if (state is EditActivitySuccessState ) {
            CoolAlert.show(
              width: displayWidth(context) / 4,
              context: context,
              type: CoolAlertType.success,
              title: 'تم',
              textTextStyle: normalTextStyle(fontSize: 20),
              text: "تم تعديل النشاط",
              autoCloseDuration: const Duration(seconds: 2),
            ).then((value) {
              Navigator.of(context).pushReplacement(MyAnimatedRoute(page: GetAnnouncedActivitiesScreen()));
            });

          }
          if (state is SetEditValueState) {
            print("hhhhhhhhhh");
            activityBloc.editDescriptionController.text = description;
            activityBloc.editNameController.text =title;
            activityBloc.editLocalAge = age;
          }

          //   activitySuccessMetohd(context,"تم إضافة النشاط بنجاح");
          //   ActivityBloc.nameController.text = "";
          //   ActivityBloc.descriptionController.text = "";
          //   ActivityBloc.mainActivityImage = null;
          //   context.read<ActivityBloc>().add(ActivitySetStateEvent());
          // }
          // else if (state is ActivityAddErrorState) {
          //   activityErrorMethod(context,StringConst.somethingWrong,);
          // }
          // else if(state is AuthErrorState) {authErrorCoolAlert(context); }
        }, child: BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
        if(state is ActivityInitialState) {
          context.read<ActivityBloc>().add(SetEditValueEvent());

        }
          if (state is ShowActivityInfoLoadingState) {
            return MyLoadingScreen();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Form(
                          key: activityBloc.editActivityKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(image: NetworkImage("${AppConst.imgUrl}$img")),
                              // SizedBox(height: 20,),
                              AppTextField(
                                verticalPadding: 20,
                                prefixIcon: Icon(Icons.drive_file_rename_outline),
                                labelText: "اسم النشاط",
                                controller: activityBloc.editNameController,
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
                                controller: activityBloc.editDescriptionController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "لا يمكن أن يظل هذا الحقل فارغاً";
                                  }
                                },
                              ),
                              EditActivityAge(activityBloc: activityBloc,),
                              SizedBox(height: 20,),
                              EditActivityDate(activityBloc: activityBloc,activeDate: activityDate),
                              EditActivityTime(activityBloc:activityBloc, activityTime: activityTime,),
                              EditActivityImage(activityBloc:activityBloc) ,
                              EditActivityButton(id: id, activityBloc: activityBloc,),
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
