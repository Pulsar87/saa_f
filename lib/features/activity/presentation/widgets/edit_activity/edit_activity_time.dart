
import 'package:flutter/material.dart';

import '../../../../../core/components/app-text-field.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../data/repository/activity_repo.dart';
import '../../../domain/bloc/activity_bloc.dart';

class EditActivityTime extends StatefulWidget {
  EditActivityTime({super.key, required this.activityBloc, required this.activityTime});
  final ActivityBloc activityBloc;
  final String activityTime;
  @override
  State<EditActivityTime> createState() => _EditActivityTimeState();
}

class _EditActivityTimeState extends State<EditActivityTime> {
  ActivityBloc addPropertyBloc = ActivityBloc(activityRepository: ActivityRepo());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Text("تعديل وقت النشاط",style: normalTextStyle(color: primaryColor,fontSize: 15)),

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
                    controller:
    widget.activityBloc.isEditDateActivity?
    TextEditingController(text: "${widget.activityBloc.editActivityTime.hourOfPeriod}:${widget.activityBloc.editActivityTime.minute} ${ActivityBloc.activityTime.period.name}")
        :
    TextEditingController(text: widget.activityTime)


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

        widget.activityBloc.editActivityTime = value!;
        widget.activityBloc.isEditDateActivity = true;

      });
    });
  }
}
