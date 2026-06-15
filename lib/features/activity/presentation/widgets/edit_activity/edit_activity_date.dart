import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/components/add_button.dart';
import '../../../../../core/components/app-text-field.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../data/repository/activity_repo.dart';
import '../../../domain/bloc/activity_bloc.dart';
import '../../../domain/bloc/activity_event.dart';
import '../../../domain/bloc/activity_state.dart';

class EditActivityDate extends StatefulWidget {
   EditActivityDate({super.key, required this.activityBloc, required this.activeDate});
   final ActivityBloc activityBloc;
   final String activeDate;
  @override
  State<EditActivityDate> createState() => _EditActivityDateState();
}

class _EditActivityDateState extends State<EditActivityDate> {
  // activityBloc addPropertyBloc = activityBloc(activityRepository: ActivityRepo());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("تعديل تاريخ النشاط",style: normalTextStyle(color: primaryColor,fontSize: 15)),

        ),
        SizedBox(width: 20,),
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: ()  {ShowDatePicker(context);},
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: AppTextField(
                  disableColor: primaryColor,
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller:
                  widget.activityBloc.isEditDateActivity?
                  TextEditingController(
                      text: "${widget.activityBloc.editActivityDate.day}/${widget.activityBloc.editActivityDate.month}/${widget.activityBloc.editActivityDate.year}"
                  )
                      :
                  TextEditingController(text: widget.activeDate)

              ),
            ),),
        ),

      ],
    );
  }

   void ShowDatePicker (context) {
     showDatePicker(
         context: context,
         firstDate: DateTime(DateTime.now().year),
         initialDate: DateTime.now(),
         lastDate: DateTime(DateTime.now().year+15)
       // initialTime:  TimeOfDay(hour: 8, minute: 0),
     ).then((value) {
       setState(() {
         widget.activityBloc.editActivityDate = value!;
         widget.activityBloc.isEditDateActivity = true;
       });
     });
   }
}
