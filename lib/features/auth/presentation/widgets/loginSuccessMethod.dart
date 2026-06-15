// import 'package:cool_alert/cool_alert.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../../../core/router/router_name.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/router/animation_route.dart';
import '../../../Home/presntation/layout/home_layout.dart';
import '../../domain/bloc/auth_bloc.dart';

void loginDashboardSuccessMethod(
    LoginSuccessState state, BuildContext context) {
  // print("log in success metod");
  // SharedPreferencesHelper.saveData(
  //     key: 'accessToken', value: state.loginModel.data?.accessToken);
  //
  // SharedPreferencesHelper.saveData(
  //     key: 'email', value: state.loginModel.data?.user?.email);
  // SharedPreferencesHelper.saveData(
  //     key: 'name', value: state.loginModel.data?.user?.name);
  // SharedPreferencesHelper.saveData(
  //     key: 'image', value: state.loginModel.data?.user?.imgUrl);
  //
  // state.loginModel.data?.user?.roles?.forEach((role) =>
  //     SharedPreferencesHelper.saveData(key: "${role.id}", value: role.id));
  //
  // print(SharedPreferencesHelper.getData(key: "accessToken"));
  // print(SharedPreferencesHelper.getData(key: "email"));
  // print(SharedPreferencesHelper.getData(
  //     key: "${state.loginModel.data?.user?.roles?.first.id}"));
  // print(SharedPreferencesHelper.getData(key: "5"));
  // print(SharedPreferencesHelper.getData(key: "8"));
  // AppConst.emailUser = state.loginModel.data?.user?.email ?? "";
  // AppConst.token = state.loginModel.data?.accessToken ?? "";
  // // });
  //
  // CoolAlert.show(
  //   width: displayWidth(context) / 4,
  //   context: context,
  //   type: CoolAlertType.success,
  //   title: 'تم',
  //   text: 'تم تسجيل الدخول بنجاح',
  //   autoCloseDuration: const Duration(seconds: 2),
  // ).then((value) {
    // context.pushReplacement(dashboardMainScreenPath);
  // });
}

void loginSuccessMethod(LoginSuccessState state, BuildContext context) {
  print("log in success method");
  SharedPreferencesHelper.saveData(
      key: 'accessToken', value: state.loginModel.data?.accessToken);
  SharedPreferencesHelper.saveData(
      key: 'email', value: state.loginModel.data?.user?.email);
  SharedPreferencesHelper.saveData(
      key: 'userId', value: state.loginModel.data?.user?.id);
  SharedPreferencesHelper.saveData(
      key: 'name', value: state.loginModel.data?.user?.name);
  SharedPreferencesHelper.saveData(
      key: 'image', value: state.loginModel.data?.user?.imgUrl?? "null");
  // if (  state.loginModel.data?.user?.roles!.length!=0)
  // int length = state.loginModel.data?.user?.roles?.length
  // for (int i = 0 ; i<state.loginModel.data?.user?.roles;i++ )
  state.loginModel.data?.user?.roles?.forEach((role) =>
      SharedPreferencesHelper.saveData(key: "${role.name}", value: role.name));

  print("This is shared pref data");
  print(SharedPreferencesHelper.getData(key: "accessToken"));
  print(SharedPreferencesHelper.getData(key: "email"));
  // print(SharedPreferencesHelper.getData(
  //     key: "${state.loginModel.data?.user?.roles?.first.id??null}"));
  print("You have role");


  state.loginModel.data?.user?.roles?.forEach((role) =>
    print("You have role ${role.name} \n"));

  // print(SharedPreferencesHelper.getData(key: "5"));
  // print(SharedPreferencesHelper.getData(key: "8"));
  // print(SharedPreferencesHelper.getData(key: "5"));
  // print(SharedPreferencesHelper.getData(key: "10"));
  // print(SharedPreferencesHelper.getData(key: "3"));
  // print(SharedPreferencesHelper.getData(key: "2"));
  // print(SharedPreferencesHelper.getData(key: "1"));

  AppConst.emailUser = state.loginModel.data?.user?.email ?? "";
  AppConst.token = state.loginModel.data?.accessToken ?? "";
  print("AppConst.tokenAppConst.tokenAppConst.tokenAppConst.tokenAppConst.token");
  print(AppConst.token);

  // });

  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.success,
    title: '',
    textTextStyle: normalTextStyle(fontSize: 20),
    text: StringConst.loginSuccess,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    Navigator.of(context).pushReplacement(MyAnimatedRoute(page: HomeLayout()));  });
}

void loginErrorCoolAlert(BuildContext context, LoginErrorState state) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: state.error,
    textTextStyle: normalTextStyle(fontSize: 20),
    loopAnimation: false,
  );
}




void signupSuccessMethod(SinupSuccessState state, BuildContext context) {
  print("signup success method");
  SharedPreferencesHelper.saveData(
      key: 'accessToken', value: state.sinupModel.data?.accessToken);
  SharedPreferencesHelper.saveData(
      key: 'email', value: state.sinupModel.data?.user?.email);
  SharedPreferencesHelper.saveData(
      key: 'userId', value: state.sinupModel.data?.user?.id);
  SharedPreferencesHelper.saveData(
      key: 'name', value: state.sinupModel.data?.user?.name);
  SharedPreferencesHelper.saveData(
      key: 'image', value: state.sinupModel.data?.user?.imgUrl?? "null");
  // if (  state.loginModel.data?.user?.roles!.length!=0)
  state.sinupModel.data?.user?.roles?.forEach((role) =>
      SharedPreferencesHelper.saveData(key: "${role.id}", value: role.id));

  print("This is shared pref data");
  print(SharedPreferencesHelper.getData(key: "accessToken"));
  print(SharedPreferencesHelper.getData(key: "email"));
  // print(SharedPreferencesHelper.getData(
  //     key: "${state.loginModel.data?.user?.roles?.first.id??null}"));

  if (state.sinupModel.data?.user?.roles?.length == 0)
    print("you have no roles");

  state.sinupModel.data?.user?.roles?.forEach((role) =>
      print("You have role ${role.id} \n"));

  // print(SharedPreferencesHelper.getData(key: "5"));
  // print(SharedPreferencesHelper.getData(key: "8"));
  // print(SharedPreferencesHelper.getData(key: "5"));
  // print(SharedPreferencesHelper.getData(key: "10"));
  // print(SharedPreferencesHelper.getData(key: "3"));
  // print(SharedPreferencesHelper.getData(key: "2"));
  // print(SharedPreferencesHelper.getData(key: "1"));

  AppConst.emailUser = state.sinupModel.data?.user?.email ?? "";
  AppConst.token = state.sinupModel.data?.accessToken ?? "";
  print(AppConst.token);

  // });

  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.success,
    title: '',
    textTextStyle: normalTextStyle(fontSize: 20),
    text: StringConst.signupSuccess,
    autoCloseDuration: const Duration(seconds: 2),
  ).then((value) {
    Navigator.of(context).pushReplacement(MyAnimatedRoute(page: HomeLayout()));
  });
}

void signupErrorCoolAlert(BuildContext context, SinupErrorState state) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: state.error,
    textTextStyle: normalTextStyle(fontSize: 20),
    loopAnimation: false,
  );
}

void sendEmailErrorCoolAlert(BuildContext context, SendEmailErrorState state) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: state.error,
    textTextStyle: normalTextStyle(fontSize: 20),
    loopAnimation: false,
  );
}

void authErrorCoolAlert(BuildContext context) {
  CoolAlert.show(
    width: displayWidth(context) / 4,
    context: context,
    type: CoolAlertType.error,
    title: StringConst.sorry,
    text: StringConst.somethingWrong,
    textTextStyle: normalTextStyle(fontSize: 15),
    loopAnimation: false,
  );
}
