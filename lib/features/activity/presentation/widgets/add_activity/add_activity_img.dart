import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saa_f/core/components/add_button.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/data/repository/activity_repo.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_event.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_state.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_state.dart';

class MainPropertyImage extends StatelessWidget {
  MainPropertyImage({super.key});
  ActivityBloc addPropertyBloc = ActivityBloc(activityRepository: ActivityRepo());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => addPropertyBloc,
        child: BlocListener<ActivityBloc, ActivityState>(listener: (context, state) {

        }, child: BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("صورة النشاط",style: authTitleTextStyle(fontSize: 20),)),
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
              if (ActivityBloc.mainActivityImage !=null)
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
                      image: ActivityBloc.mainActivityImage !=null  ?

                      DecorationImage(
                        image: FileImage(ActivityBloc.mainActivityImage!),
                        fit: BoxFit.cover
                      )
                          : null
                  ),
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
      ActivityBloc.mainActivityImage = imageTemporary;
      context
          .read<ActivityBloc>()
          .add(AddActivityShowImageEvent());
    }
    on PlatformException catch (e) {
      print ('Failed to pick image : $e');
    }
  }

}
