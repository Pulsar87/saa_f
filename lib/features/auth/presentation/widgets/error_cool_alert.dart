// import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_media_query.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/auth_bloc.dart';

void errorCoolAlert(BuildContext context, SinupErrorState state) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(StringConst.sorry, style: normalTextStyle(fontSize: 20)),
        content: Text(state.error, style: normalTextStyle(fontSize: 16)),
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
