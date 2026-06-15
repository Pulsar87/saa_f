
class ActivityListModel {
  ActivityListModel({
    this.success,
    this.msg,
    this.data,
  });

  ActivityListModel.fromJson(dynamic json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'];
  }
  bool? success;
  String? msg;
  List<dynamic>? data;
}

class ActivityModel {
  ActivityModel({
    this.success,
    this.msg,
    this.data,
  });

  ActivityModel.fromJson(dynamic json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'];
  }
  bool? success;
  String? msg;
  Map<String, dynamic>? data;
}

