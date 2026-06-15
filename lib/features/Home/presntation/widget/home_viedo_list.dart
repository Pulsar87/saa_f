import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/assets-const.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/functions/YoutubeUrlMethod.dart';
import '../../../../core/router/animation_route.dart';
import '../../../publish/data/repository/publish_repo.dart';
import '../../../publish/domain/bloc/publish-bloc.dart';
import '../../../publish/domain/bloc/publish-event.dart';
import '../../../publish/domain/bloc/publish-state.dart';
import '../../../publish/presentation/screens/gallarey/video-gallery.dart';

class HomeVideoList extends StatelessWidget {
   HomeVideoList({super.key});
  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
              print(state);
              if (state is VideoCategoryGetListSuccessState) {
                // PublishBloc.imageGalleryCategory = state.category;

                PublishBloc.homeVideoGrid.clear();
                PublishBloc.homeVideoGrid.addAll(state.videoListModel.video);
                print("cate $PublishBloc.imageGalleryCategory");
              }
            }, child:
        BlocBuilder<PublishBloc, PublishState>(builder: (context, state) {
          if (state is PublishInitState) {
            // isOperationExecuted = false;
            // PublishBloc.imageGalleryList.clear(); // قم بتفريغ القائمة عند بدء التطبيق
            context.read<PublishBloc>().add(VideoCategoryListRequestEvent(
                categoryName: "", limit: 3, skip: 0));
          }
          if (state is VideoCategoryGetFirstListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            if (PublishBloc.homeVideoGrid.length == 0) {
              return SizedBox();

            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MyAnimatedRoute(page: VideoGallery()));

                      },
                      child: Text("معرض الفيديو",style: normalTextStyle(color: primaryColor,fontSize: 15),)),
                  Container(
                    height: 200,
                    child: ListView.separated(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8)),
                                  width: SizeConfig.screenWidth!-SizeConfig.screenWidth!/5,
                                  // width: 50,
                                  // height: 20,//video_url

                                  child: Image.network(YoutubePlayer.getThumbnail(videoId: convertUrlToId(PublishBloc.homeVideoGrid[index]['video_url'])??"",),fit: BoxFit.cover),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.play_arrow,
                                        color: primaryColor.withOpacity(0.6),
                                    ))
                              ],
                            ),
                        separatorBuilder: (context, index) => SizedBox(width: 20,),
                        itemCount: PublishBloc.homeVideoGrid.length<3 ?PublishBloc.homeVideoGrid.length :3),
                  ),
                ],
              );
            }
          }
        }
        )
        )
    );

  }
}
