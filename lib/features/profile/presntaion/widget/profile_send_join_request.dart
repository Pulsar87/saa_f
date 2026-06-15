import 'package:flutter/material.dart';

import '../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../Home/presntation/widget/home_join_button.dart';

class ProfileSendJoinRequest extends StatelessWidget {
  const ProfileSendJoinRequest({super.key});

  @override
  Widget build(BuildContext context) {
    if (SharedPreferencesHelper.getData(key: "عضو") != "عضو")
    return  Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,bottom: 50),
          child: HomeJoinButton(),
        ),
      );
    else
      return SizedBox();
  }
}
