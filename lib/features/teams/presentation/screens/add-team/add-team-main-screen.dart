// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/components/material-button-componat.dart';
// import '../admin-add-team.dart';
// class AddTeamMainScreen extends StatelessWidget {
//   AddTeamMainScreen({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("إضافة فريق جديد"),
//         ),
//         body: Container(
//             margin: const EdgeInsets.all(20),
//             child:
//             SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MaterialButtonComponent(
//                       onPressed: (){
//                         print("إضافة فريق");
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => AdminAddTeam()),
//                         );
//
//                       },
//                       child: Text("إضافة فريق", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white
//                       )
//                       )),
// ],
//     ),
//         ),
//
//
//         ),
//       ),
//     );
//
//   }
// }
//
//
