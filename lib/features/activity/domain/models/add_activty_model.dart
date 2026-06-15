// import 'dart:convert';
//
// AddActivityModel addActivityModelFromJson(String str) =>
//     AddActivityModel.fromJson(json.decode(str));
// String addActivityModelToJson(AddActivityModel data) =>
//     json.encode(data.toJson());
//
// class AddActivityModel {
//   AddActivityModel({
//     required String activityName,
//     required String activityDate,
//     required String place,
//     required String age,
//     required String description,
//     required String type,
//     required String memberId,
//     required String imgUrl,
//   }) {
//     _activityName = activityName;
//     _activityDate = activityDate;
//     _place = place;
//     _age = age;
//     _description = description;
//     _type = type;
//     _memberId = memberId;
//     _imgUrl = imgUrl;
//   }
//
//   AddActivityModel.fromJson(dynamic json) {
//     _activityName = json['activity_name'];
//     _activityDate = json['activity_date'];
//     _place = json['place'];
//     _age = json['age'];
//     _description = json['description'];
//     _type = json['type'];
//     _memberId = json['member_id'];
//   }
//   String? _activityName;
//   String? _activityDate;
//   String? _place;
//   String? _age;
//   String? _description;
//   String? _type;
//   String? _memberId;
//   String? _imgUrl;
//
//   String? get activityName => _activityName;
//   String? get activityDate => _activityDate;
//   String? get place => _place;
//   String? get age => _age;
//   String? get description => _description;
//   String? get type => _type;
//   String? get memberId => _memberId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['activity_name'] = _activityName;
//     map['activity_date'] = _activityDate;
//     map['place'] = _place;
//     map['age'] = _age;
//     map['description'] = _description;
//     map['type'] = _type;
//     map['member_id'] = _memberId;
//     map['img_url'] = _imgUrl;
//     return map;
//   }
// }
