import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(StringConst.sorry, style: normalTextStyle(fontSize: 20)),
        content: Text(StringConst.somethingWrong, style: normalTextStyle(fontSize: 15)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}


void requestSuccessMethod(String text, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('', style: normalTextStyle(fontSize: 20)),
        content: Text(text, style: normalTextStyle(fontSize: 20)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  ).then((value) {
    // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: ResetPasswordVerificationCodeScreen()));
  });

  // context.pushReplacement(verificationCodeRoutePath);
  // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: Vere()));
}
