import 'package:flutter/material.dart';

import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/themes/text_style.dart';

class SignUpTopPictures extends StatelessWidget {
  const SignUpTopPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(StringConst.login,style: normalTextStyle(),))),
        Container(
            height: SizeConfig.screenHeight!/3.5,
            child: Image(image: AssetImage(AssetsConst.auth5))),
        SizedBox(
          height: 20,
        ),
        Text(StringConst.creatAccoutn, style: authTitleTextStyle(),),

      ],
    );
  }
}
