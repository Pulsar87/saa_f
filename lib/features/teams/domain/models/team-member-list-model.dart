import 'dart:convert';
TeamMemberListModel TeamMemberListModelFromJson(String str) => TeamMemberListModel.fromJson(json.decode(str));


class TeamMemberListModel {
  String? message;
  bool? success;
  List <dynamic> teamList = [];
  // Data? data;

  TeamMemberListModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    teamList = json ['data'];
    // data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}



