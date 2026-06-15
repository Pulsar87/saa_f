import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../../../core/router/router_name.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../screens/reset_password_verification_code.dart';

void sndEmailSuccessMethod(SendEmailSuccessState state, BuildContext context) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.success,
    title: '',
    textTextStyle: normalTextStyle(fontSize: 20),
    text: StringConst.sendCodeSuccess,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    Navigator.of(context).pushReplacement(MyAnimatedRoute(page: ResetPasswordVerificationCodeScreen()));
  });

  // context.pushReplacement(verificationCodeRoutePath);
  // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: Vere()));
}


void sndEmailErrorCoolAlert(BuildContext context, SendEmailErrorState state) {
  CoolAlert.show(
    width: displayWidth(context)/4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: state.error,
    textTextStyle: normalTextStyle(fontSize: 20),
    loopAnimation: false,
  );
}





void checkCodeErrorMethod(BuildContext context, CheckCodeErrorState state) {
  CoolAlert.show(
    width: displayWidth(context)/4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: state.error,
    textTextStyle: normalTextStyle(fontSize: 20),
    loopAnimation: false,
  );
}

