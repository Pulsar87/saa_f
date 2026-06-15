import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/router/router_name.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/publish-state.dart';

void publishSuccessMethod(PublishState state, BuildContext context,String msg, String title,var path) {
  CoolAlert.show(
    width: displayWidth(context)/4,
    context: context,
    type: CoolAlertType.success,
    title: title?? "",
    text: msg?? "",
    titleTextStyle: normalTextStyle(fontSize: 30),
    textTextStyle: normalTextStyle(fontSize: 20),
  ).then((value) {

    if (path == "pop")
      Navigator.of(context).pop();
    else if (path is Widget)
      Navigator.of(context).pushReplacement(MyAnimatedRoute(page: path));
      // context.push(path);
  });

}
void publishErrorCoolAlert(PublishState state, BuildContext context,String msg, String title) {
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
