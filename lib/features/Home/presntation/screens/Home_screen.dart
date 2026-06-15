import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/_drawer/presntiaion/widgets/drawer/my_drawer.dart';

import '../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../../core/router/animation_route.dart';
import '../../../JoinRequest/presentation/screen/join-screen.dart';
import '../widget/home_activity_list.dart';
import '../widget/home_confirm_activity_list.dart';
import '../widget/home_heder_images.dart';
import '../widget/home_img_list.dart';
import '../widget/home_join_button.dart';
import '../widget/home_viedo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("الصفحة الرئيسية"),
        // ),
        // drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeImages(),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (SharedPreferencesHelper.getData(key: "عضو") != "عضو")
                      HomeJoinButton(),
                    HomeActivityList(),
                    SizedBox(height: 20,),

                    HomeConfirmActivityList(),
                    SizedBox(height: 20,),
                    HomeImageList(),
                    SizedBox(height: 20,),
                    HomeVideoList(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

