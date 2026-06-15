import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../widgets/image-list/category-items-list.dart';
import '../../widgets/image-list/image-lst-item.dart';


class ImageGallery extends StatelessWidget {
  ImageGallery({super.key});

  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());
  int skip = 0;
  int limit = 10;
  bool isLoadMore = false;
  ScrollController imageScrollController = ScrollController();
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
              if (state is ImageListChangeCategoryState) {
                isOperationExecuted = false;
                skip = 0;
                PublishBloc.imageGalleryList.clear();
                print("list is empity");
              }
              if (state is ImageCategoryGetListSuccessState) {
                PublishBloc.imageGalleryCategory = state.category;
                print("cate $PublishBloc.imageGalleryCategory");
                if (state.imageListModel.photos.isEmpty) {
                  print("stop listiner");
                  isOperationExecuted = true;
                }
                if (!isOperationExecuted) {
                  PublishBloc.imageGalleryList.addAll(state.imageListModel.photos);
                  print("image.length ${PublishBloc.imageGalleryList.length}");
                  imageScrollController.addListener(() {
                    if (!isOperationExecuted &&
                        imageScrollController.position.pixels ==
                            imageScrollController.position.maxScrollExtent) {
                      print("max");
                      skip = skip + limit;
                      context.read<PublishBloc>().add(ImageCategoryListRequestEvent(
                          categoryName: PublishBloc.imageGalleryCategory, limit: limit, skip: skip));
                    }
                  });
                }
              }
            }, child:
        BlocBuilder<PublishBloc, PublishState>(builder: (context, state) {
          if (state is PublishInitState) {
            isOperationExecuted = false;
            PublishBloc.imageGalleryList.clear(); // قم بتفريغ القائمة عند بدء التطبيق
            context.read<PublishBloc>().add(ImageCategoryListRequestEvent(
                categoryName: PublishBloc.imageGalleryCategory, limit: limit, skip: 0));
          }
          return SafeArea(
            child : Scaffold (
              appBar: AppBar(
                elevation: 1,
                title: Text("معرض الصور"),
              ),

              body: Container(
                margin: EdgeInsets.all(10),
                child:
                state is ImageCategoryGetListErrorState ?
                Center(child: Text (
                  "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: normalTextStyle(),),)
                    :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryItemsList(selectedCategory: PublishBloc.imageGalleryCategory, isImage: true,),
                    PublishBloc.imageGalleryCategory != "" ? //in case user chose one of the category so he can get back to all
                    TextButton(
                      child: Text("عودة لكل الصور", style:normalTextStyle(fontSize: 15),),
                      onPressed: () {
                        isOperationExecuted = false;
                        PublishBloc.imageGalleryList.clear();
                        skip = 0;
                        context.read<PublishBloc>().add(ImageCategoryListRequestEvent(
                            categoryName: "", limit: limit, skip: skip),
                        );
                      },
                    )
                        : const SizedBox(),
                    state is ImageCategoryGetFirstListLoadingState ?
                    Expanded(child: const Center(child: MyLoadingScreen()))
                        :
                    PublishBloc.imageGalleryList.length == 0?
                    Expanded(child: Center(
                      child: Text(
                        "عذراً.. لا يوجد صور من هذا التصنيف حالياً.",
                        style: normalTextStyle(fontSize: 20),),),)
                        :
                    Expanded(
                      child: GridView.count(
                        controller: imageScrollController,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        physics: BouncingScrollPhysics(), // حركة عند نهاية الليست
                        children: List.generate(
                          PublishBloc.imageGalleryList.length, (index) => ImageGalleryItem (
                          id:  PublishBloc.imageGalleryList[index]["id"],
                          title: PublishBloc.imageGalleryList[index]["title"] ?? "null",
                          img: PublishBloc.imageGalleryList[index]["img_url"],

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

