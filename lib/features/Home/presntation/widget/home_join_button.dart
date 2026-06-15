import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/assets-const.dart';

import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/themes/text_style.dart';
import '../../../JoinRequest/presentation/screen/join-screen.dart';

class HomeJoinButton extends StatelessWidget {
  const HomeJoinButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MyAnimatedRoute(page:  JoinScreen()));

        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(height: 90, width: 90,child: Image.asset(AssetsConst.auth3)),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor,width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5,7),
                      blurRadius: 5,
                    ),
                  ]
              ),
              child: Text("انتسب إلى الجمعية",style: normalTextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
            ),
          ],
        ),
      ),
    );
  }
}


