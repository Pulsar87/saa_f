import 'package:flutter/material.dart';
import 'package:saa_f/features/profile/presntaion/widget/shimmer_container.dart';

import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/profile_bloc.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
      child: ShimmerContainer2(
        color1: primaryColor,color2: PlightgreenColor,
        circular:20,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("الصور",style: normalTextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),),
                  Text("${ProfileBloc.profileData['total_images']}",style: normalTextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),)
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("المقالات",style: normalTextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),),
                  Text("${ProfileBloc.profileData['total_article']}",style: normalTextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),)
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("الفيديوهات",style: normalTextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),),
                  Text("${ProfileBloc.profileData['total_videos']}",style: normalTextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
