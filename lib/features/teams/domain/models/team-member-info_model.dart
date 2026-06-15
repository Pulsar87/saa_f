import 'dart:convert';

import 'package:flutter/cupertino.dart';
TeamMemberInfoModel TeamMemberInfoModelFromJson(String str) => TeamMemberInfoModel.fromJson(json.decode(str));


class TeamMemberInfoModel {
  String? message;
  bool? success;
  Data? data;

  TeamMemberInfoModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}

class Data {
  int? id;
  String?arabic_name;
  String? english_name;
  String? father_name;
  String? BirthDate;
  String? City;
  String? nationality;
  String? phone_number;
  String? whatsapp_number;
  String? email;
  String? academic_level;
  String? work_specialization;
  String? academic_specialization;
  String? activity_type;

  Data.fromJson(Map<String, dynamic> json) {
    id = json ['id'];
    arabic_name = json['arabic_name'];
    english_name = json ['english_name'];
    father_name =json ['father_name'];
    BirthDate = json ['BirthDate'];
    City = json ['City'];
    nationality = json ['nationality'];
    phone_number =json ['phone_number'] ;
    whatsapp_number =json ['whatsapp_number'] ;
    email =json ['email'] ;
    academic_level =json ['academic_level'] ;
    work_specialization =json ['work_specialization'] ;
    academic_specialization =json ['academic_specialization'] ;
    activity_type =json ['activity_type'] ;
  }
}

