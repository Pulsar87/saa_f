import 'dart:convert';
ImageInfoModel ImageInfoModelFromJson(String str) => ImageInfoModel.fromJson(json.decode(str));


class ImageInfoModel {
  String? message;
  bool? success;
  Data? data;

  ImageInfoModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}

class Data {
  int? id;
  String? imgUrl;
  String? description;
  String? mediaCategory;
  String? photographerName;
  int? userId;
  String? userName;
  String? userProfileImg;
  String? createdAt;
  String? createdAtRelative;
  String? title;
  int? likesCount;
  bool? isLike;

  Data.fromJson(Map<String, dynamic> json) {
    imgUrl = json['img_url'];
    description = json['description'];
    mediaCategory = json['Media_Category'];
    photographerName = json['photographer_name'];
    createdAt = json['updated_at'];
    createdAtRelative = json ['created_at_relative'];
    userId = json['user_id'];
    userName = json ['name'];
    userProfileImg = json['profile_img']?? null;
    title = json['title'];
    likesCount = json['likes_count']??0;
    isLike = json['like'];
  }
}

