import 'dart:convert';
VideoInfoModel VideoInfoModelFromJson(String str) => VideoInfoModel.fromJson(json.decode(str));


class VideoInfoModel {
  String? message;
  bool? success;
  Data? data;

  VideoInfoModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}

class Data {
  int? id;
  String? videoUrl;
  String? description;
  String? mediaCategory;
  int? userId;
  String? userName;
  String? userProfileImg;
  String? createdAt;
  String? createdAtRelative;
  String? title;
  int? likesCount;
  bool? isLike;

  Data.fromJson(Map<String, dynamic> json) {
    videoUrl = json['video_url'];
    description = json['description'];
    mediaCategory = json['Media_Category'];
    createdAt = json['created_at'];
    createdAtRelative = json ['created_at_relative'];
    userId = json['user_id'];
    userName = json ['name'];
    userProfileImg = json['profile_img']?? null;
    title = json['title'];
    likesCount = json['likes_count']??0;
    isLike = json['like'];
  }
}

