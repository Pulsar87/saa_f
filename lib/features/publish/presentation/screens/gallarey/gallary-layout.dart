// import 'package:flutter/material.dart';
// import 'package:saa_project/features/publish/presentation/screens/gallarey/video-gallery.dart';
// import 'image-gallery.dart';
//
// class GalleryLayout extends StatelessWidget {
//   const GalleryLayout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         // appBar: AppBar(
//         //   elevation: 1,
//         //   title: Text("المعرض الفلكي"),
//         // ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 const TabBar(
//                   tabs : [
//                     Tab(child: Text('صور',maxLines: 1,),),
//                     Tab(child: Text('فيديو',maxLines: 1,),),
//                   ],
//                 ),
//                 Container(
//                   width: double.infinity,
//                   color: Colors.grey,
//                   height: 2,
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       ImageGallery (),
//
//                       VideoGallery(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
