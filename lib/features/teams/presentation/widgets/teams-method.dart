import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/router/router_name.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/teams-state.dart';

void teamsSuccessMethod(TeamsState state, BuildContext context,String msg, String title,String path) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? "", style: normalTextStyle(fontSize: 30)),
        content: Text(msg ?? "", style: normalTextStyle(fontSize: 20)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (path == "pop")
                Navigator.pop(context);
             else if (path =="nothing")
                print("object");
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  ).then((value) {
    // Auto-close after 2 seconds could be added here if needed
  });

}


void teamsErrorCoolAlert(TeamsState state, BuildContext context,String msg, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? "Error", style: normalTextStyle(fontSize: 30)),
        content: Text(msg ?? "حصل خطأ ما، أعد المحاولة في وقتٍ لاحق", style: normalTextStyle(fontSize: 20)),
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
