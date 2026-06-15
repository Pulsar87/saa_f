import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/app-const.dart';
import '../../../../../core/constant/assets-const.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';

class PostUserInfo extends StatelessWidget {
  const PostUserInfo({
    super.key, required this.userName, required this.userPhoto,
  });
  final String userName;
  final  userPhoto;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        userPhoto !=null?
        CircleAvatar(
          backgroundImage: NetworkImage("${AppConst.imgUrl}$userPhoto"),
          radius: 30,
        )
            :
        CircleAvatar(
          backgroundImage: AssetImage(AssetsConst.profilePhoto),
          radius: 20,
        ),
        SizedBox(width: SizeConfig.screenWidth!/30,),

        Expanded(
          child: Text(userName,
            style: normalTextStyle(fontSize: 20),
            maxLines: 1, overflow: TextOverflow.ellipsis,),
        ),

      ],
    );
  }
}
