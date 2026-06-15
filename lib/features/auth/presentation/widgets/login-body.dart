// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:saa_project/features/auth/domain/bloc/auth_bloc.dart';
//
// import '../../../../../core/constants/app-colors.dart';
// import '../../../../../core/constants/strings_const.dart';
// import '../../domain/bloc/login_bloc.dart';
//
// class LoginBody extends StatelessWidget {
//   const LoginBody({
//     Key? key,
//     required this.formKey,
//     required this.loginBloc,
//     required this.emailController,
//     required this.passwordController,
//   }) : super(key: key);
//
//   final GlobalKey<FormState> formKey;
//   final AuthBloc loginBloc;
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
//       height: MediaQuery.of(context).size.height / 15,
//       width: MediaQuery.of(context).size.width / 1.2,
//       child: MaterialButton(
//         color: Colors.white,
//         onPressed: () {
//           log("press");
//           if (formKey.currentState!.validate()) {
//             loginBloc.add(LoginRequestEvent(
//                 emailAddress: emailController.text,
//                 password: passwordController.text));
//           }
//         },
//         child: const Text(StringsConst.login),
//       ),
//     );
//   }
// }
