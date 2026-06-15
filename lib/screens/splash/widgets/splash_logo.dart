// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../../core/constant/assets-const.dart';
//
// class SplashLogo extends StatefulWidget {
//    SplashLogo({
//     super.key,
//   });
//
//   @override
//   State<SplashLogo> createState() => _SplashLogoState();
// }
//
// class _SplashLogoState extends State<SplashLogo> with SingleTickerProviderStateMixin{
//   late final AnimationController _animationController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     _animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _animationController.dispose();
//   }
//   @override
//   Widget build(BuildContext context)  {
//     return SizedBox(
//         width: double.infinity,
//         height: 300,
//         child: Lottie.asset(AssetsConst.lottieToDo,
//             // controller: _animationController
//         ));
//   }
// }
