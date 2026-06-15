import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../../core/constant/strings-const.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../domain/models/login_model.dart';
import '../../domain/models/singup_successfully_model.dart';
import '../../domain/models/sinup_model.dart';
import 'dart:convert';

class AuthRepo {
  Future sendEmail({required String email}) async {
    print(email);

    try {
      log("try");
      http.Response response = await http.post(
        Uri.parse(sendEmailUrl),
        // headers: {
        //   "Accept":"application/json"
        // },
        body: {"email": email.toString()},
      );
      print("body: ${response.body}state code: ${response.statusCode}");
      print("body: ${response.body}state code: ${response.body}");
      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log("false");
        return StringConst.somethingWrong;
      }
    } catch (e) {
      log("catch");
      print("eroooooooooooooooooooor" + e.toString());
      return StringConst.somethingWrong;
    }
  }

  Future sinup({required String email, required String verificationCode,required String name, required String password, required String passwordConfirmation, }) async {
    try {
      log("try");
      // log('name${sinupModel.name!}email${sinupModel.email!}password${sinupModel.password!}password_confirmation${sinupModel.passwordConfirmation!}verification_code${sinupModel.verificationCode!}');
      http.Response response = await http.post(
        Uri.parse(sinupUrl),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'verification_code': verificationCode
        },
      );
      log("state code: ${response.statusCode}");
      if (response.statusCode == 201) {
        log("true");
        print("body: ${response.body}state code: ${response.statusCode}");
        return signupModelFromJson(response.body.toString());
      } else {
        log(response.body.toString());
        log("false");
       var c =  signupModelFromJson(response.body.toString());
        if (c.msg =="تم أخذ الايميل سابقاً") {
          print("تم أخذ الايميل سابقاً");
          return StringConst.emailAlreadyExist;}
        else
        return StringConst.somethingWrong;
      }
    } catch (e) {
      log("catch");
      log(e.toString());
      return StringConst.somethingWrong;
    }
  }

  Future login({required String email, required String password}) async {
    print(email);
    print(password);

    try {
      log("try");
      http.Response response = await http.post(Uri.parse(loginUrl),
          body: {"email": email, "password": password});
      print("state code: ${response.statusCode}");
      log(response.body.toString());

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return loginModelFromJson(response.body.toString());
      } else {
        log(response.toString());
        log("false");
        return StringConst.loginWrongData;
      }
    } catch (e) {
      log("catch");
      print("eroooooooooooooooooooor" + e.toString());
      return StringConst.somethingWrong;
    }
  }

  Future sendEmailToResetPassword({required String email}) async {
    print(email);

    try {
      log("try");
      http.Response response =
          await http.post(Uri.parse(sendEmailToResetPasswordUrl), body: {
        "email": email,
      });
      print("state code: ${response.statusCode}");
      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return "true";
      }
      else if (response.statusCode == 302) {
        log(response.body.toString());
        return StringConst.emailNotAuth;
      }
      else
      {
        log(response.body.toString());
        return StringConst.somethingWrong;
      }
    } catch (e) {
      log("catch");
      print("eroooooooooooooooooooor" + e.toString());
      return StringConst.somethingWrong;
    }
  }

  Future checkCode({required String code}) async {
    // return "false";
    print(code);

    try {
      log("try");
      http.Response response =
      await http.post(Uri.parse(checkCodeToResetPasswordUrl), body: {
        "code": code,
      });
      print("state code: ${response.statusCode}");
      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      }
      else if (response.statusCode == 302) {
        log(response.body.toString());
        return StringConst.wrongCode;
        return StringConst.wrongCode;
      }
      else
      {
        log(response.body.toString());
        return StringConst.somethingWrong;
      }
    } catch (e) {
      log("catch");
      print("eroooooooooooooooooooor" + e.toString());
      return StringConst.somethingWrong;
    }
  }


  Future resetPassword({required String password, required String code}) async {
    try {
      log("try");
      http.Response response = await http.post(Uri.parse(resetPasswordUrl),
          body: {
            "password": password,
            "password_confirmation": password,
            "code": code
          });

      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log("false");
        return false;
      }
    } catch (e) {
      log("catch");
      print("eroooooooooooooooooooor" + e.toString());
      return e.toString();
    }
  }
}
