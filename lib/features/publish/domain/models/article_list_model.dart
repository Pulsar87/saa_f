import 'dart:convert';
ArticleListModel ArticleListModelFromJson(String str) => ArticleListModel.fromJson(json.decode(str));


class ArticleListModel {
  String? message;
  bool? success;
  List <dynamic> articleList = [];
  // Data? data;

  ArticleListModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    articleList = json ['data'];
    // data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}



