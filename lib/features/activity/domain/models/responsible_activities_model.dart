// import 'dart:convert';
//
// ResponsibleActivities responsibleActivitiesFromJson(String str) =>
//     ResponsibleActivities.fromJson(json.decode(str));
// String responsibleActivitiesToJson(ResponsibleActivities data) =>
//     json.encode(data.toJson());
//
// class ResponsibleActivities {
//   ResponsibleActivities({
//     this.success,
//     this.msg,
//     this.data,
//   });
//
//   ResponsibleActivities.fromJson(dynamic json) {
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
//     return map;
//   }
// }
