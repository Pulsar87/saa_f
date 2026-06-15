import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';

import 'core/constant/app_media_query.dart';
import 'core/constant/strings-const.dart';
import 'core/themes/text_style.dart';

RequestModel RequestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));
String signupModelToJson(RequestModel data) => json.encode(data.toJson());
//
class RequestModel {
  RequestModel({
    this.sucesss,
    this.msg,
  });

  RequestModel.fromJson(dynamic json) {
    sucesss = json['sucesss'];
    msg = json['msg'];
    // data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? sucesss;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sucesss'] = sucesss;
    map['msg'] = msg;
    return map;
  }
}



void requestErrorCoolAlert(BuildContext context) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: StringConst.somethingWrong,
    textTextStyle: normalTextStyle(fontSize: 15),
    loopAnimation: false,
  );
}


void requestSuccessMethod(String text, BuildContext context) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.success,
    title: '',
    textTextStyle: normalTextStyle(fontSize: 20),
    text: text,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: ResetPasswordVerificationCodeScreen()));
  });

  // context.pushReplacement(verificationCodeRoutePath);
  // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: Vere()));
}
