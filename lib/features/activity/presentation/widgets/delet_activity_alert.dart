// import 'package:flutter/material.dart';
//
// import '../../../../core/constant/colors/light-colors.dart';
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../../JoinRequest/presentation/widget/join-text.dart';
// import '../../domain/bloc/profile_bloc.dart';
//
// class DeleteActivityAlert extends StatelessWidget {
//   const DeleteActivityAlert({Key? key, required this.id, required this.bloc, required this.name})
//       : super(key: key);
//   final String id;
//   final ActivityBloc bloc;
//   final String name;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//         side: BorderSide(width: 2.0, color: primaryColor),
//       ),
//       contentPadding:
//           const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//       // backgroundColor: ,
//       content: SizedBox(
//         height: SizeConfig.height5,
//         width: SizeConfig.width2,
//         child: SingleChildScrollView(
//           child: Wrap(
//             alignment: WrapAlignment.center,
//             runSpacing: SizeConfig.height30!,
//             children: [
//               Text(
//                 "هل تريد حذف هذا النشاط",
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               JoinText(
//                 text: name,
//                 isHeader: true,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         bloc.add(DeleteActivityEvent(id: id));
//                       },
//                       child: const Text(
//                         "نعم",
//                         style: TextStyle(fontSize: 20),
//                       )),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       "إلغاء",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
