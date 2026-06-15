// import 'package:flutter/material.dart';
// import 'package:saa_f/features/activity/presentation/widgets/text_style_main.dart';
// import 'package:saa_f/features/activity/presentation/widgets/text_style_middle.dart';
//
// import '../../../../core/constant/colors/light-colors.dart';
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../../../core/unit/home_list_view.dart';
// import '../../domain/bloc/profile_bloc.dart';
// import 'cancel_activity_alert.dart';
// import 'confirm_activity_alert.dart';
// import 'delet_activity_alert.dart';
// import 'edit_activity_alert.dart';
// import 'join_activity-alert.dart';
//
// class ActivityItem extends StatelessWidget {
//   const ActivityItem({
//     Key? key,
//     required this.name,
//     required this.description,
//     required this.age,
//     required this.date,
//     required this.image,
//     required this.place,
//     required this.memberID,
//     required this.id,
//     required this.bloc,
//   }) : super(key: key);
//   final String name;
//   final String id;
//   final String description;
//   final String age;
//   final String date;
//   final String image;
//   final String place;
//   final String memberID;
//   final ActivityBloc bloc;
//
//   @override
//   Widget build(BuildContext context) {
//     print("///////////////////////$image");
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Container(
//             height: SizeConfig.height4,
//             decoration: BoxDecoration(
//               // color: Theme.of(context).primaryColor,
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(image),
//               ),
//
//               color: Colors.black12,
//             ),
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               color: Colors.black12,
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Row(
//
//                       children: [
//                         Text(
//                           'اسم النشاط : ',
//                           style: textStyleMiddle(),
//                         ),
//                         Text(
//                           name,
//                           style: textStyleMain(),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text('مكان النشاط : ', style: textStyleMiddle()),
//                         Text(
//                           place,
//                           style: textStyleMain(),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text('العمر المسموح به : ', style: textStyleMiddle()),
//                         Text(
//                           age,
//                           style: textStyleMain(),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text('تاريخ النشاط : ', style: textStyleMiddle()),
//                         Text(
//                           date,
//                           style: textStyleMain(),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'الوصف : ',
//                           style: textStyleMiddle(),
//                         ),
//                         Text(
//                           description,
//                           style: textStyleMain(),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             decoration:  BoxDecoration(
//                               color: primaryColor,
//                               borderRadius: const BorderRadius.all(Radius.circular(10)),
//                             ),
//                             height: 50,
//                             width: 50,
//                             child: GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return ActivityAlert(
//                                       bloc: bloc,
//                                       activityInformation: ActivityInformation(
//                                         name: name,
//                                         id: id,
//                                         description: description,
//                                         age: age,
//                                         date: date,
//                                         image: image,
//                                         place: place,
//                                         memberID: memberID,
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                               child:  const Center(child: Text('تعديل',style: TextStyle(color: Colors.white))),
//                             ),
//                           ),
//                           Container(
//                             decoration:  BoxDecoration(
//                               color: primaryColor,
//                               borderRadius: const BorderRadius.all(Radius.circular(10)),
//                             ),
//                             height: 50,
//                             width: 50,
//                             child: GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return CancelActivityAlert(
//                                       id: id,
//                                       bloc: bloc,
//
//                                       name: name,
//                                     );
//                                   },
//                                 );
//                               },
//                               child:  const Center(child: Text('الغاء',style: TextStyle(color: Colors.white))),
//                             ),
//                           ),
//                           Container(
//                             decoration:  BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: const BorderRadius.all(Radius.circular(10)),
//                             ),
//                             height: 50,
//                             width: 50,
//                             child: GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return DeleteActivityAlert(
//                                       name:name,
//                                       id: id,
//                                       bloc: bloc,
//                                     );
//                                   },
//                                 );
//                               },
//                               child:  const Center(child: Text('حذف',style: TextStyle(color: Colors.white),)),
//                             ),
//                           ),
//                           Container(
//                             decoration:  BoxDecoration(
//                               color: primaryColor,
//                               borderRadius: const BorderRadius.all(Radius.circular(10)),
//                             ),
//                             height: 50,
//                             width: 50,
//                             child: GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return ShareActivityAlert(
//
//                                       id: id,
//                                       bloc: bloc,
//                                       name: name,
//                                     );
//                                   },
//                                 );
//                               },
//                               child: const Center(child: Text('مشاركة',style: TextStyle(color: Colors.white))),
//                             ),
//                           ),
//                           Container(
//                             decoration: const BoxDecoration(
//                                 color: Colors.green,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10))),
//                             height: 60,
//                             width:  60,
//                             child: GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return ConfirmActivityAlert(
//                                       id: id,
//                                       bloc: bloc,
//                                     );
//                                   },
//                                 );
//                               },
//                               child: const Center(child: Text('تأكيد',style: TextStyle(color: Colors.white) )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
