import 'package:saa_f/core/constant/strings-const.dart';

import 'app-const.dart';

class MyValidate {
  static String? lastNameValidate(String? value) {
    if (value!.isEmpty) {
      return StringConst.lastnameValidate;
    }
    return null;
  }

  static String? firstNameValidate(String? value) {
    if (value!.isEmpty) {
      return StringConst.firstnameValidate;
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return AppConst.emptyValidate;
    }
    return null;
  }

  static String? phoneValidate(String? value) {
    if (value == null || value.isEmpty) {
      return AppConst.emptyValidate;
    } else if (value.length < 10) {
      return AppConst.longTenValidate;
    }
    return null;
  }

  static String? emailValidate(value) {
    if (value!.isEmpty) {
      return StringConst.emailValidate;
    }
    final emailRegExp = RegExp(r'''
^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$''');
    if (!emailRegExp.hasMatch(value)) {
      return StringConst.invalidEmail;
    }
    return null;
  }

  static String? phoneNumberValidate(value) {
    if (value!.isEmpty) {
      return StringConst.phoneValidate;
    }
    return null;
  }

  static String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return StringConst.passwordValidate;
    } else if (value.length < 8) {
      return StringConst.passwordMinLength;
    }
    return null;
  }
}
