import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/constant/app_media_query.dart';
import '../../../core/constant/strings-const.dart';
import '../../../core/router/animation_route.dart';
import '../../../core/themes/text_style.dart';
import '../../Home/presntation/layout/home_layout.dart';
import '../domain/bloc/join_bloc.dart';

void joinErrorCoolAlert(BuildContext context, JoinRequestErrorState state) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: state.error,
    textTextStyle: normalTextStyle(fontSize: 20),
    loopAnimation: false,
    // autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    Navigator.of(context).pushReplacement(MyAnimatedRoute(page:  HomeLayout()));
    // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: ResetPasswordVerificationCodeScreen()));
  });
}


void joinSuccessMethod(BuildContext context, JoinRequestSuccessState state, ) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.success,
    title: '',
    textTextStyle: normalTextStyle(fontSize: 20),
    text: StringConst.joinRequestSendSuccess,
    // autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    Navigator.of(context).pushReplacement(MyAnimatedRoute(page:  HomeLayout()));
    // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: ResetPasswordVerificationCodeScreen()));
  });

}
