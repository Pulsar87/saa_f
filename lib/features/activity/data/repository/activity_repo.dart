import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:saa_f/core/constant/app-const.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/network/remote/end_points.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_event.dart';
import 'package:saa_f/features/activity/domain/models/get_activity_list_model.dart';
import 'package:path_provider/path_provider.dart';


File convertXFileToFile(XFile xfile) {
  return File(xfile.path);
}

class ActivityRepo {
  Future addActivity({required String name, required String date , required String time , required String age, required String description, required File activityImage}) async {
    try {
      print("add Activity repo");
      print(age);
      print(date);
      print(time);
       var request = http.MultipartRequest('POST', Uri.parse(addActivityUrl));
      request.headers.addAll({
        'Authorization': 'Bearer ${AppConst.token}',
        'Accept': 'application/json',
      });

      var multipartFile = await http.MultipartFile.fromPath(
        'img_url',
        activityImage.path,
        filename: 'image.png',
      );
      request.files.add(multipartFile);
      var fields = {
        'activity_name' : name,
        'activity_date': date,
        'activity_time': time,
        'age': age,
        'description': description,
      };
      request.fields.addAll(fields);
      var response = await request.send();
      var responseBody = await response.stream.bytesToString(); // قراءة البيانات من الاستجابة
      print(response.statusCode);
      print("responseBody $responseBody");

      if (response.statusCode == 201) {
        print('repo done add activity');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error');
      print('Exception: $e');
      return false;
    }
  }

  Future editActivity({required int id,required String name, required String date , required String age, required String description, required File activityImage}) async {
    try {
      print("edit Activity repo");
      print("id $id");
      print("age $age");
      print("dtae $date ");
      print(name);
      print(description);
      print("path");
      print(activityImage.path );
       var request = http.MultipartRequest('POST', Uri.parse("$editActivityUrl$id"));
      request.headers.addAll({
        'Authorization': 'Bearer ${AppConst.token}',
        'Accept': 'application/json',
      });

      if (activityImage.path != "path") {
        var multipartFile = await http.MultipartFile.fromPath(
        'img_url',
        activityImage.path,
        filename: 'image.png',
      );
        request.files.add(multipartFile);
      }
      var fields = {
        'activity_name' : name,
        'age': age,
        'description': description,
      };
      request.fields.addAll(fields);
      if (date !="") {
        var fields2 = {
          'activity_date': date,
        };
        request.fields.addAll(fields2);
      }

      print("______________________ request data ______________________");
      print(request.fields['activity_date']);
      print(request.fields['age']);
      print(request.fields['activity_name']);
      print(request.fields['description']);
      print(request.files.length);
      var response = await request.send();
      var responseBody = await response.stream.bytesToString(); // قراءة البيانات من الاستجابة
      print(response.statusCode);
      print("responseBody $responseBody");

      if (response.statusCode == 200) {
        print('repo done edit activity');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error');
      print('Exception: $e');
      return false;
    }
  }

  Future confirmActivity({required int id,required String description, required List <XFile> activityImagesList}) async {
    try {
      print("confirm Activity repo");
      print(activityImagesList.length);

       var request = http.MultipartRequest('POST', Uri.parse("$confirmActivityUrl/$id"));
      request.headers.addAll({
        'Authorization': 'Bearer ${AppConst.token}',
        'Accept': 'application/json',
      });
      // for (int i = 0; i<activityImagesList.length;i++ ) {
      //   var multipartFile = await http.MultipartFile.fromPath(
      //     'images[$i]',
      //     activityImagesList[i].path,
      //     filename: 'image$i.png',
      //   );
      //   request.files.add(multipartFile);
      //
      // }
      for (int i = 0; i < activityImagesList.length; i++) {
        var file = convertXFileToFile(activityImagesList[i]);
        var multipartFile = await http.MultipartFile.fromPath(
          'images[$i]',
          file.path,
          filename: 'image$i.png',
        );
        request.files.add(multipartFile);
        print(request.files.length);
      }

      var fields = {
        'description': description,
      };

      request.fields.addAll(fields);
      print("start");
      var response = await request.send();
      var responseBody = await response.stream.bytesToString(); // قراءة البيانات من الاستجابة
      print(response.statusCode);
      print("responseBody $responseBody");

      if (response.statusCode == 200) {
        print('repo done add activity');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error');
      print('Exception: $e');
      return false;
    }
  }

  Future getAnnouncedActivities() async {
    try {
      print("try");

      http.Response response = await http.get(
        Uri.parse(getAnnouncedActivitiesUrl),
        headers: AppConst.httpHeaders(),
      );

      print("state code: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200) {
        print("true");
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = ActivityListModel.fromJson(json);
        print("Activity List Show ${x.success}");
        return ActivityListModel.fromJson(json);
      } else {
        return false;
      }
    } catch (e) {
      print("catch");
      print("repo we catch an error" + e.toString());
      return  StringConst.somethingWrong;
    }
  }

  Future getConfirmActivities() async {
    try {
      print("try");

      http.Response response = await http.get(
        Uri.parse(getConfirmedActivities),
        headers: AppConst.httpHeaders(),
      );

      print("state code: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200) {
        print("true");
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = ActivityListModel.fromJson(json);
        print("Activity List Show ${x.success}");
        return ActivityListModel.fromJson(json);
      } else {
        return false;
      }
    } catch (e) {
      print("catch");
      print("repo we catch an error" + e.toString());
      return  StringConst.somethingWrong;
    }
  }

  Future showActivity({required int id}) async {
    try {
      print("try");

      http.Response response = await http.post(
        Uri.parse("$showActivityUrl$id"),
        headers: AppConst.httpHeaders(),
      );

      print("state code: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200) {
        print("true");
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = ActivityModel.fromJson(json);
        print("Activity model Show ${x.success}");
        return ActivityModel.fromJson(json);
      } else {
        return false;
      }
    } catch (e) {
      print("catch");
      print("repo we catch an error" + e.toString());
      return  StringConst.somethingWrong;
    }
  }

    Future deleteActivity({required int id}) async {
      try {
        print("try");
        print("delete activity repo $id");
        http.Response response = await http.delete(
            Uri.parse("$deleteActivityUrl$id"),
            headers: {
              'Authorization': 'Bearer ${AppConst.token}',
              // 'Content-Type': 'application/json',
              'Accept': '*/*',
            }
        );
        print("state code: ${response.statusCode}");
        print(response.body);
        if (response.statusCode == 200) {
          print("true");
          return true;
        } else {
          return false;
        }
      } catch (e) {
        print("catch");
        print("repo we catch an error" + e.toString());
        return  StringConst.somethingWrong;
      }
    }

}