// import 'package:flutter/material.dart';
// import '../../../../../core/constant/app-const.dart';
// import '../../../../../core/constant/colors/light-colors.dart';
// import '../../../../../core/constant/responsive/MediaQuery.dart';
// import 'drawer_avatar.dart';
// import 'drawer_list.dart';
// import 'drawer_user_name.dart';
//
// class MyDrawer extends StatelessWidget {
//    const MyDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     SizeConfig().init(context);
//     return Container(
//       // height: SizeConfig.screenHeight,
//       width: SizeConfig.screenWidth!/1.5,
//       decoration:  const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50),
//           bottomLeft: Radius.circular(50),
//         ),
//         // border: Border.all(
//         //   color: primaryColor.withOpacity(0.8),
//         //   width: 2
//         // )
//         // gradient: LinearGradient(
//         //   colors: [primaryColor,primaryColor.withOpacity(0.9)], // الألوان التي تريدها في التدرج
//         //   begin: Alignment.topRight, // بداية التدرج من الزاوية العليا اليسرى
//         //   end: Alignment.bottomLeft, // نهاية التدرج في الزاوية السفلية اليمنى
//         // ),
//       ),
//       height: SizeConfig.screenHeight,
//       child: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.all(20),
//           padding: const EdgeInsets.only(top: 40),
//           child:  const Column(
//             children: [
//               // const DrawerAvatar(),
//               SizedBox(height: 20,),
//               // DrawerUserName(userName: AppConst.profileUserName,),
//               SizedBox(height: 20,),
//               DrawerList(),
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
// }
