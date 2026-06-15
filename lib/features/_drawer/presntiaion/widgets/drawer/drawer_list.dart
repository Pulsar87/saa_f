// import 'package:flutter/material.dart';
//
// import '../../../../../core/network/local/shared_prefrences_helper.dart';
// import 'drawer_list_item.dart';
// // import '../../../../../core/asset_const/assets-const.dart';
// // import '../../../../../core/constant/app_string/string_const.dart';
// // import 'drawer_list_item.dart';
//
// class DrawerList extends StatelessWidget {
//   const DrawerList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DrawerListItem(
//           text: "الصفحة الرئيسية",
//           iconPath:Icons.home,
//           id: 0,
//         ),
//         if (SharedPreferencesHelper.getData(key: "مسؤول النشر") == "مسؤول النشر")
//           DrawerListItem(
//             text: "طلبات النشر",
//             iconPath:Icons.home,
//             id: 1,
//           ),
//         if (SharedPreferencesHelper.getData(key: "مسؤول الأنشطة") == "مسؤول الأنشطة")
//           DrawerListItem(
//             text: "إضافة نشاط",
//             iconPath:Icons.home,
//             id: 2,
//           ),
//         if (SharedPreferencesHelper.getData(key: "مسؤول الأنشطة") == "مسؤول الأنشطة")
//           DrawerListItem(
//             text: "الأنشطة المعلنة",
//             iconPath:Icons.home,
//             id: 3,
//           ),
//         if (SharedPreferencesHelper.getData(key: "عضو") == "عضو")
//           DrawerListItem(
//             text: "الفرق",
//             iconPath:Icons.home,
//             id: 4,
//           ),
//         if (SharedPreferencesHelper.getData(key: "عضو") != "عضو")
//           DrawerListItem(
//             text: "طلب انتساب",
//             iconPath:Icons.home,
//             id: 5,
//           ),
//         DrawerListItem(
//           text: "النظام الداخلي",
//           iconPath:Icons.home,
//           id: 6,
//         ),
//         DrawerListItem(
//           text: "من نحن",
//           iconPath:Icons.home,
//           id: 7,
//         ),
//         DrawerListItem(
//           text: "تواصل معنا",
//           iconPath:Icons.home,
//           id: 8,
//         ),
//         DrawerListItem(
//           text: "تسجيل الخروج",
//           iconPath:Icons.logout,
//           id: 9,
//         ),
//
//         // DrawerListItem(
//         //   text: AppStringConst.profile,
//         //   iconPath: AssetsConst.drawerIcon1,
//         //   id: 1,
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.favorite,
//         //   iconPath: AssetsConst.favorite,
//         //   id: 2
//         // ),
//         // // DrawerListItem(
//         // //     text: AppStringConst.cart,
//         // //     iconPath: AssetsConst.cart,
//         // //   id: 3
//         // // ),
//         // DrawerListItem(
//         //   text: AppStringConst.wallet,
//         //   iconPath: AssetsConst.wallet,
//         //   id: 3
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.pointsBalance,
//         //   iconPath: AssetsConst.pointsBalance,
//         //   id: 4,
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.notifications,
//         //   iconPath: AssetsConst.notifications,
//         //   id: 5
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.customerOpinions,
//         //   iconPath: AssetsConst.customerOpinions,
//         //   id: 6,
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.connectUs,
//         //   iconPath: AssetsConst.connectUs,
//         //   id: 7
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.privacyPolicy,
//         //   iconPath: AssetsConst.privacyPolicy,
//         //   id: 8
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.about,
//         //   iconPath: AssetsConst.aboutUs,
//         //   id: 9,
//         // ),
//         // DrawerListItem(
//         //   text: AppStringConst.logout,
//         //   iconPath: AssetsConst.drawerHomeIcon,
//         //   id: 10,
//         // ),
//
//       ],
//     );
//
//   }
// }
//
