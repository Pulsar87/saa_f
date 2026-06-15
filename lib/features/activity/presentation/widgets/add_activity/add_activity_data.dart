import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';

import '../../../../../core/components/app-text-field.dart';

class AddActivityDate extends StatefulWidget {
  const AddActivityDate({super.key});

  @override
  State<AddActivityDate> createState() => _AddActivityDateState();
}

class _AddActivityDateState extends State<AddActivityDate> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("تاريخ النشاط",style: normalTextStyle(color: primaryColor,fontSize: 15)),

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
                  controller: TextEditingController(text: "${ActivityBloc.activityDate.day}/${ActivityBloc.activityDate.month}/${ActivityBloc.activityDate.year}")
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
        ActivityBloc.activityDate = value!;
      });
    });
  }
}
