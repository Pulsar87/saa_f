import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../core/constant/app-const.dart';
import '../../../core/constant/strings-const.dart';
import '../../../core/network/remote/end_points.dart';
import '../../../core/network/remote/error_model.dart';
import '../../auth/domain/models/login_model.dart';

class JoinRepo {
  Future addJoinRequest({required Map<String, dynamic> data}) async {
    try {
      log("try");
      log("token");
      print(AppConst.token);
      // print(jsonEncode(data).toString());

      http.Response response = await http.post(
          Uri.parse(addJoinRequestUrl),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            // 'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          body: data
      );

      // http.Response response = await http.post(
      //   Uri.parse(addJoinRequestUrl),
      //   headers: AppConst.httpHeaders(),
      // body: data

      // );
      log("after response-------" + response.toString());

      print("state code: ${response.statusCode}");

      if (response.statusCode == 201) {
        log("true");
        log("true---------------");
        return "true";
      } else {
        log(response.body.toString());
        log("false");
        var c =  ResponseModelFromJson(response.body.toString());
        if (c.msg =="لا يمكنك أكثر من طلب انتساب لنفس الحساب ") {
          print("لا يمكنك أكثر من طلب انتساب لنفس الحساب ");
          return StringConst.cantSendTowJoinRequest ;}
        else
          return StringConst.somethingWrong;
      }
    } catch (e) {
      // if (response.statusCode == 201) {
      //   // Request was successful, parse the JSON response and return true
      // } else {
      //   // Request was not successful, handle the error
      //   log(response.body + response.statusCode.toString());
      //   log("false create request------------------------");
      //
      //   // Handle the error response appropriately
      //   return false;
      //   // return errorModelFromJson(response.body);
      // }
    // } catch (e) {
      log("catch-------------------------------");
      log(e.toString());
      return StringConst.somethingWrong;
    //   return ErrorModel(
    //       message: "error", success: "false", errors: [e.toString()]);
    }
  }
}
