// import 'package:flutter/material.dart';
//
// import '../../domain/bloc/profile_bloc.dart';
// import 'delete_member_from_activity_alert.dart';
//
// class UserListWidget extends StatelessWidget {
//   final String id;
//   final String idActivity;
//   final String name;
//   final String phone;
//   final ActivityBloc bloc;
//
//   UserListWidget(
//       {required this.id,
//       required this.name,
//       required this.phone,
//       required this.bloc,
//       required this.idActivity});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return DeleteMemberAlert(
//                       idActivity: idActivity,
//                       idMember: id,
//                       bloc: bloc,
//                     );
//                   },
//                 );
//               },
//               child: const Icon(Icons.delete)),
//           title: Text('this is a list'),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("ID: ${id}"),
//               Text("City: ${name}"),
//               Text("Phone: ${phone}"),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
