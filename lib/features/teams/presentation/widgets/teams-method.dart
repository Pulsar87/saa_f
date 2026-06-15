import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/router/router_name.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/teams-state.dart';

void teamsSuccessMethod(TeamsState state, BuildContext context,String msg, String title,String path) {
  CoolAlert.show(
    width: displayWidth(context)/4,
    context: context,
    type: CoolAlertType.success,
    title: title?? "",
    text: msg?? "",
    titleTextStyle: normalTextStyle(fontSize: 30),
    textTextStyle: normalTextStyle(fontSize: 20),
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {

    if (path == "pop")
      Navigator.pop(context);
   else if (path =="nothing")
      print("object");
    // else
      // context.push(path);
  });

}


void teamsErrorCoolAlert(TeamsState state, BuildContext context,String msg, String title) {
  CoolAlert.show(
    width: displayWidth(context)/4,
    context: context,
    type: CoolAlertType.error,
    title: title?? "Error",
    titleTextStyle: normalTextStyle(fontSize: 30),
    textTextStyle: normalTextStyle(fontSize: 20),

    text: msg?? "حصل خطأ ما، أعد المحاولة في وقتٍ لاحق",
    loopAnimation: false,
  );
}
