// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:go_router/go_router.dart';
// // // import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// // import '../../../../core/constant/responsive/MediaQuery.dart';
// // import '../../data/repository/team_repo.dart';
// // import '../../domain/bloc/teams-bloc.dart';
// // import '../../domain/bloc/teams-state.dart';
// // import '../widgets/post/post-time.dart';
// // import '../widgets/post/post-user-info.dart';
// // import '../widgets/show-video.dart';
// // import '../widgets/video-post/video-post-description.dart';
// // import '../widgets/video-post/video-post-like.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';
// //
// // class VideoShowInfo extends StatelessWidget {
// //   VideoShowInfo({super.key, required this.id, required this.description, required this.title, required this.isLike, required this.userName, required this.userPhoto, required this.category, required this.likeCount, required this.date, required this.time, required this.videoUrl});
// //
// //   final int id;
// //   final String userName;
// //   final userPhoto;
// //   final String category;
// //   final String description;
// //   final int likeCount;
// //   final String date;
// //   final String time;
// //   final String title;
// //   final String videoUrl;
// //   final bool isLike;
// //
// //   final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());
// //   @override
// //   Widget build(BuildContext context) {
// //     SizeConfig().init(context);
// //     return BlocProvider(
// //         create: (BuildContext context) => publishBloc,
// //         child: BlocListener<PublishBloc, PublishState>(
// //             listener: (context, state) {
// //               print(state);
// //
// //               print(state);
// //
// //             },
// //             child: BlocBuilder<PublishBloc, PublishState>(
// //                 builder: (context, state) {
// //                   return WillPopScope(
// //                     onWillPop: () async {
// //
// //                       print("تم النقر على زر العودة في الهاتف");
// //                       //
// //                       Navigator.pop(context, null); // استخدام null بدلاً من false
// //                       return false;
// //                     },
// //
// //                     child: SafeArea(
// //                       child: Scaffold(
// //                           appBar: AppBar(title: Text(title),
// //                             leading: IconButton (
// //                               icon: Icon(Icons.arrow_back),
// //                               onPressed: () {
// //                                 Navigator.pop(context);
// //                               },
// //                             ),
// //                           ),
// //                           body:
// //                           Container(
// //                             margin: const EdgeInsets.all(20),
// //                             child: SingleChildScrollView(
// //                               child: Container(
// //                                 margin: const EdgeInsets.symmetric(
// //                                     horizontal: 8,
// //                                     vertical: 8
// //                                 ),
// //                                 padding: const EdgeInsets.symmetric(
// //                                   vertical: 8,
// //                                   horizontal: 8,
// //                                 ),
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.all(Radius.circular(16)),
// //                                   color: Colors.white,
// //                                   boxShadow: [
// //                                     BoxShadow(
// //                                       color: Colors.grey.withOpacity(0.5),
// //                                       spreadRadius: 5,
// //                                       blurRadius: 7,
// //                                       offset: Offset(0, 3), // changes position of shadow
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 child: Column(
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     PostUserInfo(userName:
// //                                     userName
// //                                         // "state.imageInfoModel.data!.userName!"
// //                                         , userPhoto: userPhoto),
// //                                     Row(
// //                                       mainAxisAlignment: MainAxisAlignment.end,
// //                                       children: [
// //                                         Container(
// //                                             decoration: BoxDecoration(
// //                                               color : Colors.grey.withOpacity(0.7),
// //                                               borderRadius: BorderRadius.circular(10),
// //                                             ),
// //                                             child: Padding(
// //                                               padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
// //                                               child: Center(
// //                                                 child: Text(category ,
// //                                                     style:TextStyle(
// //                                                       fontSize: 20,
// //                                                       fontWeight:  FontWeight.bold,
// //                                                       color: Colors.black,
// //                                                     )
// //                                                 ),
// //                                               ),
// //                                             )
// //                                         ),
// //                                       ],
// //                                     ),
// //                                     SizedBox(height: SizeConfig.screenHeight!/80,),
// //                                     // ShowVideo(videoUrl: videoUrl),
// //                                     SizedBox(height: SizeConfig.screenHeight!/80,),
// //                                     VideoPostDescription(description : description,),
// //                                     VideoPostLike (id :id,likesCount: likeCount,isLike: isLike),
// //                                     PostTime(
// //                                         time: time,
// //                                         // "state.imageInfoModel.data!.createdAt!",
// //                                         date:date),
// //
// //                                     // "state.imageInfoModel.data!.createdAtRelative!"),
// //
// //
// //                                     // Center(
// //                                     //   child: YoutubePlayer(
// //                                     //     controller: YoutubePlayerController(
// //                                     //       initialVideoId: "nGSw2Jp2G24&list=RDnGSw2Jp2G24&start_radio=1",
// //                                     //       flags: YoutubePlayerFlags(
// //                                     //         autoPlay: true, // تشغيل الفيديو تلقائيًا عند تحميل الصفحة
// //                                     //         mute: false, // كتم الصوت تلقائيًا عند تحميل الصفحة
// //                                     //         loop: false, // تشغيل الفيديو مرة واحدة فقط أو تكراره
// //                                     //       ),
// //                                     //     ),
// //                                     //     showVideoProgressIndicator: true, // إظهار شريط التقدم أثناء تشغيل الفيديو
// //                                     //     progressIndicatorColor: Colors.red,   //لون شريط التقدم
// //                                     //
// //                                     //     progressColors: ProgressBarColors(
// //                                     //       playedColor: Colors.red, // لون شريط التقدم عند تشغيل الفيديو
// //                                     //       handleColor: Colors.redAccent, // لون مؤشر شريط التقدم
// //                                     //       ),
// //                                     //     onReady: () {
// //                                     //       print ("ready");
// //                                     //       // عندما يكون الفيديو جاهزًا للتشغيل
// //                                     //     },
// //                                     //     onEnded: (error) {
// //                                     //       // إذا حدث خطأ أثناء تحميل الفيديو
// //                                     //       print('حدث خطأ أثناء تحميل الفيديو: $error');
// //                                     //     },
// //                                     //   ),
// //                                     // ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ),
// //                           )
// //                         // :
// //                         // Center(child: Text(
// //                         //   "عذراً حصل خطأ ما\n"
// //                         //       "الرجاء المحاولة لاحقاً ",
// //                         //   style: Theme.of(context).textTheme.titleMedium,
// //                         // ),),
// //                       ),
// //                     ),
// //                   );
// //                 }
// //             )
// //         )
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// //
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// // import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../data/repository/team_repo.dart';
// import '../../domain/bloc/teams-bloc.dart';
// import '../../domain/bloc/teams-state.dart';
// import '../widgets/post/post-time.dart';
// import '../widgets/post/post-user-info.dart';
// import '../widgets/show-video.dart';
// import '../widgets/video-post/video-post-description.dart';
// import '../widgets/video-post/video-post-like.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class VideoShowInfo extends StatelessWidget {
//
//   VideoShowInfo({super.key, required this.id, required this.title, });
//
//   // int id;
//   // final String userName;
//   // final userPhoto;
//   // final String category;
//   // final String description;
//   // final int likeCount;
//   // final String date;
//   // final String time;
//   // final String title;
//   // final String videoUrl;
//   // final bool isLike;
//   final int id;
//   final String title;
//   final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return BlocProvider(
//         create: (BuildContext context) => publishBloc,
//           child: BlocListener<PublishBloc, PublishState>(
//           listener: (context, state) {},
//       child: BlocBuilder<PublishBloc, PublishState>(
//     builder: (context, state) {
//     if (state is PublishInitState) {
//     context
//         .read<PublishBloc>()
//         .add(ImageShowInfoGetInfoEvent(id:id));
//     }
//
//     return  SafeArea(
//       child: Scaffold(
//           appBar: AppBar(title: Text(title),
//             leading: IconButton (
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           body:
//           Container(
//             margin: const EdgeInsets.all(20),
//             child: SingleChildScrollView(
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 8
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 8,
//                   horizontal: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     PostUserInfo(userName:
//                     userName
//                         // "state.imageInfoModel.data!.userName!"
//                         , userPhoto: userPhoto),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                             decoration: BoxDecoration(
//                               color : Colors.grey.withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
//                               child: Center(
//                                 child: Text(category ,
//                                     style:TextStyle(
//                                       fontSize: 20,
//                                       fontWeight:  FontWeight.bold,
//                                       color: Colors.black,
//                                     )
//                                 ),
//                               ),
//                             )
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: SizeConfig.screenHeight!/80,),
//                     ShowVideo(videoUrl: videoUrl),
//                     SizedBox(height: SizeConfig.screenHeight!/80,),
//                     VideoPostDescription(description : description,),
//                     VideoPostLike (id :id,likesCount: likeCount,isLike: isLike),
//                     PostTime(
//                         time: time,
//                         // "state.imageInfoModel.data!.createdAt!",
//                         date:date),
//
//                     // "state.imageInfoModel.data!.createdAtRelative!"),
//
//
//                     // Center(
//                     //   child: YoutubePlayer(
//                     //     controller: YoutubePlayerController(
//                     //       initialVideoId: "nGSw2Jp2G24&list=RDnGSw2Jp2G24&start_radio=1",
//                     //       flags: YoutubePlayerFlags(
//                     //         autoPlay: true, // تشغيل الفيديو تلقائيًا عند تحميل الصفحة
//                     //         mute: false, // كتم الصوت تلقائيًا عند تحميل الصفحة
//                     //         loop: false, // تشغيل الفيديو مرة واحدة فقط أو تكراره
//                     //       ),
//                     //     ),
//                     //     showVideoProgressIndicator: true, // إظهار شريط التقدم أثناء تشغيل الفيديو
//                     //     progressIndicatorColor: Colors.red,   //لون شريط التقدم
//                     //
//                     //     progressColors: ProgressBarColors(
//                     //       playedColor: Colors.red, // لون شريط التقدم عند تشغيل الفيديو
//                     //       handleColor: Colors.redAccent, // لون مؤشر شريط التقدم
//                     //       ),
//                     //     onReady: () {
//                     //       print ("ready");
//                     //       // عندما يكون الفيديو جاهزًا للتشغيل
//                     //     },
//                     //     onEnded: (error) {
//                     //       // إذا حدث خطأ أثناء تحميل الفيديو
//                     //       print('حدث خطأ أثناء تحميل الفيديو: $error');
//                     //     },
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         // :
//         // Center(child: Text(
//         //   "عذراً حصل خطأ ما\n"
//         //       "الرجاء المحاولة لاحقاً ",
//         //   style: Theme.of(context).textTheme.titleMedium,
//         // ),),
//       ),
//     );
//   }
// }
//
//
//
//
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../data/repository/publish_repo.dart';
import '../../domain/bloc/publish-bloc.dart';
import '../../domain/bloc/publish-event.dart';
import '../../domain/bloc/publish-state.dart';
import '../widgets/post/post-time.dart';
import '../widgets/post/post-user-info.dart';
import '../widgets/show-video.dart';
import '../widgets/post/video-post-description.dart';
import '../widgets/post/video-post-like.dart';

class VideoShowInfo extends StatelessWidget {
  VideoShowInfo({super.key, required this.id, required this.title});

  final int id;
  final String title;
  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {},
            child: BlocBuilder<PublishBloc, PublishState>(
                builder: (context, state) {
                  if (state is PublishInitState) {
                    context
                        .read<PublishBloc>()
                        .add(VideoShowInfoGetInfoEvent(id:id));
                  }

                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(title: Text(title),),
                      body:
                      state is VideoShowInfoLoadingState ?
                      const Center(child: CircularProgressIndicator())
                          :
                      Container(
                        margin: const EdgeInsets.all(20),
                        child:
                  state is  VideoShowInfoSuccessState ?
                        SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              PostUserInfo(userName: state.videoInfoModel.data!.userName!, userPhoto: state.videoInfoModel.data!.userProfileImg?? null),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color : Colors.grey.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
                                        child: Center(
                                          child: Text(state.videoInfoModel.data!.mediaCategory! ,
                                              style:TextStyle(
                                                fontSize: 20,
                                                fontWeight:  FontWeight.bold,
                                                color: Colors.black,)
                                          ),),)
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConfig.screenHeight!/80,),
                              ShowVideo(videoUrl: state.videoInfoModel.data!.videoUrl!),
                              SizedBox(height: SizeConfig.screenHeight!/80,),
                              VideoPostDescription(description : state.videoInfoModel.data!.description!,),
                              VideoPostLike (id :id,likesCount: state.videoInfoModel.data!.likesCount!,isLike: state.videoInfoModel.data!.isLike!),
                              PostTime(time: state.videoInfoModel.data!.createdAt!, date:state.videoInfoModel.data!.createdAtRelative!),
                          ]
                          ),
                        ),
                      )
                          :
                      Center(child: Text(
                        "عذراً حصل خطأ ما\n"
                            "الرجاء المحاولة لاحقاً ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),),
                    ),
                  )
                  );
                }
            )
        )
    );
  }
}











//
  //
  // Column(
  // mainAxisAlignment: MainAxisAlignment.start,
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  // PostUserInfo(userName:
  // userName
  // // "state.imageInfoModel.data!.userName!"
  // , userPhoto: userPhoto),
  // Row(
  // mainAxisAlignment: MainAxisAlignment.end,
  // children: [
  // Container(
  // decoration: BoxDecoration(
  // color : Colors.grey.withOpacity(0.7),
  // borderRadius: BorderRadius.circular(10),
  // ),
  // child: Padding(
  // padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
  // child: Center(
  // child: Text(category ,
  // style:TextStyle(
  // fontSize: 20,
  // fontWeight:  FontWeight.bold,
  // color: Colors.black,
  // )
  // ),
  // ),
  // )
  // ),
  // ],
  // ),
  // SizedBox(height: SizeConfig.screenHeight!/80,),
  // ShowVideo(videoUrl: videoUrl),
  // SizedBox(height: SizeConfig.screenHeight!/80,),
  // VideoPostDescription(description : description,),
  // VideoPostLike (id :id,likesCount: likeCount,isLike: isLike),
  // PostTime(
  // time: time,
  // // "state.imageInfoModel.data!.createdAt!",
  // date:date),
