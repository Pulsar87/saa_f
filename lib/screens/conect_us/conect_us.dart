import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/screens/conect_us/conect_us_list_tile.dart';
import 'package:saa_f/screens/conect_us/whatsapp.dart';

import '../../core/constant/assets-const.dart';
import '../../core/constant/colors/light-colors.dart';

class ConnectUsPage extends StatelessWidget {
  const ConnectUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "معلومات التواصل",
            style: TextStyle(color: primaryColor),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.purple
            gradient: LinearGradient(
              colors: [
                primaryColor,
                PlightgreenColor
              ], // الألوان التي تريدها في التدرج
              begin: Alignment.topLeft, // بداية التدرج من الزاوية العليا اليسرى
              end: Alignment
                  .bottomRight, // نهاية التدرج في الزاوية السفلية اليمنى
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Center(child: Image(image: AssetImage(AssetsConst.logo1))),
                    ConnectUsListTile(name: "تركية جبور", img: AssetsConst.connect2, number: '+963951200576'),
                    ConnectUsListTile(name: "عبد اللطيف الخالدي", img: AssetsConst.connect1, number: '+963951200576'),
                    ConnectUsListTile(name: "عبد العزيز سنوبر", img: AssetsConst.connect3, number: '+963951200576'),
                    ConnectUsListTile(name: "طارق الخطيب", img: AssetsConst.auth7, number: '+963951200576'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

