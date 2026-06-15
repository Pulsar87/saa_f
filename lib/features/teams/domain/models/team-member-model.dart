import 'dart:convert';
TeamMembersListModel TeamMembersListModelFromJson(String str) => TeamMembersListModel.fromJson(json.decode(str));


class TeamMembersListModel {
  String? message;
  bool? sucesss;
  List <dynamic> memberList = [];
  // Data? data;

  TeamMembersListModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    sucesss = json['sucesss'];
    memberList = json ['requests'];
    // data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}



