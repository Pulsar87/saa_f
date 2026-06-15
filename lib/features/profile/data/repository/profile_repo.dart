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

import '../../domain/models/profile_model.dart';

class ProfileRepo {


  Future profileShow() async {
    try {
      print("try");

      http.Response response = await http.get(
        Uri.parse(profileShowUrl),
        headers: AppConst.httpHeaders(),
      );

      print("state code: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200) {
        print("true");
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = ProfileModel.fromJson(json);
        print("ProfileModel Show ${x.success}");
        return ProfileModel.fromJson(json);
      } else {
        return false;
      }
    } catch (e) {
      print("catch");
      print("repo we catch an error" + e.toString());
      return  StringConst.somethingWrong;
    }
  }
  Future profileEdit(
  {required String name,required File img_,})async {
    try {
      print("edit profile repo");
      print("new imge path ${img_.path}");
      var request = http.MultipartRequest('POST', Uri.parse(updateProfileUrl));
      request.headers.addAll({
        'Authorization': 'Bearer ${AppConst.token}',
        'Accept': 'application/json',
      });

      if (img_.path!="path") {
        var multipartFile = await http.MultipartFile.fromPath(
          'img_url',
          img_.path,
          filename: 'img_url.png',
        );
        request.files.add(multipartFile);
      }
      var fields = {'name' : name,};

      request.fields.addAll(fields);
      print(request.files.length);
      print(request.headers);
      print("request.fields");
      print(request.fields);
      var response = await request.send();
      print(response.statusCode);
      var responseBody = await response.stream.bytesToString(); // قراءة البيانات من الاستجابة
      print(response.statusCode);
      print("responseBody $responseBody");

      if (response.statusCode == 200) {
        print('repo done edit profile');
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
}
