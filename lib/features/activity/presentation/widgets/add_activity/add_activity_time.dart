import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';

import '../../../../../core/components/app-text-field.dart';

class AddActivityTime extends StatefulWidget {
  const AddActivityTime({super.key});

  @override
  State<AddActivityTime> createState() => _AddActivityTimeState();
}

class _AddActivityTimeState extends State<AddActivityTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Text("وقت النشاط",style: normalTextStyle(color: primaryColor,fontSize: 15)),

          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: ()  {ShowTimePicker(context);},
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: AppTextField(
                    disableColor: primaryColor,
                    enabled: false,
                    textAlign: TextAlign.center,
                    controller: TextEditingController(text: "${ActivityBloc.activityTime.hourOfPeriod}:${ActivityBloc.activityTime.minute} ${ActivityBloc.activityTime.period.name}")
                ),
              ),),
          ),

        ],
      ),
    );
  }

  void ShowTimePicker (context) {
    showTimePicker(
      context: context,
      initialTime:  TimeOfDay(hour: 8, minute: 0),
    ).then((value) {
      setState(() {
        String formattedTime =  value.toString().replaceAll("TimeOfDay(", "").replaceAll(")", "");;
        print("formattedTime $formattedTime");

        ActivityBloc.activityTime = value!;
      });
    });
  }
}
