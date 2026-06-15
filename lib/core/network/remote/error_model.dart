import 'dart:convert';
ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));
String errorModelToJson(ErrorModel data) => json.encode(data.toJson());
class ErrorModel {
  ErrorModel({
      this.message, 
      this.success, 
      this.statusCode, 
      this.errors,});

  ErrorModel.fromJson(dynamic json) {
    message = json['message'];
    success = json['success'];
    statusCode = json['status_code'];
    errors = json['errors'] != null ? json['errors'].cast<String>() : [];
  }
  String? message;
  String? success;
  int? statusCode;
  List<String>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['success'] = success;
    map['status_code'] = statusCode;
    map['errors'] = errors;
    return map;
  }

}