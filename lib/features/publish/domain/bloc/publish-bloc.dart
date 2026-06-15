
import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/publish/domain/bloc/publish-event.dart';
import 'package:saa_f/features/publish/domain/bloc/publish-state.dart';
import '../../data/repository/publish_repo.dart';

class PublishBloc extends Bloc<PublishEvent,PublishState> {
  static List imageGalleryList = [];
  static List homeImageGrid = [];
  static List homeVideoGrid = [];
  static String imageGalleryCategory = "";

  static List videoGalleryList = [];
  static String videoGalleryCategory = "";

  static List articleList = [];
  static String articleCategory = "";

  final PublishRepo publishRepo;

  PublishBloc({required this.publishRepo }) : super (PublishInitState()) {
    on<PublishRefreshEvent> (_refresh);
    //insert image
    on <InsertImagePickPhotoEvent>(_showPhoto);
    on <InsertImageChangItemEvent>(_changItemImageMethod);
    on<InsertImageRequestEvent>(_sendImageRequest);
    //insert video
    on <InsertVideoChangItemEvent>(_changItemViedoMethod);
    on<InsertVideoRequestEvent>(_sendViedoRequest);
    //image publish request list
    on<ShowImagePublishRequestsEvent>(_getImagePublishRequestsList);
    //video publish request list
    on<ShowVideoPublishRequestsEvent>(_getVideoPublishRequestsList);
    //image info to publish
    on<ImageInfoPublishRequestsEvent>(_getImagePublishInfo);
    //image accept publish
    on<ImageInfoPublishAcceptEvent>(_acceptImage);
    //image refuse publish
    on<ImageInfoPublishRefuseEvent>(_refuseImage);
    //vide info to publish
    on<VideoInfoPublishRequestsEvent>(_getVideoPublishInfo);
    //video accept publish
    on<VideoInfoPublishAcceptEvent>(_acceptVideo);
    //video refuse publish
    on<VideoInfoPublishRefuseEvent>(_refuseVideo);
    //gallery image category list
    on<ImageCategoryListRequestEvent>(_getImageList);
    //gallery image category list
    on<ImageListChangeCategoryEvent>(_changeImageCategory);
    //gallery video category list
    on <VideoCategoryListRequestEvent>(_getVideoList);
    //gallery video category list
    on<VideoListChangeCategoryEvent>(_changeVideoCategory);
    //post list
    on<PostListRequestEvent>(_getPostList);
    //post list
    on<PostListChangeCategoryEvent>(_changePostCategory);
    //image show info
    on<ImageShowInfoGetInfoEvent>(_getImageInfo);
    //video show info
    on<VideoShowInfoGetInfoEvent>(_getVideoInfo);
    //image like
    on<ImageLikeEvent>(_imageLike);
    //video like
    on<VideoLikeEvent>(_videoLike);

    //article
    on<InsertArticlePickPhotoEvent>(_showPhotoForArticle);
    // on<InsertArticleRequestEvent>(_sendArticleeRequest);
    on <InsertArticleChangItemEvent>(_changItemArticleMethod);
    on<InsertArticleWithPhotoRequestEvent> (_sendArticleWithPhotoRequest);
    on<InsertArticleHtmlRequestEvent> (_sendArticleHtmlRequest);

    //
    on <ShowArticlePublishRequestsEvent> (_getArticlePublishRequestsList);
    on <ArticleLikeEvent> (_articleLike);
    on <ArticleInfoPublishRequestsEvent> (_getArticlePublishInfo);
    on <ArticleAcceptEvent> (_acceptArticle);
    on<ArticleRefuseEvent> (_refuseArticle);
  }

  //insert image
  FutureOr<void> _showPhoto(InsertImagePickPhotoEvent event,
      Emitter<PublishState> emit) {
    print("PublishPickPhotoState");
    emit(InsertImagePickPhotoState());
  }

  //insert image
  FutureOr<void> _changItemImageMethod(InsertImageChangItemEvent event,
      Emitter<PublishState> emit) {
    print("PublishChangItemState");
    emit(InsertImageChangItemState());
  }

  //insert image
  Future<FutureOr<void>> _sendImageRequest(InsertImageRequestEvent event, Emitter<PublishState> emit) async
  {
    emit(InsertImageLoadingState());
    try {
      var response = await publishRepo.insertImage(
          image: event.img_,
          title: event.title,
          description: event.description,
          mediaCategory: event.mediaCategory,
          photographerName: event.photographerName);
      if (response) {
        emit(InsertImageSuccessState());
        print("Insert Success");
      } else {
        emit(InsertImageErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(InsertImageErrorState(e.toString()));
    }
  }

  //insert video
  FutureOr<void> _changItemViedoMethod(InsertVideoChangItemEvent event,
      Emitter<PublishState> emit) {
    print("PublishChangItemState");
    emit(InsertVideoChangItemState());
  }

  //insert video
  Future<FutureOr<void>> _sendViedoRequest(InsertVideoRequestEvent event,
      Emitter<PublishState> emit) async {
    emit(InsertVideoLoadingState());
    try {
      var response = await publishRepo.insertVideo(
          videoUrl: event.viedoUrl,
          description: event.description,
          mediaCategory: event.mediaCategory,
          title: event.title);
      if (response) {
        emit(InsertVideoSuccessState());
        print("Insert Success");
      } else {
        emit(InsertVideoErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(InsertVideoErrorState(e.toString()));
    }
  }

  //image publish request list
  Future<FutureOr<void>> _getImagePublishRequestsList(
      ShowImagePublishRequestsEvent event, Emitter<PublishState> emit) async {
    emit(ShowImagePublishRequestsLoadingState());
    try {
      var response = await publishRepo.showImageRequestList();
      if (response.success) {
        emit(ShowImagePublishRequestsSuccessState(
            imageRequestListModel: response));
        print("Get Image List Success");
      } else {
        emit(ShowImagePublishRequestsErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowImagePublishRequestsErrorState(error: e.toString()));
    }
  }

  //video publish request list
  Future<FutureOr<void>> _getVideoPublishRequestsList(
      ShowVideoPublishRequestsEvent event, Emitter<PublishState> emit) async {
    emit(ShowVideoPublishRequestsLoadingState());
    try {
      var response = await publishRepo.showVideoRequestList();
      if (response.success) {
        emit(ShowVideoPublishRequestsSuccessState(videoListModel: response));
        print("Get Video List Success");
      } else {
        emit(ShowVideoPublishRequestsErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowVideoPublishRequestsErrorState(error: e.toString()));
    }
  }

  //image info to publish
  Future<FutureOr<void>> _getImagePublishInfo(
      ImageInfoPublishRequestsEvent event, Emitter<PublishState> emit) async {
    emit(ImageInfoPublishLoadingState());
    try {
      var response = await publishRepo.getImageInfo(event.id);
      if (response.success) {
        emit(ImageInfoPublishSuccessState(imageInfoModel: response));
        // imageInfoModel = response;
        print("Get Image info Success");
      } else {
        emit(ImageInfoPublishErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageInfoPublishErrorState(error: e.toString()));
    }
  }

  //image accept publish
  Future<FutureOr<void>> _acceptImage(ImageInfoPublishAcceptEvent event,
      Emitter<PublishState> emit) async {
    emit(ImageInfoPublishAcceptLoadingState());
    try {
      var response = await publishRepo.acceptImage(
          id: event.id,
          description: event.description,
          category: event.category
      );
      if (response) {
        emit(ImageInfoPublishAcceptSuccessState());
        print("Done publish the img");
      } else {
        emit(ImageInfoPublishAcceptErrorState(response.body['message']));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageInfoPublishAcceptErrorState(e.toString()));
    }
  }

  //image refuse publish
  FutureOr<void> _refuseImage(ImageInfoPublishRefuseEvent event,
      Emitter<PublishState> emit) async {
    emit(ImageInfoPublishRefuseLoadingState());
    try {
      var response = await publishRepo.refuseImage(
        id: event.id,
      );
      if (response) {
        emit(ImageInfoPublishRefuseSuccessState());
        print("Done refuse the img");
      } else {
        emit(ImageInfoPublishRefuseErrorState(response.body['message']));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageInfoPublishRefuseErrorState(e.toString()));
    }
  }

  //vide info to publish
  Future<FutureOr<void>> _getVideoPublishInfo(
      VideoInfoPublishRequestsEvent event, Emitter<PublishState> emit) async {
    emit(VideoInfoPublishLoadingState());
    try {
      var response = await publishRepo.getVideoInfo(event.id);
      if (response.success) {
        emit(VideoInfoPublishSuccessState(videoInfoModel: response));
        print("Get Viedo info Success");
      } else {
        emit(VideoInfoPublishErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(VideoInfoPublishErrorState(error: e.toString()));
    }
  }

  //video accept publish
  Future<FutureOr<void>> _acceptVideo(VideoInfoPublishAcceptEvent event,
      Emitter<PublishState> emit) async {
    emit(VideoInfoPublishAcceptLoadingState());
    try {
      var response = await publishRepo.acceptVideo(
          id: event.id,
          description: event.description,
          category: event.category
      );
      if (response) {
        emit(VideoInfoPublishAcceptSuccessState());
        print("Done publish the vid");
      } else {
        emit(VideoInfoPublishAcceptErrorState(response.body['message']));
      }
    } catch (e) {
      log(e.toString());
      emit(VideoInfoPublishAcceptErrorState(e.toString()));
    }
  }

  //video refuse publish
  Future<FutureOr<void>> _refuseVideo(VideoInfoPublishRefuseEvent event,
      Emitter<PublishState> emit) async {
    emit(VideoInfoPublishRefuseLoadingState());
    try {
      var response = await publishRepo.refuseVideo(
        id: event.id,
      );
      if (response) {
        emit(VideoInfoPublishRefuseSuccessState());
        print("Done refuse the vid");
      } else {
        emit(VideoInfoPublishRefuseErrorState(response.body['message']));
      }
    } catch (e) {
      log(e.toString());
      emit(VideoInfoPublishRefuseErrorState(e.toString()));
    }
  }

  //gallery image category list
  Future<FutureOr<void>> _getImageList(ImageCategoryListRequestEvent event,
      Emitter<PublishState> emit) async {
    emit(ImageCategoryGetListLoadingState());
    if (event.skip == 0)
      emit(ImageCategoryGetFirstListLoadingState());
    try {
      var response = await publishRepo.showImageList(
          categoryName: event.categoryName,
          skip: event.skip,
          limit: event.limit);
      if (response.success) {
        emit(ImageCategoryGetListSuccessState(
            imageListModel: response, category: event.categoryName));
        print("Yes, Image List Success");
      } else {
        emit(ImageCategoryGetListErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageCategoryGetListErrorState(e.toString()));
    }
  }

  //gallery image category list
  FutureOr<void> _changeImageCategory(ImageListChangeCategoryEvent event,
      Emitter<PublishState> emit) {
    emit(ImageListChangeCategoryState());
  }

  //gallery video category list
  Future<FutureOr<void>> _getVideoList(VideoCategoryListRequestEvent event,
      Emitter<PublishState> emit) async {
    emit(VideoCategoryGetListLoadingState());
    if (event.skip == 0) {
      emit(VideoCategoryGetFirstListLoadingState());
    }
    try {
      var response = await publishRepo.showVideoList(
          categoryName: event.categoryName,
          skip: event.skip,
          limit: event.limit);
      if (response.success) {
        emit(VideoCategoryGetListSuccessState(
            videoListModel: response, category: event.categoryName));
        print("Yes, Video List Success");
      } else {
        emit(VideoCategoryGetListErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageCategoryGetListErrorState(e.toString()));
    }
  }

  //gallery video category list
  FutureOr<void> _changeVideoCategory(VideoListChangeCategoryEvent event,
      Emitter<PublishState> emit) {
    emit(VideoListChangeCategoryState());
  }

  //post list
  Future<FutureOr<void>> _getPostList(PostListRequestEvent event,
      Emitter<PublishState> emit) async {
    emit(PostGetListLoadingState());
    if (event.skip == 0) {
      emit(PostGetFirstListLoadingState());
    }
    try {
      var response = await publishRepo.getPostList(
          categoryName: event.categoryName,
          skip: event.skip,
          limit: event.limit);
      if (response.success) {
        emit(PostGetListSuccessState(
            postList: response, category: event.categoryName));
        print("Yes, post List Success");
      } else {
        emit(PostGetListErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageCategoryGetListErrorState(e.toString()));
    }
  }

  //post list
  FutureOr<void> _changePostCategory(PostListChangeCategoryEvent event,
      Emitter<PublishState> emit) {
    emit(PostListChangeCategoryState());
  }

  //image show info
  Future<FutureOr<void>> _getImageInfo(ImageShowInfoGetInfoEvent event,
      Emitter<PublishState> emit) async {
    emit(ImageShowInfoLoadingState());
    try {
      var response = await publishRepo.getImageInfo(event.id);
      if (response.success) {
        emit(ImageShowInfoSuccessState(imageInfoModel: response));
        // imageInfoModel = response;
        print("Get Image info Success");
      } else {
        emit(ImageShowInfoErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageShowInfoErrorState(error: e.toString()));
    }
  }

  //video show info
  Future<FutureOr<void>> _getVideoInfo(VideoShowInfoGetInfoEvent event,
      Emitter<PublishState> emit) async {
    emit(VideoShowInfoLoadingState());
    try {
      var response = await publishRepo.getVideoInfo(event.id);
      if (response.success) {
        emit(VideoShowInfoSuccessState(videoInfoModel: response));
        // videoInfoModel = response;
        print("Get video info Success");
      } else {
        emit(VideoShowInfoErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(VideoShowInfoErrorState(error: e.toString()));
    }
  }

  //image like
  Future<FutureOr<void>> _imageLike(ImageLikeEvent event,
      Emitter<PublishState> emit) async {
    emit(ImageLikeLoadingState());
    try {
        var response = await publishRepo.imageLike(id: event.imageID);
      if (response) {
        emit(ImageLikeSuccessState());
        print("Image like Success");
      } else {
        emit(ImageLikeErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ImageLikeErrorState(error: e.toString()));
    }
  }

  //video like
  Future<FutureOr<void>> _videoLike(VideoLikeEvent event,
      Emitter<PublishState> emit) async {
    emit(VideoLikeLoadingState());
    try {
      var response = await publishRepo.videoLike(id: event.videoID);
      if (response) {
        emit(VideoLikeSuccessState());
        print("Video like Success");
      } else {
        emit(VideoLikeErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(VideoLikeErrorState(error: e.toString()));
    }
  }


  //article

  FutureOr<void> _showPhotoForArticle(InsertArticlePickPhotoEvent event,
      Emitter<PublishState> emit) {
    print("ArticlePickPhotoState");
    emit(InsertArticlePickPhotoState());
  }

  // FutureOr<void> _sendArticleeRequest(InsertArticleRequestEvent event,
  //     Emitter<PublishState> emit) {
  //   // emit (InsertImageLoadingState());
  //   // try {
  //   //   var response = await publishRepo.insertImage(
  //   //       image: event.img_,
  //   //       title: event.title,
  //   //       description: event.description,
  //   //       mediaCategory: event.mediaCategory,
  //   //       photographerName: event.photographerName);
  //   //   if (response) {
  //   //     emit(InsertImageSuccessState());
  //   //     print("Insert Success");
  //   //   } else {
  //   //     emit(InsertImageErrorState(response.toString()));
  //   //
  //   //   }
  //   // }catch(e){
  //   //   log(e.toString());
  //   //   emit(InsertImageErrorState( e.toString()));
  //   //
  //   //
  //   // }
  // }

  FutureOr<void> _changItemArticleMethod(InsertArticleChangItemEvent event,
      Emitter<PublishState> emit) {
    print("PublishChangItemState");
    emit(InsertArticleChangItemState());
  }


  Future<FutureOr<void>> _sendArticleWithPhotoRequest(InsertArticleWithPhotoRequestEvent event, Emitter<PublishState> emit) async {
      emit(InsertArticleWithPhotoLoadingState());
      print("Insert Article With Photo Loading");
      try {
        var response = await publishRepo.insertArticleNormal(
            image: event.img_,
            title: event.title,
            article: event.article,
            mediaCategory: event.mediaCategory,
            articleWriter : event.articleWriter);
        if (response) {
          emit(InsertArticleWithPhotoSuccessState());
          print("Insert Success");
        } else {
          emit(InsertArticleWithPhotoErrorState(response.toString()));
        }
      } catch (e) {
        log(e.toString());
        emit(InsertArticleWithPhotoErrorState(e.toString()));
      }
    }

  Future<FutureOr<void>> _sendArticleHtmlRequest(InsertArticleHtmlRequestEvent event, Emitter<PublishState> emit) async {
    emit(InsertArticleHtmlLoadingState());
    try {
      var response = await publishRepo.insertArticleHtml(
          image: event.img_,
          title: event.title,
          article: event.article,
          mediaCategory: event.mediaCategory,
          articleWriter : event.articleWriter);
      if (response) {
        emit(InsertArticleHtmlSuccessState());
        print("Insert Success");
      } else {
        emit(InsertArticleHtmlErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(InsertArticleHtmlErrorState(e.toString()));
    }
  }

  Future<FutureOr<void>> _getArticlePublishInfo(ArticleInfoPublishRequestsEvent event, Emitter<PublishState> emit) async {
    emit(ArticleInfoPublishLoadingState());
    try {
      var response = await publishRepo.getArticleInfo(event.id);
      if (response.success) {
        emit(ArticleInfoPublishSuccessState(articleInfoModel: response));
        print("Get info Success");
      } else {
        emit(ArticleInfoPublishErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ArticleInfoPublishErrorState(error: e.toString()));
    }

  }

  Future<FutureOr<void>> _acceptArticle(ArticleAcceptEvent event, Emitter<PublishState> emit) async {
    emit(ArticleInfoPublishAcceptLoadingState());
    try {
      var response = await publishRepo.acceptArticle(
          id: event.id,
          category: event.category
      );
      if (response) {
        emit(ArticleInfoPublishAcceptSuccessState());
        print("Done publish the article");
      } else {
        emit(ArticleInfoPublishAcceptErrorState(response.body['message']));
      }
    } catch (e) {
      log(e.toString());
      emit(ArticleInfoPublishAcceptErrorState(e.toString()));
    }
  }

  Future<FutureOr<void>> _refuseArticle(ArticleRefuseEvent event, Emitter<PublishState> emit) async {
    emit(ArticleInfoPublishRefuseLoadingState());
    try {
      var response = await publishRepo.refuseArticle(
        id: event.id,
      );
      if (response) {
        emit(ArticleInfoPublishRefuseSuccessState());
        print("Done refuse the vid");
      } else {
        emit(ArticleInfoPublishRefuseErrorState(response.body['message']));
      }
    } catch (e) {
      log(e.toString());
      emit(ArticleInfoPublishRefuseErrorState(e.toString()));
    }

  }

  Future<FutureOr<void>> _articleLike(ArticleLikeEvent event, Emitter<PublishState> emit) async {
    emit(ArticleLikeLoadingState());
    try {
      var response = await publishRepo.articleLike(id: event.articleID);
      if (response) {
        emit(ArticleLikeSuccessState());
        print("article like Success");
      } else {
        emit(ArticleLikeErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ArticleLikeErrorState(error: e.toString()));
    }
  }

  Future<FutureOr<void>> _getArticlePublishRequestsList(ShowArticlePublishRequestsEvent event, Emitter<PublishState> emit)
  async {
    emit(ShowArticlePublishRequestsLoadingState());
    try {
      var response = await publishRepo.showArticleRequestList();
      if (response.success) {
        emit(ShowArticlePublishRequestsSuccessState(articleRequestListModel: response));
        print("Get Article List Success");
      } else {
        emit(ShowArticlePublishRequestsErrorState(error: response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowArticlePublishRequestsErrorState(error: e.toString()));
    }
  }

  FutureOr<void> _refresh(PublishRefreshEvent event, Emitter<PublishState> emit) {
 emit(PublishRefreshState());
  }
}
