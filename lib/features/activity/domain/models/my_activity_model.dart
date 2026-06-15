// import 'dart:convert';
//
// MyActivityModel myActivityModelFromJson(String str) =>
//     MyActivityModel.fromJson(json.decode(str));
// String myActivityModelToJson(MyActivityModel data) =>
//     json.encode(data.toJson());
//
// class MyActivityModel {
//   MyActivityModel({
//     this.success,
//     this.msg,
//     this.data,
//   });
//
//   MyActivityModel.fromJson(dynamic json) {
//     success = json['success'];
//     msg = json['msg'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(Data.fromJson(v));
//       });
//     }
//   }
//   bool? success;
//   String? msg;
//   List<Data>? data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['success'] = success;
//     map['msg'] = msg;
//     if (data != null) {
//       map['data'] = data?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
//
// Data dataFromJson(String str) => Data.fromJson(json.decode(str));
// String dataToJson(Data data) => json.encode(data.toJson());
//
// class Data {
//   Data({
//     this.id,
//     this.activityName,
//     this.activityDate,
//     this.place,
//     this.age,
//     this.imgUrl,
//     this.description,
//     this.state,
//     this.type,
//     this.images,
//     this.memberId,
//     this.createdAt,
//     this.updatedAt,
//     this.isAnnounced,
//     this.createdAtRelative,
//     this.pivot,
//   });
//
//   Data.fromJson(dynamic json) {
//     id = json['id'];
//     activityName = json['activity_name'];
//     activityDate = json['activity_date'];
//     place = json['place'];
//     age = json['age'];
//     imgUrl = json['img_url'];
//     description = json['description'];
//     state = json['state'];
//     type = json['type'];
//     images = json['images'];
//     memberId = json['member_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     isAnnounced = json['is_announced'];
//     createdAtRelative = json['created_at_relative'];
//     pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
//   }
//   int? id;
//   String? activityName;
//   String? activityDate;
//   String? place;
//   String? age;
//   String? imgUrl;
//   String? description;
//   String? state;
//   String? type;
//   dynamic images;
//   int? memberId;
//   String? createdAt;
//   String? updatedAt;
//   bool? isAnnounced;
//   String? createdAtRelative;
//   Pivot? pivot;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['activity_name'] = activityName;
//     map['activity_date'] = activityDate;
//     map['place'] = place;
//     map['age'] = age;
//     map['img_url'] = imgUrl;
//     map['description'] = description;
//     map['state'] = state;
//     map['type'] = type;
//     map['images'] = images;
//     map['member_id'] = memberId;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     map['is_announced'] = isAnnounced;
//     map['created_at_relative'] = createdAtRelative;
//     if (pivot != null) {
//       map['pivot'] = pivot?.toJson();
//     }
//     return map;
//   }
// }
//
// Pivot pivotFromJson(String str) => Pivot.fromJson(json.decode(str));
// String pivotToJson(Pivot data) => json.encode(data.toJson());
//
// class Pivot {
//   Pivot({
//     this.memberId,
//     this.activityId,
//   });
//
//   Pivot.fromJson(dynamic json) {
//     memberId = json['member_id'];
//     activityId = json['activity_id'];
//   }
//   int? memberId;
//   int? activityId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['member_id'] = memberId;
//     map['activity_id'] = activityId;
//     return map;
//   }
// }
