import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../core/constant/app_media_query.dart';

void activitySuccessMetohd(BuildContext context,String text,) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.success,
    title: 'تم',
    textTextStyle: normalTextStyle(fontSize: 20),
    text: text,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    // Navigator.of(context).pushReplacement(
    //     MyAnimatedRoute(page: DrawerLayout()));
  });
}


void activityErrorMethod(BuildContext context,String text,) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.error,
    title: '',
    textTextStyle: normalTextStyle(fontSize: 20),
    text: text,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: DrawerLayout()));
  });
  // Navigator.of(context).pushReplacement(
  //     MyAnimatedRoute(page: DrawerLayout()));
}