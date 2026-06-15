// import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:saa_ar/core/constant/assets-const.dart';
// import 'package:saa_ar/features/auth/presentation/widgets/auth_clipbath.dart';
// import 'package:saa_ar/publish/presentation/screens/admin-publish/show-aricle-publish-requests.dart';
// import 'package:saa_ar/publish/presentation/screens/admin-publish/show-image-publish-requests.dart';
// import 'package:saa_ar/publish/presentation/screens/admin-publish/show-viedo-publish-requests.dart';
// import 'package:saa_ar/publish/presentation/widgets/user-publish/insert-post-title.dart';
//
// import 'core/components/material-button-componat.dart';
// import 'core/constant/responsive/MediaQuery.dart';
// import 'core/constant/strings-const.dart';
// import 'core/themes/text_style.dart';
//
// class ButtonPage extends StatelessWidget {
//   const ButtonPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SafeArea(
//     child: Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(color: Colors.white),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body:  SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               AuthClipPath(imagePath: imagePath)
//               ClipPath(
//                 clipper: WaveClipperTwo(),
//                 child: Container(
//                   height: SizeConfig.screenHeight! / 2.5,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.teal,
//                           Colors.teal[500]!,
//                           Colors.teal[500]!,
//                           Colors.teal[500]!,
//                           Colors.teal[400]!,
//                           Colors.teal[400]!,
//                           Colors.teal[300]!,
//                           Colors.teal[300]!,
//                           Colors.teal[300]!,
//                         ],
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.topRight,
//                       ),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     child: Align(
//                         alignment: Alignment.center,
//                         child: Image(
//                           image:
//                           AssetImage(AssetsConst.auth6),
//                         )),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.all(20),
//                 child: Column(
//                     children: [
//                 Center(
//                 child: Text(
//                 "صناعة المحتوى الجديد",
//                     style: Theme
//                         .of(context)
//                         .textTheme
//                         .labelLarge
//                 ),
//               ),
//         SizedBox(
//           height: SizeConfig.screenHeight! / 50,
//         ),
//
//         InsertPostTitle(text:   "قام المستخدمون بالمساهمة في نشر محتوى جديد على الموقع \n قم بالتأكد من تناسب هذا المحتوى مع معايير التطبيق وقبوله أو رفضه",),
//         MaterialButtonComponent (
//           child: Text("طلبات نشر المقالات",
//             style: TextStyle(
//                 fontSize: 25, fontWeight: FontWeight.bold
//             ),),
//           onPressed: (){
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ShowArticlePublishRequests()),
//             );                },
//         ),
//         MaterialButtonComponent (
//           child: Text("طلبات نشر الصور",
//             style: TextStyle(
//                 fontSize: 25, fontWeight: FontWeight.bold
//             ),),
//           onPressed: (){
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ShowImagePublishRequests()),
//             );                },
//         ),
//         MaterialButtonComponent (
//           child: Text("طلبات نشر الفيديو",
//             style: TextStyle(
//                 fontSize: 25, fontWeight: FontWeight.bold
//             ),),
//           onPressed: (){
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ShowVideoPublishRequests()),
//             );                },
//         ),
//                     ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     // Column(
//       //   children: [
//       //     ClipPath(
//       //       clipper: WaveClipperTwo(),
//       //       child: Container(
//       //         height: SizeConfig.screenHeight! / 3,
//       //         decoration: BoxDecoration(
//       //           color: Colors.black,
//       //         ),
//       //         child: Container(
//       //           width: double.infinity,
//       //           decoration: BoxDecoration(
//       //             gradient: LinearGradient(
//       //               colors: [
//       //                 Colors.purple[800]!,
//       //                 Colors.purple[800]!,
//       //                 Colors.purple[700]!,
//       //                 Colors.purple[700]!,
//       //                 Colors.teal,
//       //                 Colors.teal[300]!
//       //               ],
//       //               begin: Alignment.bottomLeft,
//       //               end: Alignment.topRight,
//       //             ),
//       //           ),
//       //           padding: EdgeInsets.all(16),
//       //           // child: Align(
//       //           //     alignment: Alignment.center,
//       //           //     child: Image(
//       //           //       image:
//       //           //       AssetImage(imagePath),
//       //           //     )),
//       //         ),
//       //       ),
//       //     ),
//       //     Container(
//       //       width: 500,
//       //       height: 500,
//       //       decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.only(
//       //               bottomLeft: Radius.circular(10),
//       //               bottomRight: Radius.circular(10)),
//       //           boxShadow: [
//       //             BoxShadow(
//       //                 color: Color(0xffA22447).withOpacity(.05),
//       //                 offset: Offset(0, 0),
//       //                 blurRadius: 20,
//       //                 spreadRadius: 3)
//       //           ]),
//       //       child: Material(
//       //         borderRadius: BorderRadius.only(
//       //             bottomLeft: Radius.circular(10),
//       //             bottomRight: Radius.circular(10)),
//       //         elevation: 5,
//       //         shadowColor: Color(0xffA22447).withOpacity(.05),
//       //         color: Color(0xFFF7F7F7),
//       //         child: SizedBox(
//       //           height: MediaQuery.of(context).size.height / 3,
//       //         ),
//       //       ),
//       //     )
//       //
//       //   ],
//       // ),
//     );
//   }
// }


import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import 'core/constant/app_media_query.dart';
import 'core/themes/text_style.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: IconButton(icon: Icon(Icons.add),
        onPressed: (){

          CoolAlert.show(
            showCancelBtn: true,
            width: displayWidth(context) / 4,
            context: context,
            type: CoolAlertType.loading,
            title: '',
            textTextStyle: normalTextStyle(fontSize: 20),
            text: "text",
            // autoCloseDuration: const Duration(seconds: 4),
          ).then((value) {
            // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: DrawerLayout()));
          });
        }),
      ),
    );
  }
}
