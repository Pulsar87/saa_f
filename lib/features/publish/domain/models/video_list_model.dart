import 'dart:convert';
VideoListModel VideoListModelFromJson(String str) => VideoListModel.fromJson(json.decode(str));


class VideoListModel {
  String? message;
  bool? success;
  List <dynamic> video = [];

  VideoListModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    video = json ['data'];
  }

}



