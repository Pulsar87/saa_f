import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/features/activity/data/repository/activity_repo.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_state.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_state.dart';

import '../../../../../core/components/material-button-componat.dart';
import '../../../../../core/constant/app_media_query.dart';
import '../../../../../core/constant/strings-const.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../domain/bloc/activity_event.dart';
import '../../method/add_success_method.dart';


Future<void> showAlertDialogToDeleteActivity(context, int id) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return DeleteActivityDialog(id: id,);
    },
  );
}



class DeleteActivityDialog extends StatelessWidget {
  DeleteActivityDialog({super.key, required this.id});
  final ActivityBloc activityBloc  = ActivityBloc(activityRepository: ActivityRepo());
  final int id;
  // final onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => activityBloc,
        child: BlocListener<ActivityBloc, ActivityState>(listener: (context, state) {
          if (state is ConfirmActivityErrorState || state is DeleteActivityErrorState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('', style: normalTextStyle(fontSize: 20)),
                  content: Text(StringConst.somethingWrong, style: normalTextStyle(fontSize: 16)),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            ).then((value) {
              Navigator.pop(context);
              Navigator.pop(context);
            });
          }  else if (state is DeleteActivitySuccessState )
          {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('تم', style: normalTextStyle(fontSize: 20)),
                  content: Text("تم حذف النشاط", style: normalTextStyle(fontSize: 16)),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            ).then((value) {
              Navigator.pop(context);
              Navigator.pop(context);
            });
          }
          }, child: BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
          print(state);
          if (state is DeleteActivityLoadingState)
            return Container(
              child: AlertDialog(
                actions: [
                  Center(child: CircularProgressIndicator())
                ]
              ),
            );
                else
          return Container(
            child: AlertDialog(
              title:
              Center(child: Text("حذف النشاط",
                style: normalTextStyle(fontWeight: FontWeight.w700,fontSize: 25),
              )),
              content: Text ("هل أنت متأكد من رغبتكَ بحذف هذا النشاط؟؟"
                  "\nسيظهر للمستخدمين أن هذا النشاط ملغى..."
                  "\nلن تتمكن من التراجع عن هذا الإجراء!!",
                style: normalTextStyle(fontSize: 15),
              ),
              // title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
              // content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
              actions: <Widget>[
                MaterialButtonComponent(
                    onPressed: () {
                      print("dd $id");
                      context.read<ActivityBloc>().add(DeleteActivityEvent(id: id));

                    } ,
                    child: Text("حذف",
                        style: buttonTextStyle(fontWeight: FontWeight.w900)
                    )),
              ],

            ),
          );
        }
        )
        )
    );
  }
}
