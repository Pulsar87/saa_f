import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/material-button-componat.dart';
import 'package:saa_f/core/components/snack_bar.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_event.dart';

class EditActivityButton extends StatelessWidget {
  const EditActivityButton({super.key, required this.id, required this.activityBloc});
final int id;
final ActivityBloc  activityBloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MaterialButtonComponent(
          onPressed: (){
            if(activityBloc.editActivityKey.currentState!.validate()){
              print(ActivityBloc.activityDate);
              print(activityBloc.editNameController);
              print(ActivityBloc.activityTime);
              print("object");
              context.read<ActivityBloc>().add(EditActivityRequestEvent(id : id));
            }
          }, child: Text("تعديل",style: buttonTextStyle(),)),
    );
  }
}
