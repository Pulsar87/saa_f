// import 'package:flutter/material.dart';
// import 'package:saa_project/features/publish/presentation/screens/admin-publish/show-image-publish-requests.dart';
// import 'package:saa_project/features/publish/presentation/screens/admin-publish/show-viedo-publish-requests.dart';
//
// class PublishRequestLayout extends StatelessWidget {
//   const PublishRequestLayout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           title: Text("طلبات النشر"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               const TabBar(
//                 tabs : [
//               Tab(child: Text('صور',maxLines: 1,),),
//               Tab(child: Text('فيديوهات',maxLines: 1,),),
//             ],
//           ),
//               Container(
//                 width: double.infinity,
//                 color: Colors.grey,
//                 height: 2,
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     ShowImagePublishRequests(),
//
//                     ShowVideoPublishRequests(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/auth/presentation/widgets/auth_clipbath.dart';
import 'package:saa_f/features/publish/presentation/screens/admin-publish/show-aricle-publish-requests.dart';
import 'package:saa_f/features/publish/presentation/screens/admin-publish/show-image-publish-requests.dart';
import 'package:saa_f/features/publish/presentation/screens/admin-publish/show-viedo-publish-requests.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../../../core/constant/assets-const.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/router/animation_route.dart';
import '../../widgets/user-publish/insert-post-title.dart';

class PublishRequestLayout extends StatelessWidget {
  const PublishRequestLayout({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScreenClipPath(imagePath: AssetsConst.img3,h: 2.2,),
                Container(
                  margin: EdgeInsets.all(20),

                  child: Column(
                    children: [
                      InsertPostTitle(text:   "قام المستخدمون بالمساهمة في نشر محتوى جديد على الموقع \n"
                          " قم بالتأكد من تناسب هذا المحتوى مع معايير التطبيق وقبوله أو رفضه",),
                      MaterialButtonComponent (
                        child: Text("طلبات نشر المقالات",
                          style: buttonTextStyle()
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: ShowArticlePublishRequests()));
                          },
                      ),
                      MaterialButtonComponent (
                        verticalMargin:5,
                        child: Text("طلبات نشر الصور",
                            style: buttonTextStyle()
                      ),
                        onPressed: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: ShowImagePublishRequests()));
                          },
                      ),
                      MaterialButtonComponent (
                        child: Text("طلبات نشر الفيديو",
                            style: buttonTextStyle()
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: ShowVideoPublishRequests()));
                          },
                      ),

                    ],
                  ),
                ),
                // MaterialButtonComponent (
                //   child: Text("فتح محرر النصوص",
                //       style: TextStyle(
                //           fontSize: 25, fontWeight: FontWeight.bold
                //       )
                //   ),
                //   onPressed: (){
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => TextEditor()),
                //     );                },
                // )
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
