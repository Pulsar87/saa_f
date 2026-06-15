import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/router/router_name.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../widgets/admin-publish/post-info-publish-date.dart';
import '../../widgets/admin-publish/show-image-publish-request/image-info-publish-photo.dart';
import '../../widgets/article/admin-article-request/article-info-publish-button-row.dart';
import '../../widgets/category-item.dart';
import '../../widgets/post/post-user-info.dart';
import '../../widgets/publish-method.dart';
import '../../widgets/article/article-post-description.dart';

class ArticleInfoPublish extends StatefulWidget {
  ArticleInfoPublish({super.key, required this.id, required this.title});

  final int id;
  final String title;

  @override
  State<ArticleInfoPublish> createState() => _ArticleInfoPublishState();
}

class _ArticleInfoPublishState extends State<ArticleInfoPublish> {
   final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

   var formKey = GlobalKey<FormState>();

   var localCategory ;

   var selectedDropdownItem = "start" ;
   String img = "";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
          create: (BuildContext context) => publishBloc,
          child: BlocListener<PublishBloc, PublishState>(
              listener: (context, state) {
                if (state is ArticleInfoPublishSuccessState) {
                  localCategory =  selectedDropdownItem !="start"? selectedDropdownItem : state.articleInfoModel.data!.articleCategory!;
                  img = state.articleInfoModel.data!.articleImgUrl!;
                }
                else if (state is ArticleInfoPublishAcceptSuccessState) {
                  publishSuccessMethod(state, context, "تم نشر المقال", "Success","pop");
                }
                else if (state is ArticleInfoPublishRefuseSuccessState) {
                  publishSuccessMethod(state, context, "تم رفض المقال", "تم",
                      "pop");
                }
                else if (state is ArticleInfoPublishErrorState || state is ArticleInfoPublishAcceptErrorState || state is ArticleInfoPublishRefuseErrorState) {
                  publishErrorCoolAlert(state, context, StringConst.somethingWrong, "حصل خطأ ما");
                }
              },
              child: BlocBuilder<PublishBloc, PublishState>(
                  builder: (context, state) {
                    if(state is PublishInitState ) {
                      context
                          .read<PublishBloc>()
                          .add(ArticleInfoPublishRequestsEvent(id: widget.id));
                    }
                    return SafeArea(
                      child: Scaffold(
                        appBar: AppBar(title: Text (widget.title),),
                        body:
                        state is ArticleInfoPublishLoadingState || state is ArticleInfoPublishAcceptLoadingState ||  state is ArticleInfoPublishRefuseLoadingState?
                        const Center(child: CircularProgressIndicator())
                            :
                        state is ArticleInfoPublishSuccessState ?
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                           child:   Column(
                             children: [
                               PostUserInfo(userName: state.articleInfoModel.data!.userName!, userPhoto: state.articleInfoModel.data?.userProfileImg?? null),
                               ImageInfoPublishPhoto (img: state.articleInfoModel.data!.articleImgUrl!),
                               ArticlePostDescription(description: state.articleInfoModel.data!.htmlArticle??state.articleInfoModel.data!.textArticle!,writerName: state.articleInfoModel.data!.writerName??"null"),
                               SizedBox(height: SizeConfig.screenHeight!/40,),
                               // choseCategory function
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("التصنيف", style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis,
                                     ),),
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
                               PostInfoPublishDate(date: state.articleInfoModel.data!.createdAt!, time: state.articleInfoModel.data!.createdAtRelative!),
                               ArticleInfoPublishButtonRow(
                                 id: widget.id,
                                 category: selectedDropdownItem !="start"? selectedDropdownItem : state.articleInfoModel.data!.articleCategory!,
                                 description: state.articleInfoModel.data!.htmlArticle??state.articleInfoModel.data!.textArticle!,),
                             ],
                           )                          ),
                        )
                            :
                        state is ArticleInfoPublishErrorState || state is ArticleInfoPublishAcceptErrorState || state is ArticleInfoPublishRefuseErrorState ?
                    Center(child: Text (
                      "عذراً حصل خطأ ما\n"
                          "الرجاء المحاولة لاحقاً ",
                      style: normalTextStyle(),
                    ),)
                        :
                    SizedBox(),
                      ),
                    );
                  }
              )
          )
      ),
    );
  }


}
