import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/publish/presentation/widgets/post/post-list-category-list-item.dart';
import 'package:saa_f/features/publish/presentation/widgets/post/video-post-description.dart';
import 'package:saa_f/features/publish/presentation/widgets/post/video-post-like.dart';
import '../../../../../core/components/app_componant/image_componant.dart';
import '../../../../../core/constant/app-const.dart';
import '../article/article-post-like.dart';
import '../article/article-post-text.dart';
import 'post-time.dart';
import 'post-user-info.dart';
import 'image-post-description.dart';
import '../show-video.dart';
import 'image-post-like.dart';
import 'image-post-photo.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key, required this.description, required this.userName, required this.userPhoto, required this.photographerName, required this.time, required this.date, required this.category,  this.selectedCategory = "", required this.id, required this.isLike, required this.likesCount, this.videoUrl, this.imageUrl, required this.typeModel, required this.articleText, required this.htmlArticle,
  });
  final String typeModel;
  final String description;
  final String userName;
  final  userPhoto;
  final imageUrl;
  final videoUrl;
  final String photographerName;
  final String time;
  final String date;
  final String category;
  final String selectedCategory;
  final int id;
  final bool isLike;
  final int likesCount;
  final String articleText;
  final String htmlArticle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: PostUserInfo(userName: userName, userPhoto: userPhoto,)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    PostListCategoryListItem(categoryName:category , selectedCategory: selectedCategory,),
                  ],
                ),
              ) ,
            ],
          ),


          typeModel == "image"?
              Column(children: [
                ImageComponant (imageUrl: imageUrl,),
                // Image(image: NetworkImage("${AppConst.imgUrl}${imageUrl}"),
                //     errorBuilder: (context, error, stackTrace) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text('Failed to load', style: normalTextStyle(),),
                //       );
                //     }
                // ),
                  //   errorBuilder: (context, error, stackTrace) {
                  //     return Text('Failed to load image');
                  //   },
                  //
                  // )),
                // FutureBuilder<File>(
                //     key: ValueKey(imageUrl), // or use UniqueKey()
                //   // ...
                //     )

                // CachedNetworkImage(
                //   imageUrl: "${AppConst.imgUrl}${imageUrl}",
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),

              //   Image.network("${AppConst.imgUrl}${imageUrl}"),
              //   // Image.network("${AppConst.imgUrl}${imageUrl}"),
              // Shimmer.fromColors(
              // baseColor: Colors.grey[300]!,
              //   highlightColor: Colors.grey[100]!,
              //   child: Container(
              //     width: 100.0,
              //     height: 100.0,
              //     color: Colors.white, // You can set a background color while shimmering
              //     child: Image.network(
              //       imageUrl,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
                // Shimmer.fromColors(
                //   baseColor: Colors.grey[300]!,
                //   highlightColor: Colors.grey[100]!,
                //   child: Image.network("${AppConst.imgUrl}${imageUrl}"),
                //
                //   // CachedNetworkImage(
                //   //     imageUrl: "${AppConst.imgUrl}${imageUrl}",
                //   //     placeholder: (context, url) => Container(
                //   //       width: 100.0,
                //   //       height: 100.0,
                //   //       color: Colors.white, // You can set a background color while shimmering
                //   //     ),
                //       // errorWidget: (context,url)=> Container(height: 20,color: Colors.red,)
                //
                //   // ),
                // ),
        //         CachedNetworkImage(
        //   imageUrl: AppConst.imgUrl+imageUrl,
        //   placeholder: (context, url) => CircularProgressIndicator(),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        // ),
                // Center(child: Image(image: NetworkImage("${AppConst.imgUrl}${imageUrl}"),
                //   errorBuilder: (context, error, stackTrace) {
                //     return Text('Failed to load image');
                //   },
                //
                // )),
                // ImagePostDescription(description : description, photographerName: photographerName),
                ImagePostLike (id :id,likesCount: likesCount,isLike: isLike),
                PostTime(time: time,date: date),

              ],
              )
              :
          typeModel == "video"?
              Column(
                children: [
                  ShowVideo(videoUrl: videoUrl , autoPlay: false , showVideoProgressIndicator: false),
                  VideoPostDescription(description : description),
                  VideoPostLike (id :id,likesCount: likesCount,isLike: isLike),
                  PostTime(time: time,date: date),

                ],
              )
              :
          typeModel == "text_article"?
              Column(
                children: [
                  ImageComponant (imageUrl: imageUrl,),
                  ArticlePostText(articleText: articleText),
                  ArticlePostLike (id :id,likesCount: likesCount,isLike: isLike),
                  PostTime(time: time,date: date),

                ],
              )
              :
          typeModel == "html_article"?

          Column(
            children: [
              Center(child: Image(image: NetworkImage("${AppConst.imgUrl}${imageUrl}"))),

              ArticlePostText(articleText: htmlArticle),
              ArticlePostLike (id :id,likesCount: likesCount,isLike: isLike),
              PostTime(time: "time",date: "date"),

            ],
          )
              :
              SizedBox()



        ],
      ),

    );
  }
}




