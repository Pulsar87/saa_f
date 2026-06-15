import 'package:flutter/material.dart';

import '../../../../../core/router/router_name.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../domain/bloc/auth_bloc.dart';

void sinupSuccessMethod(SinupSuccessState state, BuildContext context) {
  // SharedPreferencesHelper.saveData(
  //         key: 'accessToken',
  //         value: state.sinupSuccessfully.data?.accessToken ?? "")
  //     .then((value) {
  //   AppConst.token = state.sinupSuccessfully.data?.accessToken ?? "";
  //   SharedPreferencesHelper.saveData(
  //       key: 'name', value: state.sinupSuccessfully.data?.user?.name);
  //   SharedPreferencesHelper.saveData(
  //       key: 'image', value: state.sinupSuccessfully.data?.user?.imgUrl);
  //   print("hiiiii${state.sinupSuccessfully.data?.accessToken}");
  //   print("hiiiii2222${AppConst.token}");
  //   SharedPreferencesHelper.saveData(
  //       key: 'email', value: state.sinupSuccessfully.data?.user?.email ?? "");
  //   AppConst.emailUser = state.sinupSuccessfully.data?.user?.email ?? "";
  //   print("hiiiii2222${AppConst.emailUser}");
  //   print("hiiiii2222${AppConst.emailUser}");
  //
  //   CoolAlert.show(
  //     width: displayWidth(context) / 4,
  //     context: context,
  //     type: CoolAlertType.success,
  //     text: 'sinup completed successfully!',
  //     autoCloseDuration: const Duration(seconds: 2),
  //   ).then((value) {
  //     context.goNamed(mainRouteName);
  //   });
  // });
}
