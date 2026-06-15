import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saa_f/core/constant/colors/dashboardColor.dart';

import '../../../../../core/components/add_button.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../data/repository/activity_repo.dart';
import '../../../domain/bloc/activity_bloc.dart';
import '../../../domain/bloc/activity_event.dart';
import '../../../domain/bloc/activity_state.dart';

class EditActivityImage extends StatelessWidget {
   EditActivityImage({super.key, required this.activityBloc});
final ActivityBloc activityBloc;
// final ActivityBloc imbloc= ActivityBloc(activityRepository: ActivityRepo());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => activityBloc,
        child: BlocListener<ActivityBloc, ActivityState>(listener: (context, state) {

        }, child: BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("تعديل صورة النشاط",style: authTitleTextStyle(fontSize: 20),)),
                  Padding(
                    padding:  EdgeInsets.only(left: SizeConfig.screenWidth!/3),
                    child: AddButton(
                        verticalPadding: 20,
                        onPressed: () {
                          _pickImage(context);
                          print("add main image");
                        }
                    ),
                  ),

                ],
              ),
              if (activityBloc.editMainActivityImage !=null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10,),
                      height: SizeConfig.screenHeight! / 3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                          BorderRadius.circular(20),
                          border: Border.all(
                              color: primaryColor,
                              width: 3
                          ),
                          image: activityBloc.editMainActivityImage !=null  ?

                          DecorationImage(
                              image: FileImage(activityBloc.editMainActivityImage!),
                              fit: BoxFit.cover
                          )
                              : null
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        activityBloc.editMainActivityImage = null;
                        context
                            .read<ActivityBloc>()
                            .add(AddActivityShowImageEvent());
                      },
                        child: Text("حذف الصورة",style: normalTextStyle(color: darkRed,fontSize: 15,fontWeight: FontWeight.w900),))
                  ],
                ),

            ],
          );
        })
        )
    );
  }
  Future  _pickImage (BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      activityBloc.editMainActivityImage = imageTemporary;
      context
          .read<ActivityBloc>()
          .add(AddActivityShowImageEvent());
    }
    on PlatformException catch (e) {
      print ('Failed to pick image : $e');
    }
  }

}
