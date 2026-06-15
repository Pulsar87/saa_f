import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../../../../core/functions/YoutubeUrlMethod.dart';
import '../../widgets/gallery/viedo-gallery-grid-item.dart';
import '../../widgets/image-list/category-items-list.dart';
import '../video-show-info.dart';

class VideoGallery extends StatelessWidget {
  VideoGallery({super.key});

  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());
  int skip = 0;
  int limit = 10;
  bool isLoadMore = false;
  ScrollController videoScrollController = ScrollController();
  bool isOperationExecuted =  false; // Variable to track if the operation is already executed

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isOperationExecuted =  false; // Reset the flag when the new frame is rendered
       });

    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
              print(state);
              if (state is VideoListChangeCategoryState) {
                isOperationExecuted = false;
                skip = 0;
                PublishBloc.videoGalleryList.clear();
                print("list is empity");
              }
              if (state is VideoCategoryGetListSuccessState) {
                PublishBloc.videoGalleryCategory = state.category;
                print("cate $PublishBloc.videoGalleryCategory");
                if (state.videoListModel.video.isEmpty) {
                  print("stop listiner");
                  isOperationExecuted = true;
                }
                if (!isOperationExecuted) {
                  PublishBloc.videoGalleryList.addAll(state.videoListModel.video);
                  print("viedos.length ${PublishBloc.videoGalleryList.length}");
                  videoScrollController.addListener(() {
                    if (!isOperationExecuted &&
                        videoScrollController.position.pixels ==
                            videoScrollController.position.maxScrollExtent) {
                      print("max");
                      skip = skip + limit;
                      context.read<PublishBloc>().add(VideoCategoryListRequestEvent(
                      categoryName: PublishBloc.videoGalleryCategory, limit: limit, skip: skip));
                }
              });
            }
          }
        }, child:
            BlocBuilder<PublishBloc, PublishState>(builder: (context, state) {
              if (state is PublishInitState) {
                isOperationExecuted = false;
                PublishBloc.videoGalleryList.clear(); // قم بتفريغ القائمة عند بدء التطبيق

                context.read<PublishBloc>().add(VideoCategoryListRequestEvent(
                    categoryName: PublishBloc.videoGalleryCategory, limit: limit, skip: 0));
          }
              return SafeArea(
                child :Scaffold (
                  appBar: AppBar(
                    elevation: 1,
                    title: Text("معرض الفيديو"),
                  ),
                  body: Container(
                    margin: EdgeInsets.all(10),
                    child:
                    state is VideoCategoryGetListErrorState ?
                    Center(child: Text (
                      "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: normalTextStyle(),),)
                        :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryItemsList(selectedCategory: PublishBloc.videoGalleryCategory, isImage: false,), //is image false because this is video gallarey
                        PublishBloc.videoGalleryCategory != "" ? //in case user chose one of the category so he can get back to all
                        TextButton(
                          child: Text("عودة لكل الفيديوهات", style: normalTextStyle(fontSize: 15),),
                          onPressed: () {
                            isOperationExecuted = false;
                            PublishBloc.videoGalleryList.clear();
                            skip = 0;
                            context.read<PublishBloc>().add(VideoCategoryListRequestEvent(
                                categoryName: "", limit: limit, skip: skip),
                            );
                          },
                        )
                            : const SizedBox(),
                        state is VideoCategoryGetFirstListLoadingState ?
                        Expanded(child: const Center(child: MyLoadingScreen()))
                        :
                        PublishBloc.videoGalleryList.length == 0?
                        Expanded(child: Center(
                          child: Text(
                            "عذراً.. لا يوجد فيديوهات من هذا التصنيف حالياً.",
                              style: normalTextStyle(fontSize: 20),),),)
                            :
                        Expanded(
                          child: GridView.count(
                            controller: videoScrollController,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            physics: BouncingScrollPhysics(), // حركة عند نهاية الليست
                            children: List.generate(
                              PublishBloc.videoGalleryList.length, (index) => VideoGalleryGridItem (
                              id:  PublishBloc.videoGalleryList[index]["id"],
                              title: PublishBloc.videoGalleryList[index]["title"] ?? "null",
                              videoUrl: PublishBloc.videoGalleryList[index]['video_url'],
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            )
        )
    );
  }
}
