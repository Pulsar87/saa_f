import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/router/router_name.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/publish-state.dart';

void publishSuccessMethod(PublishState state, BuildContext context,String msg, String title,var path) {
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
                Navigator.of(context).pop();
              else if (path is Widget)
                Navigator.of(context).pushReplacement(MyAnimatedRoute(page: path));
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );

}
void publishErrorCoolAlert(PublishState state, BuildContext context,String msg, String title) {
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
