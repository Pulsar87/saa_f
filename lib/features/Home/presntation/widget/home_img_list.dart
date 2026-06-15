import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/app-const.dart';
import 'package:saa_f/core/constant/assets-const.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../core/router/animation_route.dart';
import '../../../publish/data/repository/publish_repo.dart';
import '../../../publish/domain/bloc/publish-bloc.dart';
import '../../../publish/domain/bloc/publish-event.dart';
import '../../../publish/domain/bloc/publish-state.dart';
import '../../../publish/presentation/screens/gallarey/image-gallery.dart';

class HomeImageList extends StatelessWidget {
   HomeImageList({super.key});
  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
              print(state);
              if (state is ImageCategoryGetListSuccessState) {
                // PublishBloc.imageGalleryCategory = state.category;
                PublishBloc.homeImageGrid.clear();
                PublishBloc.homeImageGrid.addAll(state.imageListModel.photos);
                print("cate $PublishBloc.imageGalleryCategory");
              }
            }, child:
        BlocBuilder<PublishBloc, PublishState>(builder: (context, state) {
          if (state is PublishInitState) {
            // isOperationExecuted = false;
            // PublishBloc.imageGalleryList.clear(); // قم بتفريغ القائمة عند بدء التطبيق
            context.read<PublishBloc>().add(ImageCategoryListRequestEvent(
                categoryName: "", limit: 3, skip: 0));
          }
          if (state is ImageCategoryGetFirstListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            if (PublishBloc.homeImageGrid.length == 0) {
              return SizedBox();

            } else {
              return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MyAnimatedRoute(page: ImageGallery()));
                  },
                  child: Text("معرض الصور",style: normalTextStyle(color: primaryColor,fontSize: 15),)),
              Container(
                height: 200,
                child: ListView.separated(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        Container(
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),                    width: SizeConfig.screenWidth!-SizeConfig.screenWidth!/5,
                          // width: 50,
                          // height: 20,
                          child: Image.network("${AppConst.imgUrl}${PublishBloc.homeImageGrid[index]["img_url"]}",fit: BoxFit.cover),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(width: 20,),
                    itemCount: PublishBloc.homeImageGrid.length<3 ?PublishBloc.homeImageGrid.length :3),
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
