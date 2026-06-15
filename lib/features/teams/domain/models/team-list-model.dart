import 'dart:convert';
TeamListModel TeamListModelFromJson(String str) => TeamListModel.fromJson(json.decode(str));


class TeamListModel {
  String? message;
  bool? success;
  List <dynamic> teamList = [];
  // Data? data;

  TeamListModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['sucesss'];
    teamList = json ['data'];
    // data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}



