import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/material-button-componat.dart';
import 'package:saa_f/core/components/snack_bar.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_event.dart';

class AddActivityButton extends StatelessWidget {
  const AddActivityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MaterialButtonComponent(
          onPressed: (){
            if(ActivityBloc.mainActivityImage==null) {
              showCustomSnackBar(context, "الرجاء إدخال صورة النشاط", primaryColor);
            }
            if(ActivityBloc.addActivityKey.currentState!.validate() && ActivityBloc.mainActivityImage !=null){
              print(ActivityBloc.activityDate);
              print(ActivityBloc.activityTime);
              print("object");
              context.read<ActivityBloc>().add(AddActivityRequestEvent());
            }
      }, child: Text("إضافة",style: buttonTextStyle(),)),
    );
  }
}
