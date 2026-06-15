import 'dart:convert';

import 'package:flutter/foundation.dart';


class CategoryListModel {
  CategoryListModel({
    this.success,
    this.msg,
    this.data,
  });

  CategoryListModel.fromJson(dynamic json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'];
  }
  bool? success;
  String? msg;
  List<dynamic>? data;
}

