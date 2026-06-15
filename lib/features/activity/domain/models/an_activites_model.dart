// import 'dart:convert';
//
// AnActivity anActivityFromJson(String str) =>
//     AnActivity.fromJson(json.decode(str));
// String anActivityToJson(AnActivity data) => json.encode(data.toJson());
//
// class AnActivity {
//   AnActivity({
//     bool? success,
//     String? msg,
//     List<ActivityInfo>? data,
//   }) {
//     _success = success;
//     _msg = msg;
//     _data = data;
//   }
//
//   AnActivity.fromJson(dynamic json) {
//     _success = json['success'];
//     _msg = json['msg'];
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data?.add(ActivityInfo.fromJson(v));
//       });
//     }
//   }
//   bool? _success;
//   String? _msg;
//   List<ActivityInfo>? _data;
//
//   bool? get success => _success;
//   String? get msg => _msg;
//   List<ActivityInfo>? get data => _data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['success'] = _success;
//     map['msg'] = _msg;
//     if (_data != null) {
//       map['data'] = _data?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
//
// ActivityInfo dataFromJson(String str) => ActivityInfo.fromJson(json.decode(str));
// String dataToJson(ActivityInfo data) => json.encode(data.toJson());
//
// class ActivityInfo {
//   ActivityInfo({
//     int? id,
//     String? activityName,
//     String? activityDate,
//     String? place,
//     String? age,
//     String? imgUrl,
//     String? description,
//     String? state,
//     String? type,
//     dynamic images,
//     int? memberId,
//     String? createdAt,
//     String? updatedAt,
//     bool? isMember,
//     bool? participant,
//   }) {
//     _id = id;
//     _activityName = activityName;
//     _activityDate = activityDate;
//     _place = place;
//     _age = age;
//     _imgUrl = imgUrl;
//     _description = description;
//     _state = state;
//     _type = type;
//     _images = images;
//     _memberId = memberId;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _isMember = isMember;
//     _participant = participant;
//   }
//
//   ActivityInfo.fromJson(dynamic json) {
//     _id = json['id'];
//     _activityName = json['activity_name'];
//     _activityDate = json['activity_date'];
//     _place = json['place'];
//     _age = json['age'];
//     _imgUrl = json['img_url'];
//     _description = json['description'];
//     _state = json['state'];
//     _type = json['type'];
//     _images = json['images'];
//     _memberId = json['member_id'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _isMember = json['is_member'];
//     _participant = json['participant'];
//   }
//   int? _id;
//   String? _activityName;
//   String? _activityDate;
//   String? _place;
//   String? _age;
//   String? _imgUrl;
//   String? _description;
//   String? _state;
//   String? _type;
//   dynamic _images;
//   int? _memberId;
//   String? _createdAt;
//   String? _updatedAt;
//   bool? _isMember;
//   bool? _participant;
//
//   int? get id => _id;
//   String? get activityName => _activityName;
//   String? get activityDate => _activityDate;
//   String? get place => _place;
//   String? get age => _age;
//   String? get imgUrl => _imgUrl;
//   String? get description => _description;
//   String? get state => _state;
//   String? get type => _type;
//   dynamic get images => _images;
//   int? get memberId => _memberId;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   bool? get isMember => _isMember;
//   bool? get participant => _participant;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['activity_name'] = _activityName;
//     map['activity_date'] = _activityDate;
//     map['place'] = _place;
//     map['age'] = _age;
//     map['img_url'] = _imgUrl;
//     map['description'] = _description;
//     map['state'] = _state;
//     map['type'] = _type;
//     map['images'] = _images;
//     map['member_id'] = _memberId;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['is_member'] = _isMember;
//     map['participant'] = _participant;
//     return map;
//   }
// }
