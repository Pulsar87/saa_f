import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/router/animation_route.dart';
import '../../data/repository/publish_repo.dart';
import '../../domain/bloc/publish-bloc.dart';
import '../../domain/bloc/publish-event.dart';
import '../../domain/bloc/publish-state.dart';
import '../widgets/image-list/category-items-list.dart';
import '../widgets/post/post-item.dart';
import '../widgets/post/post-list-category-list.dart';
import 'article/user-add-article/add-post.dart';
List post = [];

class PostList extends StatelessWidget {
  PostList({super.key});
  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());
  int skip = 0;
  int limit = 10;
  bool isLoadMore = false;
  String cate = "";
  ScrollController postScrollController = ScrollController();
  bool isOperationExecuted = false; // Variable to track if the operation is already executed

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isOperationExecuted = false; // Reset the flag when the new frame is rendered
    });

    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
              if (state is PostListChangeCategoryState) {
                isOperationExecuted = false;
                skip = 0;
                post.clear();
                print("list is empity");
              }
              if (state is PostGetListSuccessState){
                cate = state.category;
                print("cate $cate");
                if (state.postList.photos.isEmpty) {
                  print("stop listiner");
                  isOperationExecuted = true;
                }
                if (!isOperationExecuted) {
                  post.addAll(state.postList.photos);
                  print("photo.length");
                  print(post.length);
                  postScrollController.addListener(() {
                    if (!isOperationExecuted &&
                        postScrollController.position.pixels ==
                            postScrollController.position.maxScrollExtent) {
                      print("max");
                      skip = skip + limit;

                      context.read<PublishBloc>().add(
                          PostListRequestEvent(
                              categoryName: cate, limit: limit, skip: skip));
                    }
                  });
                }
              }
            },

            child: BlocBuilder<PublishBloc, PublishState>(
                builder: (context, state) {
                  if(state is PublishInitState || state is PublishRefreshState ) {
                    post.clear();
                    print("state is $state");
                    print("PublishInitState");
                    context
                        .read<PublishBloc>()
                        .add(PostListRequestEvent(categoryName: cate,limit: limit,skip: 0));
                  }
                  return SafeArea(
                    child: Scaffold(
                      // floatingActionButton: FloatingActionButton(
                      //   onPressed: (){
                      //     Navigator.of(context).push(MyAnimatedRoute(page: AddPost()));
                      //
                      //   },
                      //   child: Icon(Icons.add),
                      // ),
                      appBar: AppBar(
                        title: Text ("المنشورات"),
                        leading: IconButton(icon: Icon( Icons.add_card),
                        onPressed: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: AddPost()));
                        }
                        ),
                      ),
                      body:
                      Container(
                        margin:  EdgeInsets.all(10),
                        child:
                        state is ImageCategoryGetListErrorState ?
                        Center(child: Text (
                          "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: normalTextStyle(),),)
                            :
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PostListCategoryList(selectedCategory: cate,),
                            cate != "" ?
                            TextButton(
                                onPressed: (){
                                  isOperationExecuted = false;
                                  post.clear();
                                  skip =0;
                                  context
                                      .read<PublishBloc>()
                                      .add(PostListRequestEvent(categoryName: "",limit: limit,skip: 0));

                                                                 },
                                child: Text ("عودة لكل المنشورات",
                                  style: normalTextStyle( fontSize: 15),)):
                            SizedBox(),
                            state is PostGetFirstListLoadingState ?
                            Expanded(child: const Center(child: MyLoadingScreen()))
                                :
                            post.length==0?
                            Expanded(child: Center(child: Text("عذراً.. لا يوجد منشورات من هذا التصنيف حالياً.", style: normalTextStyle()),
                            ),)
                                :
                            Expanded(
                              child: ListView.separated(
                                controller: postScrollController,
                                shrinkWrap: true,
                                // physics: BouncingScrollPhysics(),
                                // physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context , index) => const SizedBox(height: 20,),
                                itemCount: isLoadMore ? post.length  +1 : post.length  ,
                                itemBuilder: (context, index) =>
                                isLoadMore?
                                Center(child: CircularProgressIndicator())
                                    :
                                PostItem(
                                  id: post [index]['id'],
                                  articleText : post [index] ['text_content']??"null",
                                  htmlArticle: post [index] ['html_article']??"null",
                                  typeModel: post [index]["typeModel"],
                                  videoUrl: post[index]['video_url'],
                                  selectedCategory: cate,
                                  description: post[index]['description']??"null",
                                  userPhoto: post [index]['profile_img'] ??null,
                                  imageUrl: post[index]['img_url'] ?? post[index]['article_img_url'],
                                  userName: post [index]['name']?? post [index]['user_name'],
                                  date: post [index]['updated_at'],
                                  time: post [index]['updated_at_relative'],
                                  photographerName: post [index]['photographer_name'] ?? "null",
                                  category: post [index]['Media_Category']?? post [index]['article_category'],
                                  isLike: post [index]['like'],
                                  likesCount: post [index]['likes_count'],
                                ),
                              ),
                            )
                            // ImageShowGrid(photo: state.imageListModel.photos,)
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





