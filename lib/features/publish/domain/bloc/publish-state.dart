import '../models/article_info_model.dart';
import '../models/article_list_model.dart';
import '../models/image_info_model.dart';
import '../models/image_list_model.dart';
import '../models/video_info_model.dart';
import '../models/video_list_model.dart';

abstract class PublishState {}

class PublishInitState extends PublishState {}
class PublishRefreshState extends PublishState {}

//insert image
class InsertImageLoadingState extends PublishState {}
class InsertImageErrorState extends PublishState {
  final String error;
  InsertImageErrorState(this.error);
}
class InsertImageSuccessState extends PublishState {}
class InsertImageChangItemState extends PublishState {}
class InsertImagePickPhotoState extends PublishState {}

//insert video
class InsertVideoLoadingState extends PublishState {}
class InsertVideoErrorState extends PublishState {
  final String error;
  InsertVideoErrorState(this.error);
}
class InsertVideoSuccessState extends PublishState {}
class InsertVideoChangItemState extends PublishState {}

//image publish request list
class ShowImagePublishRequestsLoadingState extends PublishState {}
class ShowImagePublishRequestsSuccessState extends PublishState {
  final ImageListModel imageRequestListModel;
  ShowImagePublishRequestsSuccessState({required this.imageRequestListModel});
}
class ShowImagePublishRequestsErrorState extends PublishState {
  final String error;
  ShowImagePublishRequestsErrorState({required this.error});
}

//video publish request list
class ShowVideoPublishRequestsLoadingState extends PublishState {}
class ShowVideoPublishRequestsSuccessState extends PublishState {
  final VideoListModel videoListModel;
  ShowVideoPublishRequestsSuccessState({required this.videoListModel});
}
class ShowVideoPublishRequestsErrorState extends PublishState {
  final String error;
  ShowVideoPublishRequestsErrorState({required this.error});
}

//image info to publish
class ImageInfoPublishLoadingState extends PublishState {}
class ImageInfoPublishSuccessState extends PublishState {
  final ImageInfoModel imageInfoModel;
  ImageInfoPublishSuccessState({required this.imageInfoModel});
}
class ImageInfoPublishErrorState extends PublishState {
  final String error;
  ImageInfoPublishErrorState({required this.error});
}
      //image accept publish
class ImageInfoPublishAcceptState extends PublishState {}
class ImageInfoPublishAcceptLoadingState extends PublishState {}
class ImageInfoPublishAcceptSuccessState extends PublishState {}
class ImageInfoPublishAcceptErrorState extends PublishState {
  final String error;
  ImageInfoPublishAcceptErrorState(this.error);
}
      //image refuse publish
class ImageInfoPublishRefuseState extends PublishState {}
class ImageInfoPublishRefuseLoadingState extends PublishState {}
class ImageInfoPublishRefuseSuccessState extends PublishState {}
class ImageInfoPublishRefuseErrorState extends PublishState {
  final String error;
  ImageInfoPublishRefuseErrorState(this.error);
}

//vide info to publish
class VideoInfoPublishLoadingState extends PublishState {}
class VideoInfoPublishSuccessState extends PublishState {
  final VideoInfoModel videoInfoModel ;
  VideoInfoPublishSuccessState({required this.videoInfoModel});
}
class VideoInfoPublishErrorState extends PublishState {
  final String error;
  VideoInfoPublishErrorState({required this.error});
}
    //video accept publish
class VideoInfoPublishAcceptState extends PublishState {}
class VideoInfoPublishAcceptLoadingState extends PublishState {}
class VideoInfoPublishAcceptSuccessState extends PublishState {}
class VideoInfoPublishAcceptErrorState extends PublishState {
  final String error;
  VideoInfoPublishAcceptErrorState(this.error);
}
    //video refuse publish
class VideoInfoPublishRefuseState extends PublishState {}
class VideoInfoPublishRefuseSuccessState extends PublishState {}
class VideoInfoPublishRefuseLoadingState extends PublishState {}
class VideoInfoPublishRefuseErrorState extends PublishState {
  final String error;
  VideoInfoPublishRefuseErrorState(this.error);
}

//gallery image category list
class ImageCategoryGetListLoadingState extends PublishState {}
class ImageCategoryGetFirstListLoadingState extends PublishState {}
class ImageCategoryGetListSuccessState extends PublishState {
  final ImageListModel imageListModel;
  final String category;
  ImageCategoryGetListSuccessState({required this.imageListModel, required this.category});
}
class ImageCategoryGetListErrorState extends PublishState {
  final String error;
  ImageCategoryGetListErrorState(this.error);
}
class ImageListChangeCategoryState extends PublishState{}

//gallery video category list
class VideoCategoryGetListLoadingState extends PublishState {}
class VideoCategoryGetFirstListLoadingState extends PublishState {}
class VideoCategoryGetListSuccessState extends PublishState {
  final VideoListModel videoListModel ;
  final String category;

  VideoCategoryGetListSuccessState({required this.videoListModel, required this.category});
}
class VideoCategoryGetListErrorState extends PublishState {
  final String error;
  VideoCategoryGetListErrorState(this.error);
}
class VideoListChangeCategoryState extends PublishState{}

//post list
class PostGetListLoadingState extends PublishState {}
class PostGetFirstListLoadingState extends PublishState {}
class PostGetListSuccessState extends PublishState {
  final ImageListModel postList;
  final String category;
  PostGetListSuccessState({required this.postList, required this.category});
}
class PostGetListErrorState extends PublishState {
  final String error;
  PostGetListErrorState(this.error);
}
class PostListChangeCategoryState extends PublishState{}

//image show info
class ImageShowInfoLoadingState extends PublishState {}
class ImageShowInfoSuccessState extends PublishState {
  final ImageInfoModel imageInfoModel;
  ImageShowInfoSuccessState({required this.imageInfoModel});
}
class ImageShowInfoErrorState extends PublishState {
  final String error;
  ImageShowInfoErrorState({required this.error});
}

//video show info
class VideoShowInfoLoadingState extends PublishState {}
class VideoShowInfoSuccessState extends PublishState {
  final VideoInfoModel videoInfoModel;
  VideoShowInfoSuccessState({required this.videoInfoModel});
}
class VideoShowInfoErrorState extends PublishState {
  final String error;
  VideoShowInfoErrorState({required this.error});
}

//image like
class ImageLikeLoadingState extends PublishState{}
class ImageLikeSuccessState extends PublishState{}
class ImageLikeErrorState extends PublishState {
  final String error;
  ImageLikeErrorState({required this.error});
}

//video like
class VideoLikeLoadingState extends PublishState{}
class VideoLikeSuccessState extends PublishState{}
class VideoLikeErrorState extends PublishState {
  final String error;
  VideoLikeErrorState({required this.error});
}

//____________ Article _________________
class InsertArticleWithPhotoLoadingState extends PublishState {}
class InsertArticleWithPhotoErrorState extends PublishState {
  final String error;
  InsertArticleWithPhotoErrorState(this.error);
}
class InsertArticleWithPhotoSuccessState extends PublishState {}
class InsertArticleChangItemState extends PublishState {}
class InsertArticlePickPhotoState extends PublishState {}
 //html article
class InsertArticleHtmlLoadingState extends PublishState {}
class InsertArticleHtmlErrorState extends PublishState {
  final String error;
  InsertArticleHtmlErrorState(this.error);
}
class InsertArticleHtmlSuccessState extends PublishState {}


//article info to publish
class ArticleInfoPublishLoadingState extends PublishState {}
class ArticleInfoPublishSuccessState extends PublishState {
  final ArticleInfoModel articleInfoModel ;
  ArticleInfoPublishSuccessState({required this.articleInfoModel});
}
class ArticleInfoPublishErrorState extends PublishState {
  final String error;
  ArticleInfoPublishErrorState({required this.error});
}
//article accept publish
class ArticleInfoPublishAcceptState extends PublishState {}
class ArticleInfoPublishAcceptLoadingState extends PublishState {}
class ArticleInfoPublishAcceptSuccessState extends PublishState {}
class ArticleInfoPublishAcceptErrorState extends PublishState {
  final String error;
  ArticleInfoPublishAcceptErrorState(this.error);
}
//article refuse publish
class ArticleInfoPublishRefuseState extends PublishState {}
class ArticleInfoPublishRefuseSuccessState extends PublishState {}
class ArticleInfoPublishRefuseLoadingState extends PublishState {}
class ArticleInfoPublishRefuseErrorState extends PublishState {
  final String error;
  ArticleInfoPublishRefuseErrorState(this.error);
}


// publish request list
class ShowArticlePublishRequestsLoadingState extends PublishState {}
class ShowArticlePublishRequestsSuccessState extends PublishState {
  final ArticleListModel articleRequestListModel;
  ShowArticlePublishRequestsSuccessState({required this.articleRequestListModel});
}
class ShowArticlePublishRequestsErrorState extends PublishState {
  final String error;
  ShowArticlePublishRequestsErrorState({required this.error});
}

//like
class ArticleLikeLoadingState extends PublishState{}
class ArticleLikeSuccessState extends PublishState{}
class ArticleLikeErrorState extends PublishState {
  final String error;
  ArticleLikeErrorState({required this.error});
}


//info
class ArticleShowInfoLoadingState extends PublishState {}
class ArticleShowInfoSuccessState extends PublishState {
  final ArticleInfoModel articleInfoModel;
  ArticleShowInfoSuccessState({required this.articleInfoModel});
}
class ArticleShowInfoErrorState extends PublishState {
  final String error;
  ArticleShowInfoErrorState({required this.error});
}
