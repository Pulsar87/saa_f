
import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/assets-const.dart';
import 'package:saa_f/features/Home/presntation/layout/home_layout.dart';
import 'package:saa_f/features/auth/presentation/screens/login.dart';

import '../../../core/router/animation_route.dart';
import '../../on_boarding/presntaion/on_boarding_screen.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_text.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.first});
  final bool first;
  @override
  State<SplashScreen> createState() => _SplashScreenState(first);
}

class _SplashScreenState extends State<SplashScreen> {
final bool first;

  _SplashScreenState(this.first);
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MyAnimatedRoute(page:first? OnboardingScreen(): HomeLayout()));
    });
    //
  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:  Lottie.asset(
                AssetsConst.lottie3,
              height: 300,
              width: double.infinity
            ),
          ),
          // Text('الجمعية الفلكية السورية', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Handlee')),
        ],
      ),

      // backgroundColor: appLightGrey,
        // appBar: AppBar(
        //   // systemOverlayStyle: const SystemUiOverlayStyle(
        //   // systemNavigationBarColor: Colors.white, // Navigation bar
        //   // statusBarColor: Colors.white,
        //   // statusBarIconBrightness: Brightness.light,
        //   // systemNavigationBarIconBrightness: Brightness.light,
        //   // ),
        // ),
        //

        // body:  Container(
        //   decoration: BoxDecoration(
        //     gradient:
        //     LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [
        //           Colors.teal,
        //           Colors.teal[500]!,
        //           Colors.teal[500]!,
        //           Colors.teal[500]!,
        //           Colors.teal[400]!,
        //           Colors.teal[400]!,
        //           Colors.teal[300]!,
        //           Colors.teal[300]!,
        //           Colors.teal[300]!,
        //           Colors.teal[300]!,
        //           Colors.teal[300]!,
        //           Colors.teal[300]!,
        //           // Color(0xffEDC1FD),
        //           // Colors.blue[50]!,
        //           // Colors.blue[100]!,
        //         ]),
        //
        //     // borderRadius: BorderRadius.all(Radius.circular(containerBorderRadius)),
        //   ),
        //
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Image(image: AssetImage(AssetsConst.logo1)),
        //       // SplashLogo(),
        //       SplashText(),
        //       // SplashText()
        //     ],
        //   ),
        // )
    );
  }
}


