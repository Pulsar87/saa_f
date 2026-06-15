import 'dart:convert';
SinupSuccessfully sinupSuccessfullyFromJson(String str) => SinupSuccessfully.fromJson(json.decode(str));
String sinupSuccessfullyToJson(SinupSuccessfully data) => json.encode(data.toJson());
class SinupSuccessfully {
  SinupSuccessfully({
      this.success, 
      this.msg, 
      this.data,});

  SinupSuccessfully.fromJson(dynamic json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.tokenType, 
      this.expiresIn, 
      this.accessToken, 
      this.refreshToken, 
      this.user,});

  Data.fromJson(dynamic json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? tokenType;
  int? expiresIn;
  String? accessToken;
  String? refreshToken;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.imgUrl, 
      this.active, 
      this.birthDate, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.roles,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    imgUrl = json['img_url'];
    active = json['active'];
    birthDate = json['BirthDate'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }
  int? id;
  String? name;
  String? email;
  dynamic imgUrl;
  int? active;
  dynamic birthDate;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['img_url'] = imgUrl;
    map['active'] = active;
    map['BirthDate'] = birthDate;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;

    return map;
  }

}