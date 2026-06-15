import 'package:flutter/cupertino.dart';

import '../../../core/constant/app_media_query.dart';
import '../../../core/constant/strings-const.dart';
import '../../../core/router/animation_route.dart';
import '../../../core/themes/text_style.dart';
import '../../Home/presntation/layout/home_layout.dart';
import '../domain/bloc/join_bloc.dart';

void joinErrorCoolAlert(BuildContext context, JoinRequestErrorState state) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(StringConst.sorry, style: normalTextStyle(fontSize: 20)),
        content: Text(state.error, style: normalTextStyle(fontSize: 16)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MyAnimatedRoute(page: HomeLayout()));
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}


void joinSuccessMethod(BuildContext context, JoinRequestSuccessState state, ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('', style: normalTextStyle(fontSize: 20)),
        content: Text(StringConst.joinRequestSendSuccess, style: normalTextStyle(fontSize: 16)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MyAnimatedRoute(page: HomeLayout()));
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
