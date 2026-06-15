import 'dart:convert';
ImageListModel ImageListModelFromJson(String str) => ImageListModel.fromJson(json.decode(str));


class ImageListModel {
  String? message;
  bool? success;
  List <dynamic> photos = [];
  // Data? data;

  ImageListModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    photos = json ['data'];
    // data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}



