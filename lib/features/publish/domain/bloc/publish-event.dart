import 'dart:io';

abstract class PublishEvent {}
class PublishRefreshEvent extends PublishEvent{}
//insert image
class  InsertImagePickPhotoEvent extends PublishEvent {}
class InsertImageChangItemEvent extends PublishEvent {}
class InsertImageRequestEvent extends PublishEvent {
  final File img_;
  final String description;
  final String mediaCategory;
  final String photographerName;
  final String title;
  InsertImageRequestEvent({required this.img_, required this.description, required this.mediaCategory,
    required  this.photographerName, required this.title});
}

//insert video
class InsertVideoChangItemEvent extends PublishEvent {}
class InsertVideoRequestEvent extends PublishEvent {
  final String description;
  final String mediaCategory;
  final String viedoUrl;
  final String title;
  InsertVideoRequestEvent({required this. title, required this.viedoUrl, required this.description, required this.mediaCategory,});
}

//image publish request list
class ShowImagePublishRequestsEvent extends PublishEvent {}

//video publish request list
class ShowVideoPublishRequestsEvent extends PublishEvent {}

//image info to publish
class ImageInfoPublishRequestsEvent extends PublishEvent {
  final int id;
  ImageInfoPublishRequestsEvent({required this.id});
}
  //image accept publish
class ImageInfoPublishAcceptEvent extends PublishEvent {
  final int id;
  final String category;
  final String description;
  ImageInfoPublishAcceptEvent({required this.id, required this.category,required this.description});}
  //image refuse publish
class ImageInfoPublishRefuseEvent extends PublishEvent {
  final int id;
  ImageInfoPublishRefuseEvent(this.id);
}

//vide info to publish
class VideoInfoPublishRequestsEvent extends PublishEvent {
  final int id;
  VideoInfoPublishRequestsEvent({required this.id});
}
  //video accept publish
class VideoInfoPublishAcceptEvent extends PublishEvent {
  final int id;
  final String category;
  final String description;
  VideoInfoPublishAcceptEvent({required this.id, required this.category,required this.description});}
    //video refuse publish
class VideoInfoPublishRefuseEvent extends PublishEvent {
  final int id;
  VideoInfoPublishRefuseEvent(this.id);
}

//gallery image category list
class ImageCategoryListRequestEvent extends PublishEvent{
  final String categoryName;
  final int limit;
  final int skip;
  ImageCategoryListRequestEvent({required this.categoryName, required this.limit, required this.skip});
}
class ImageListChangeCategoryEvent extends PublishEvent{}

//gallery video category list
class VideoCategoryListRequestEvent extends PublishEvent{
  final String categoryName;
  final int limit;
  final int skip;
  VideoCategoryListRequestEvent({required this.categoryName, required this.limit, required this.skip});
}
class VideoListChangeCategoryEvent extends PublishEvent{}

//post list
class PostListRequestEvent extends PublishEvent{
  final String categoryName;
  final int limit;
  final int skip;
  PostListRequestEvent({required this.categoryName, required this.limit, required this.skip});
}
class PostListChangeCategoryEvent extends PublishEvent{}

//image show info
class ImageShowInfoGetInfoEvent extends PublishEvent{
  final int id;
  ImageShowInfoGetInfoEvent({required this.id});
}

//video show info
class VideoShowInfoGetInfoEvent extends PublishEvent{
  final int id;
  VideoShowInfoGetInfoEvent({required this.id});
}

//image like
class ImageLikeEvent extends PublishEvent{
  final int imageID;
  ImageLikeEvent({required this.imageID});
}

//video like
class VideoLikeEvent extends PublishEvent{
  final int videoID;
  VideoLikeEvent({required this.videoID});
}

//____________ Article _________________
class  InsertArticlePickPhotoEvent extends PublishEvent {}
class  InsertArticleChangItemEvent extends PublishEvent {}
// class  InsertArticleRequestEvent extends PublishEvent {}
class InsertArticleWithPhotoRequestEvent extends PublishEvent {
  final File img_;
  final String title;
  final String article;
  final String mediaCategory;
  final String articleWriter;
  InsertArticleWithPhotoRequestEvent({required this.img_, required this.article, required this.articleWriter, required this.mediaCategory, required this.title});
}
class InsertArticleHtmlRequestEvent extends PublishEvent {
  final File img_;
  final String title;
  final String article;
  final String mediaCategory;
  final String articleWriter;

  InsertArticleHtmlRequestEvent({required this.img_,required this.articleWriter, required this.article, required this.mediaCategory, required this.title});
}
class ShowArticlePublishRequestsEvent extends PublishEvent {}
class ArticleInfoPublishRequestsEvent extends PublishEvent {
  final int id;
  ArticleInfoPublishRequestsEvent({required this.id});
}
class ArticleAcceptEvent extends PublishEvent {
  final int id;
  final String category;
  ArticleAcceptEvent({required this.id, required this.category});}
class ArticleRefuseEvent extends PublishEvent {
  final int id;
  ArticleRefuseEvent(this.id);
}
//info + like
class ArticleShowInfoGetInfoEvent extends PublishEvent{
  final int id;
  ArticleShowInfoGetInfoEvent({required this.id});
}
class ArticleLikeEvent extends PublishEvent{
  final int articleID;
  ArticleLikeEvent({required this.articleID});
}
class ArticleListChangeCategoryEvent extends PublishEvent{}
class ArticleListRequestEvent extends PublishEvent{
  final String categoryName;
  final int limit;
  final int skip;
  ArticleListRequestEvent({required this.categoryName, required this.limit, required this.skip});
}
