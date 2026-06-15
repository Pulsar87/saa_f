import 'package:flutter/material.dart';

import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../domain/bloc/profile_bloc.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 63,
      backgroundColor: Colors.white,
      child: CircleAvatar(
          radius: 60,
          backgroundImage: ProfileBloc.profileData['img_url'] != null?
          NetworkImage("${AppConst.imgUrl}${ProfileBloc.profileData['img_url']}")
              : AssetImage(AssetsConst.profilePhoto)
          as ImageProvider<Object>,
          backgroundColor:
          ProfileBloc.profileData['img_url']!=null?
          Colors.white
              :
          primaryColor
      ),
    );
  }
}
