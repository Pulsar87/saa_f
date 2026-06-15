import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../../../../core/functions/YoutubeUrlMethod.dart';
import '../../widgets/admin-publish/post-info-publish-date.dart';
import '../../widgets/category-item.dart';
import '../../widgets/admin-publish/show-image-publish-request/image-info-publish-button-row.dart';
import '../../widgets/admin-publish/show-video-publish-request/video-info-publish-button-row.dart';
import '../../widgets/post/post-user-info.dart';
import '../../widgets/post/video-post-description.dart';
import '../../widgets/publish-method.dart';
import '../../widgets/show-video.dart';

class VideoInfoPublish extends StatefulWidget {
  VideoInfoPublish({super.key, required this.id, required this.title});

  final int id;
  final String title;

  @override
  State<VideoInfoPublish> createState() => _VideoInfoPublishState();
}

class _VideoInfoPublishState extends State<VideoInfoPublish> {
   final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

   var localDescription ;

   var localCategory ;

   var selectedDropdownItem = "start" ;

   var descriptionController = TextEditingController();

   // YoutubePlayerController _controller = YoutubePlayerController(
   //   initialVideoId:
   //   youtubeUrlMethod ("https://www.youtube.com/watch?v=grgNnPmdzGg"),
   //   flags: YoutubePlayerFlags(
   //     autoPlay: true,
   //     mute: false,
   //   ),
   // );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
              if (state is VideoInfoPublishSuccessState) {
                descriptionController.text = state.videoInfoModel.data!.description!;
                localCategory =  selectedDropdownItem !="start"? selectedDropdownItem : state.videoInfoModel.data!.mediaCategory!;
              }
              else if (state is VideoInfoPublishAcceptSuccessState) {

                publishSuccessMethod(state, context, "تم نشر الفيديو", "Success", "pop");
              }
              else if (state is VideoInfoPublishRefuseSuccessState) {

                publishSuccessMethod(state, context, "تم رفض الفيديو", "تم",
                    "pop");
              }
              else if (state is VideoInfoPublishErrorState || state is VideoInfoPublishAcceptErrorState || state is VideoInfoPublishRefuseErrorState) {
                publishErrorCoolAlert(state, context, "الرجاء المحاولة لاحقاً", "حصل خطأ ما");
              }
            },
            child: BlocBuilder<PublishBloc, PublishState>(
                builder: (context, state) {
                  if(state is PublishInitState ) {
                    context
                        .read<PublishBloc>()
                        .add(VideoInfoPublishRequestsEvent(id: widget.id));
                  }
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(title: Text (widget.title),),
                      body:
                      state is VideoInfoPublishLoadingState || state is VideoInfoPublishAcceptLoadingState ||  state is VideoInfoPublishRefuseLoadingState || state is ShowVideoPublishRequestsLoadingState || state is ShowImagePublishRequestsLoadingState?
                      const Center(child: CircularProgressIndicator())
                          :
                      state is VideoInfoPublishSuccessState ?
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PostUserInfo(userName: state.videoInfoModel.data!.userName!, userPhoto: state.videoInfoModel.data?.userProfileImg?? null),
                              SizedBox(height: SizeConfig.screenHeight!/40,),

                              ShowVideo (videoUrl: state.videoInfoModel.data!.videoUrl!),

                              VideoPostDescription(description: state.videoInfoModel.data!.description!),

                              SizedBox(height: SizeConfig.screenHeight!/40,),
                              // choseCategory function
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("تصنيف الفيديو", style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis,),),
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.topCenter,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButton<String>(
                                              value: localCategory,
                                              items: categoryItem.map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      value,
                                                      style: normalTextStyle(),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              elevation: 1,
                                              onChanged: (value) {
                                                setState(() {
                                                  localCategory = value!;
                                                  selectedDropdownItem = value;
                                                  print("selectedDrop " + selectedDropdownItem);
                                                  print("localCategory " + localCategory);
                                                  (context as Element).markNeedsBuild();

                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              PostInfoPublishDate(date: state.videoInfoModel.data!.createdAt! , time: state.videoInfoModel.data!.createdAtRelative!),
                              VideoInfoPublishButtonRow(
                                id: widget.id,
                                category: selectedDropdownItem !="start"? selectedDropdownItem : state.videoInfoModel.data!.mediaCategory!,
                                description: descriptionController.text,),
                          ],
                          ),
                        ),
                      )
                          :
                      state is VideoInfoPublishErrorState || state is VideoInfoPublishAcceptErrorState || state is VideoInfoPublishRefuseErrorState?

                      Center(child: Text (
                        "عذراً حصل خطأ ما\n"
                            "الرجاء المحاولة لاحقاً ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),)
                  :
                      SizedBox(),
                    ),
                  );
                }
            )
        )
    );
  }

   Widget videoInfoPublishData({required String description}) {
    localDescription =  ValueNotifier<String>(description);
     return StatefulBuilder(
       builder: (BuildContext context, void Function(void Function()) setState) {
         return Column(
           children: [
             TextFormField(
                   enabled: false,
               decoration: InputDecoration(
                 suffixIcon: Icon(Icons.description),
                 prefixText: "وصف الصورة",
                 prefixStyle: TextStyle(color: primaryColor, fontSize: 15, fontWeight: FontWeight.w600),
               ),
               initialValue: localDescription.value,
               onChanged: (value) {
                 setState(() {
                   localDescription.value = value;
                   descriptionController.text = value;
                 });
               },
             ),
           ],
         );
       },
     );
   }

}
