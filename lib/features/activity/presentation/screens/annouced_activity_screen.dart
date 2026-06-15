// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/constant/app-const.dart';
// import '../../../../core/constant/app_media_query.dart';
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../domain/bloc/profile_bloc.dart';
// import '../widgets/activity_item.dart';
//
// class AnActivityScreen extends StatefulWidget {
//   const AnActivityScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AnActivityScreen> createState() => _AnActivityScreenState();
// }
//
// class _AnActivityScreenState extends State<AnActivityScreen> {
//   late ActivityBloc bloc;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     bloc = context.read<ActivityBloc>();
//     bloc.add(GetAnActivityEvent());
//     bloc.add(DeleteTextDateEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('الأنشطة المعلن عنها'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // context.push(addActivityPath);
//         },
//         child: Icon(Icons.add),
//       ),
//       body: BlocConsumer<ActivityBloc, ActivityState>(
//         listener: (context, state) {
//           if (state is CancelActivitySuccessState) {
//             bloc.add(GetAnActivityEvent());
//
//             CoolAlert.show(
//               width: displayWidth(context) / 4,
//               context: context,
//               type: CoolAlertType.success,
//               title: 'تم',
//               text: 'تم الغاء النشاط بنجاح',
//               autoCloseDuration: const Duration(seconds: 2),
//             );
//           }
//           if (state is ConfirmActivitySuccessState) {
//             bloc.add(GetAnActivityEvent());
//
//             CoolAlert.show(
//               width: displayWidth(context) / 4,
//               context: context,
//               type: CoolAlertType.success,
//               title: 'تم',
//               text: 'تم تثبيت النشاط بنجاح',
//               autoCloseDuration: const Duration(seconds: 2),
//             );
//           }
//           if (state is DeleteActivitySuccessState) {
//             bloc.add(GetAnActivityEvent());
//             CoolAlert.show(
//               width: displayWidth(context) / 4,
//               context: context,
//               type: CoolAlertType.success,
//               title: 'تم',
//               text: 'تم حذف النشاط بنجاح',
//               autoCloseDuration: const Duration(seconds: 2),
//             );
//           }
//           if (state is JoinActivitySuccessState) {
//             bloc.add(GetAnActivityEvent());
//             CoolAlert.show(
//               width: displayWidth(context) / 4,
//               context: context,
//               type: CoolAlertType.success,
//               title: 'تم',
//               text: 'أنت الان مشارك في هذا النشاط',
//               autoCloseDuration: const Duration(seconds: 2),
//             );
//           }
//           if (state is EditActivitySuccessState) {
//             bloc.add(GetAnActivityEvent());
//             bloc.add(DeleteTextDateEvent());
//
//             CoolAlert.show(
//               width: displayWidth(context) / 4,
//               context: context,
//               type: CoolAlertType.success,
//               title: 'تم',
//               text: 'تم تعديل بنجاح',
//               autoCloseDuration: const Duration(seconds: 2),
//             );
//           }
//
//           if (state is EditActivityErrorState ||
//               state is ConfirmActivityErrorState ||
//               state is CancelActivityErrorState ||
//               state is DeleteActivityErrorState) {
//             CoolAlert.show(
//               width: displayWidth(context) / 4,
//               context: context,
//               type: CoolAlertType.error,
//               title: 'خطأ',
//               text: "هناك مشكلة ما الرجاء المحاولة لاحقا",
//               autoCloseDuration: const Duration(seconds: 2),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is ActivityLoadingState) {
//             return SizedBox(
//               height: SizeConfig.height10,
//               child: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//           if (bloc.anActivity != null) {
//             return SingleChildScrollView(
//               child: Column(
//                 children: bloc.anActivity
//                         ?.map((activity) => ActivityItem(
//                               name: activity.activityName ?? "",
//                               description: activity.description ?? "",
//                               age: activity.age ?? "",
//                               memberID: activity.memberId.toString(),
//                               date: activity.activityDate ?? "",
//                               image:
//                                   "${AppConst.imgUrl}${activity.imgUrl}",
//                               place: activity.place ?? "",
//                               id: activity.id.toString(),
//                               bloc: bloc,
//                             ))
//                         .toList() ??
//                     [],
//               ),
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
//                 .then((value) => print("g")
//                 // context.go(homeRoutePath)
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
