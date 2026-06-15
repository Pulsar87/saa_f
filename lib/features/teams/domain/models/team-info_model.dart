import 'dart:convert';

import 'package:flutter/cupertino.dart';
TeamInfoModel TeamInfoModelFromJson(String str) => TeamInfoModel.fromJson(json.decode(str));


class TeamInfoModel {
  String? message;
  bool? success;
  Data? data;

  TeamInfoModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['sucesss'];
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}

class Data {
  int? id;
  String?teamName;
  String? type;
  String? description;
  bool? isSupervisor;
  bool? isTeamMember;
  bool? isTeamLeader;
  bool? isNormalUser;

  Data.fromJson(Map<String, dynamic> json) {
    id = json ['id'];
    teamName = json['name'];
    type = json ['type'];
    description =json ['description'];
    isSupervisor = json ['is_supervisor']??false;
    isTeamMember = json ['is_team_member']??false;
    isTeamLeader = json ['is_leader']??false;
    isNormalUser =json ['is_normal_user'] ??false;
  }
}

