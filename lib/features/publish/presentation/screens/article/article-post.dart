// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:saa_project/core/constant/colors/light-colors.dart';
// import 'package:saa_project/features/article/presntaiton/widgets/article-post-text.dart';
// import '../../../../core/constant/assets-const.dart';
// import '../../../publish/data/repository/team_repo.dart';
// import '../../../publish/domain/bloc/teams-bloc.dart';
// import '../../../publish/domain/bloc/teams-state.dart';
// import '../../../publish/presentation/widgets/post/post-list-category-list-item.dart';
// import '../../../publish/presentation/widgets/post/post-list-category-list.dart';
// import '../../../publish/presentation/widgets/post/post-time.dart';
// import '../../../publish/presentation/widgets/post/post-user-info.dart';
// import '../widgets/article-category-list-item.dart';
// import '../widgets/article-list-item.dart';
// import '../widgets/article-post-like.dart';
//
// class ArticlePost extends StatelessWidget {
//   final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());
//   int skip = 0;
//   int limit = 10;
//   bool isLoadMore = false;
//   String cate = "";
//   ScrollController postScrollController = ScrollController();
//   bool isOperationExecuted = false; // Variable to track if the operation is already executed
//
//
//   @override
//   Widget build(BuildContext context) {
//     String originalText = "state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!state.imageInfoModel.data!.description!";
//     // String displayText = showFullText ? originalText : originalText.substring(0, 200) + "...";
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: BlocProvider(
//           create: (BuildContext context) => publishBloc,
//           child: BlocListener<PublishBloc, PublishState>(
//               listener: (context, state) {
//                 // if (state is ImageInfoPublishSuccessState) {
//                 //   localCategory =  selectedDropdownItem !="start"? selectedDropdownItem : state.imageInfoModel.data!.mediaCategory!;
//                 // }
//                 // else if (state is ImageInfoPublishAcceptSuccessState) {
//                 //   publishSuccessMethod(state, context, "تم نشر الصورة", "Success",publishRequestsPath);
//                 // }
//                 // else if (state is ImageInfoPublishRefuseSuccessState) {
//                 //   publishSuccessMethod(state, context, "تم رفض الصورة", "تم",
//                 //       publishRequestsPath);
//                 // }
//                 // else if (state is ImageInfoPublishErrorState || state is ImageInfoPublishAcceptErrorState) {
//                 //   publishErrorCoolAlert(state, context, "الرجاء المحاولة لاحقاً", "حصل خطأ ما");
//                 // }
//               },
//               child: BlocBuilder<PublishBloc, PublishState>(
//                   builder: (context, state) {
//                     // if(state is PublishInitState ) {
//                     //   context
//                     //       .read<PublishBloc>()
//                     //       .add(ArticleInfoPublishRequestsEvent(id: widget.id));
//                     // }
//
//                     return SafeArea(
//                         child: Scaffold(
//                           appBar: AppBar(title: Text ("المنشورات"),),
//                           body:
//                           Container(
//                               margin:  EdgeInsets.all(10),
//                               child:
//                               // state is ImageCategoryGetListErrorState ?
//                               // Center(child: Text (
//                               //   "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: Theme.of(context).textTheme.titleMedium,),)
//                               //     :
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   PostListCategoryList(selectedCategory: cate,),
//                                   cate != "" ?
//                                   TextButton(
//                                       onPressed: (){
//                                         isOperationExecuted = false;
//                                         PublishBloc.articleList.clear();
//                                         skip =0;
//                                         // context
//                                         //     .read<PublishBloc>()
//                                         //     .add(PostListRequestEvent(categoryName: "",limit: limit,skip: skip));
//                                       },
//                                       child: Text ("عودة لكل المنشورات",
//                                         style: Theme.of(context).textTheme.labelMedium,)):
//                                   SizedBox(),
//                                   // state is PostGetFirstListLoadingState ?
//                                   // Expanded(child: const Center(child: CircularProgressIndicator()))
//                                   //     :
//                                   // PublishBloc.articleList.length==0?
//                                   // Expanded(child: Center(child: Text("عذراً.. لا يوجد منشورات من هذا التصنيف حالياً.", style: Theme.of(context).textTheme.bodySmall,),
//                                   // ),)
//                                   //     :
//                                   Expanded(
//                                     child: ListView.separated(
//                                       controller: postScrollController,
//                                       shrinkWrap: true,
//                                       // physics: BouncingScrollPhysics(),
//                                       // physics: const NeverScrollableScrollPhysics(),
//                                       separatorBuilder: (context , index) => const SizedBox(height: 20,),
//                                       itemCount: 20,
//                                       // itemCount: isLoadMore ? PublishBloc.articleList.length  +1 : PublishBloc.articleList.length  ,
//                                       itemBuilder: (context, index) =>
//                                       isLoadMore?
//                                       Center(child: CircularProgressIndicator())
//                                           :
//                                       ArticleListItem(originalText: originalText),
//
//
//                                     ),
//                                   )
//                                   // ImageShowGrid(photo: state.imageListModel.photos,)
//                                 ],
//                               ),
//                     ),
//                     )
//                     );
//                   }
//               )
//           )
//       ),
//     );
//
//   }
// }
//
//
