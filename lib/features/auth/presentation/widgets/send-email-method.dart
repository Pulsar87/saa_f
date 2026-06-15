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

void showSuccessDialog({required BuildContext context, required String text, String title = '', void Function()? thenAction}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(height: 16),
            if (title.isNotEmpty)
              Text(title, style: normalTextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (title.isNotEmpty)
              SizedBox(height: 8),
            Text(text, style: normalTextStyle(fontSize: 20), textAlign: TextAlign.center),
          ],
        ),
      );
    },
  ).then((value) => thenAction?.call());
  
  Future.delayed(Duration(seconds: 2), () {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      thenAction?.call();
    }
  });
}

void showErrorDialog({required BuildContext context, required String text, String title = ''}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: Colors.red, size: 50),
            SizedBox(height: 16),
            if (title.isNotEmpty)
              Text(title, style: normalTextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (title.isNotEmpty)
              SizedBox(height: 8),
            Text(text, style: normalTextStyle(fontSize: 20), textAlign: TextAlign.center),
          ],
        ),
      );
    },
  );
}

void sndEmailSuccessMethod(SendEmailSuccessState state, BuildContext context) {
  showSuccessDialog(
    context: context,
    title: '',
    text: StringConst.sendCodeSuccess,
    thenAction: () {
      Navigator.of(context).pushReplacement(MyAnimatedRoute(page: ResetPasswordVerificationCodeScreen()));
    }
  );
}


void sndEmailErrorCoolAlert(BuildContext context, SendEmailErrorState state) {
  showErrorDialog(
    context: context,
    title: StringConst.sorry,
    text: state.error,
  );
}





void checkCodeErrorMethod(BuildContext context, CheckCodeErrorState state) {
  showErrorDialog(
    context: context,
    title: StringConst.sorry,
    text: state.error,
  );
}
