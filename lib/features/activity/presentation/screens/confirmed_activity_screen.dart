// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../domain/bloc/profile_bloc.dart';
// import '../widgets/activity_item.dart';
//
// class ConfirmedActivityScreen extends StatefulWidget {
//   const ConfirmedActivityScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ConfirmedActivityScreen> createState() =>
//       _ConfirmedActivityScreenState();
// }
//
// class _ConfirmedActivityScreenState extends State<ConfirmedActivityScreen> {
//   late ActivityBloc bloc;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     bloc = context.read<ActivityBloc>();
//     bloc.add(GetConfirmedActivityEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('الأنشطة المثبته عنها'),
//       ),
//       body: BlocBuilder<ActivityBloc, ActivityState>(
//         builder: (context, state) {
//           if (state is ActivityLoadingState) {
//             return SizedBox(
//               height: SizeConfig.height10,
//               child: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//           if (state is ActivityConfirmedSuccess) {
//             return Column(
//               children: state.activity.data
//                       ?.map((activity) => ActivityItem(
//                           name: activity.activityName ?? "",
//                           description: activity.description ?? "",
//                           age: activity.age ?? "",
//                           date: activity.activityDate ?? "",
//                           image: activity.imgUrl ?? "",
//                           id: activity.id.toString(),
//                           bloc: bloc,
//                           memberID: activity.memberId.toString(),
//                           place: activity.place ?? ""))
//                       .toList() ??
//                   [],
//             );
//           }
//           if (state is ActivityErrorState) {
//             CoolAlert.show(
//                     context: context,
//                     type: CoolAlertType.success,
//                     title: "يوجد خطأ",
//                     text: "الرجاء المحاولة لاحقا",
//                     autoCloseDuration: const Duration(seconds: 2),
//                     width: SizeConfig.width20)
//                 .then((value) =>  print ("")
//                 // context.go(homeRoutePath)
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
