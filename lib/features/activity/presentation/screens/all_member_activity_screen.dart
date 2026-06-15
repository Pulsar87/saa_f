// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../../../core/router/router_name.dart';
// import '../../../auth/domain/models/login_model.dart';
// import '../../../auth/domain/models/login_model.dart';
// import '../../domain/bloc/profile_bloc.dart';
// import '../widgets/all_users.dart';
//
// class AllMemberActivityScreen extends StatefulWidget {
//   const AllMemberActivityScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AllMemberActivityScreen> createState() =>
//       _AllMemberActivityScreenState();
// }
//
// class _AllMemberActivityScreenState extends State<AllMemberActivityScreen> {
//   late ActivityBloc bloc;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//     bloc = context.read<ActivityBloc>();
//     bloc.add(GetAllMembersActivitiesEvent(id: 1.toString()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('الأعضاء'),
//       ),
//       body: BlocBuilder<ActivityBloc, ActivityState>(
//         builder: (context, state) {
//           if (state is AllMembersActivityLoadingState) {
//             return SizedBox(
//               height: SizeConfig.height10,
//               child: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//           if (state is AllMembersActivitySuccessState) {
//             return SingleChildScrollView(
//               child: Column(
//                 children: bloc.allMemberActivityModel.data
//                         ?.map((user) => UserListWidget(
//                               id: user.id.toString(),
//                               name: user.arabicName.toString(),
//                               phone: user.phoneNumber.toString(),
//                               bloc: bloc,
//                               idActivity: "1",
//                             ))
//                         .toList() ??
//                     [],
//               ),
//             );
//           }
//           if (state is AllMembersActivityErrorState) {
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
