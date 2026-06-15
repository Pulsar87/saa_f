import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/features/auth/presentation/screens/login.dart';
import '../../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../../../core/router/router_name.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/themes/text_style.dart';
import '../../../Home/presntation/layout/home_layout.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../screens/reset-password-screen.dart';

void resetPasswordSuccessMethod(ResetPasswordSuccessState state, BuildContext context) {
  CoolAlert.show(
    width: displayWidth(context)/4,
    context: context,
    type: CoolAlertType.success,
    title: StringConst.setNewPasswordSuccess,
    text: StringConst.sureToRemmber,
    textTextStyle: normalTextStyle(fontSize: 20),
  ).then((value) {
    Navigator.of(context).pushReplacement(MyAnimatedRoute(page: LoginScreen()));

  });

}


void resetPasswordErrorCoolAlert(BuildContext context, ResetPasswordErrorState state) {
  CoolAlert.show(
    width: displayWidth(context)/4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: StringConst.somethingWrong,
    loopAnimation: false,
  );
}

