class ProfileModel {
  ProfileModel({
    this.success,
    this.msg,
    this.data,
  });

  ProfileModel.fromJson(dynamic json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'];
  }
  bool? success;
  String? msg;
  Map<String, dynamic>? data;
}
