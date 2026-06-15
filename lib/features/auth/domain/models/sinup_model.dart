// import 'dart:convert';
// SinupModel sinupModelFromJson(String str) => SinupModel.fromJson(json.decode(str));
// String sinupModelToJson(SinupModel data) => json.encode(data.toJson());
// class SinupModel {
//   SinupModel({
//       this.name,
//       this.email,
//       this.password,
//       this.passwordConfirmation,
//       this.verificationCode,});
//
//   SinupModel.fromJson(dynamic json) {
//     name = json['name'];
//     email = json['email'];
//     password = json['password'];
//     passwordConfirmation = json['password_confirmation'];
//     verificationCode = json['verification_code'];
//   }
//   String? name;
//   String? email;
//   String? password;
//   String? passwordConfirmation;
//   String? verificationCode;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = name;
//     map['email'] = email;
//     map['password'] = password;
//     map['password_confirmation'] = passwordConfirmation;
//     map['verification_code'] = verificationCode;
//     return map;
//   }
//
// }


import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));
String signupModelToJson(SignupModel data) => json.encode(data.toJson());
//
class SignupModel {
  SignupModel({
    this.sucesss,
    this.msg,
    this.data,
  });

  SignupModel.fromJson(dynamic json) {
    sucesss = json['sucesss'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? sucesss;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sucesss'] = sucesss;
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
    this.user,
  });

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
    this.roles,
  });

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
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? email;
  dynamic imgUrl;
  int? active;
  String? birthDate;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  List<Roles>? roles;

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
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Roles rolesFromJson(String str) => Roles.fromJson(json.decode(str));
String rolesToJson(Roles data) => json.encode(data.toJson());

class Roles {
  Roles({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Roles.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['guard_name'] = guardName;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }
}

Pivot pivotFromJson(String str) => Pivot.fromJson(json.decode(str));
String pivotToJson(Pivot data) => json.encode(data.toJson());

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  Pivot.fromJson(dynamic json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }
  int? modelId;
  int? roleId;
  String? modelType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model_id'] = modelId;
    map['role_id'] = roleId;
    map['model_type'] = modelType;
    return map;
  }
}



// ResponseModel ResponseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));
//
//
// class ResponseModel {
//   String? message;
//   String? msg;
//   // Data? data;
//
//   ResponseModel.fromJson(Map<String, dynamic> json) {
//     message  = json['message']??"";
//     msg = json['msg']??"";
//     // data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
//   }
//
// }



