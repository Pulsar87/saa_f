import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../constant/app_media_query.dart';
import '../themes/text_style.dart';

void appCoolAlertMethod({required CoolAlertType type, required String text, String title = '', required BuildContext context, void Function()? thenAction}) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: type,
    title: title,
    textTextStyle: normalTextStyle(fontSize: 20),
    text:text,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) => thenAction?.call());
}


void appCoolAlertMethod2({
  required CoolAlertType type,
  required String text,
  String title = '',
  required BuildContext context,
  void Function()? thenAction
}) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: type,
    title: title,
    textTextStyle: normalTextStyle(fontSize: 20),
    text: text,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    thenAction?.call(); // استدعاء الدالة التي تم تمريرها بعد الانتهاء من الـ CoolAlert
  });
}
