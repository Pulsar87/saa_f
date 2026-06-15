import 'dart:convert';

import 'package:flutter/cupertino.dart';
ArticleInfoModel ArticleInfoModelFromJson(String str) => ArticleInfoModel.fromJson(json.decode(str));


class ArticleInfoModel {
  String? message;
  bool? success;
  Data? data;

  ArticleInfoModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }
}

class Data {
  int? id;
  String?title;
  String? articleImgUrl;
  String? writerName;
  String? articleCategory;
  dynamic? textArticle;
  dynamic? htmlArticle;

  int? userId;
  String? userName;
  String? userProfileImg;
  String? createdAt;
  String? createdAtRelative;
  int? likesCount;
  bool? isLike;

  Data.fromJson(Map<String, dynamic> json) {
    id = json ['id'];
    title = json['title'];
    articleImgUrl = json ['article_img_url'];
    writerName =json ['writer_name'];
    articleCategory = json ['Media_Category'];
    textArticle =json ['text_content'] ?? null;
    htmlArticle =  json ['html_article']??null;
    createdAt = json ['created_at'];
    createdAtRelative = json ['created_at_relative'];
    userId = json['user_id'];
    userName = json ['user_name'];
    userProfileImg = json['profile_img']?? null;
    title = json['title'];
    likesCount = json['likes_count']??0;
    isLike = json['like'];
  }
}

