// import 'package:flutter/material.dart';
// import 'package:saa_project/core/constant/assets-const.dart';
//
// import '../../../../../core/constant/app-const.dart';
// import '../../../../../core/constant/colors/light-colors.dart';
// import '../../../../../core/constant/responsive/MediaQuery.dart';
//
// class ImagePostPhoto extends StatelessWidget {
//   const ImagePostPhoto({
//     super.key, required this.img,
//   });
//   final String img;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//
//     return Center(
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight!/80),
//         decoration: BoxDecoration(
//             color: Colors.grey[400],
//             borderRadius: BorderRadius.all(Radius.circular(25)),
//             border: Border.all(
//               color: primaryColor,
//               width: 2,
//             ),
//             image: DecorationImage(
//                 image: NetworkImage(
//                     "${AppConst.imgUrl}$img"),
//                 fit: BoxFit.fill
//             )
//         ),
//         height: SizeConfig.screenHeight! / 3,
//         width: SizeConfig.screenHeight! / 3,
//
//       ),
//     );
//   }
// }
