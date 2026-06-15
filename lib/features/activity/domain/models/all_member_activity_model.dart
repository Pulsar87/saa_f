import 'dart:convert';

AllMemberActivityModel allMemberActivityModelFromJson(String str) =>
    AllMemberActivityModel.fromJson(json.decode(str));
String allMemberActivityModelToJson(AllMemberActivityModel data) =>
    json.encode(data.toJson());

class AllMemberActivityModel {
  AllMemberActivityModel({
    this.success,
    this.msg,
    this.data,
    this.isRespinsible,
  });

  AllMemberActivityModel.fromJson(dynamic json) {
    success = json['success'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    isRespinsible = json['is_respinsible'];
  }
  bool? success;
  String? msg;
  List<Data>? data;
  bool? isRespinsible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['is_respinsible'] = isRespinsible;
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.id,
    this.arabicName,
    this.englishName,
    this.fatherName,
    this.nationality,
    this.city,
    this.phoneNumber,
    this.whatsappNumber,
    this.academicLevel,
    this.academicSpecialization,
    this.workSpecialization,
    this.astronomyLevel,
    this.activityType,
    this.target,
    this.otherInterests,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.user,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    arabicName = json['arabic_name'];
    englishName = json['english_name'];
    fatherName = json['father_name'];
    nationality = json['nationality'];
    city = json['City'];
    phoneNumber = json['phone_number'];
    whatsappNumber = json['whatsapp_number'];
    academicLevel = json['academic_level'];
    academicSpecialization = json['academic_specialization'];
    workSpecialization = json['work_specialization'];
    astronomyLevel = json['astronomy_level'];
    activityType = json['activity_type'];
    target = json['target'];
    otherInterests = json['other_interests'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  String? arabicName;
  String? englishName;
  String? fatherName;
  String? nationality;
  String? city;
  String? phoneNumber;
  String? whatsappNumber;
  String? academicLevel;
  String? academicSpecialization;
  String? workSpecialization;
  String? astronomyLevel;
  String? activityType;
  String? target;
  String? otherInterests;
  int? userId;
  dynamic createdAt;
  dynamic updatedAt;
  Pivot? pivot;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['arabic_name'] = arabicName;
    map['english_name'] = englishName;
    map['father_name'] = fatherName;
    map['nationality'] = nationality;
    map['City'] = city;
    map['phone_number'] = phoneNumber;
    map['whatsapp_number'] = whatsappNumber;
    map['academic_level'] = academicLevel;
    map['academic_specialization'] = academicSpecialization;
    map['work_specialization'] = workSpecialization;
    map['astronomy_level'] = astronomyLevel;
    map['activity_type'] = activityType;
    map['target'] = target;
    map['other_interests'] = otherInterests;
    map['user_id'] = userId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
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
  }
  int? id;
  String? name;
  String? email;
  dynamic imgUrl;
  int? active;
  dynamic birthDate;
  dynamic emailVerifiedAt;
  dynamic createdAt;
  dynamic updatedAt;

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

Pivot pivotFromJson(String str) => Pivot.fromJson(json.decode(str));
String pivotToJson(Pivot data) => json.encode(data.toJson());

class Pivot {
  Pivot({
    this.activityId,
    this.memberId,
    this.rating,
  });

  Pivot.fromJson(dynamic json) {
    activityId = json['activity_id'];
    memberId = json['member_id'];
    rating = json['rating'];
  }
  int? activityId;
  int? memberId;
  dynamic rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity_id'] = activityId;
    map['member_id'] = memberId;
    map['rating'] = rating;
    return map;
  }
}
