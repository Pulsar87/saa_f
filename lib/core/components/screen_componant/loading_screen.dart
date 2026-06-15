import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/assets-const.dart';
class MyLoadingScreen extends StatelessWidget {
  const MyLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:  Lottie.asset(
                  AssetsConst.loading
              ),
            ),
            Text('...loading', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Handlee')),
          ],
        ),
      ),
    );
  }
}
