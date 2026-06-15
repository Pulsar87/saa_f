import 'package:flutter/material.dart';

import '../../../../../core/constant/app-const.dart';
import '../../../../../core/constant/assets-const.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';

class ImageInfoUserInfo extends StatelessWidget {
  const ImageInfoUserInfo({
    super.key, required this.img, required this.userName,
  });
  final String? img;
  final String userName;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(userName,style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis,),
          SizedBox(width: SizeConfig.screenWidth!/30,),
          img !=null?
          CircleAvatar(
            backgroundImage: NetworkImage("${AppConst.imgUrl}${img}"),
            radius: 30,
          )
              :
          CircleAvatar(
            backgroundImage: AssetImage(AssetsConst.profilePhoto),
            radius: 30,
          )
        ],
      ),
    );
  }
}
