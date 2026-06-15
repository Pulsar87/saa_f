import 'dart:convert';

import 'package:flutter/cupertino.dart';
RatingMemberModel RatingMemberModelFromJson(String str) => RatingMemberModel.fromJson(json.decode(str));


class RatingMemberModel {
  String? message;
  bool? success;
  Data? data;

  RatingMemberModel.fromJson(Map<String, dynamic> json) {
    message  = json['msg'];
    success = json['success'];
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
  }

}

class Data {
  var averageRating;
  List <dynamic>? ratings;

  Data.fromJson(Map<String, dynamic> json) {
    averageRating = json ['average_rating'];
    ratings = json['ratings'];
  }
}

