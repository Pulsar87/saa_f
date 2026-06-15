import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../core/constant/app_media_query.dart';

void activitySuccessMetohd(BuildContext context,String text,) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('تم', style: normalTextStyle(fontSize: 20)),
        content: Text(text, style: normalTextStyle(fontSize: 16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  ).then((value) {
    // Navigator.of(context).pushReplacement(
    //     MyAnimatedRoute(page: DrawerLayout()));
  });
}


void activityErrorMethod(BuildContext context,String text,) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('', style: normalTextStyle(fontSize: 20)),
        content: Text(text, style: normalTextStyle(fontSize: 16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
  // Navigator.of(context).pushReplacement(
  //     MyAnimatedRoute(page: DrawerLayout()));
}