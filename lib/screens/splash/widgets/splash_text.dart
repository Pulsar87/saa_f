import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../core/constant/strings-const.dart';

class SplashText extends StatelessWidget {
  const SplashText({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(StringConst.arabicAppppName, style: TextStyle(fontSize: 35, fontFamily: 'Handlee',fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
        SizedBox(height: 20,),
        // Text(StringConst.arabicApppLogo,style: normalTextStyle(color: Colors.black),),
        SizedBox(
          height: 100,
          child:

          AnimatedTextKit(
            repeatForever: false,
            animatedTexts: [
              TyperAnimatedText(StringConst.arabicApppLogo,
                textStyle:normalTextStyle(
                  fontSize: 25,
                  color: Colors.black
                ),
                speed: Duration (milliseconds: 100)
              ),
            ],
          ),
        ),
      ],
    );
  }
}
