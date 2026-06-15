// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/constant/strings-const.dart';
// import '../../domain/bloc/auth_bloc.dart';
//
// class SinupBody extends StatelessWidget {
//   const SinupBody({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AuthBloc bloc = context.read<AuthBloc>();
//     return Container(
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
//       height: MediaQuery.of(context).size.height / 15,
//       width: MediaQuery.of(context).size.width / 1.2,
//       child: MaterialButton(
//         color: Theme.of(context).primaryColor,
//         textColor: Colors.white,
//         onPressed: () {
//           log("press");
//           if (bloc.formKey.currentState!.validate()) {
//             bloc.add(SendVerificationMailEvent(
//                 bloc.emailController.text.toString()));
//
//             // context.go(verificationCodeRoutePath);
//           }
//         },
//         child: const Text(StringConst.singUp),
//       ),
//     );
//   }
// }
