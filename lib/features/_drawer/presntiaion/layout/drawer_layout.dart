// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../screens/about/aboutPage.dart';
// import '../../../../screens/conect_us/conect_us.dart';
// import '../../../../screens/inner_sysetem/inner_system.dart';
// import '../../../Home/presntation/layout/home_layout.dart';
// import '../../../JoinRequest/presentation/screen/join-screen.dart';
// import '../../../activity/presentation/screens/add_activity.dart';
// import '../../../activity/presentation/screens/get_announced_activities_screen.dart';
// import '../../../publish/presentation/screens/admin-publish/publish-request-layout.dart';
// import '../../../teams/presentation/screens/teams-list.dart';
// import '../../bloc/drawer_bloc.dart';
// import '../../bloc/drawer_state.dart';
// import '../widgets/drawer/my_drawer.dart';
//
// class DrawerLayout extends StatelessWidget {
//    DrawerLayout({super.key});
//   final DrawerBloc drawerBloc = DrawerBloc();
//
//   List <Widget> screens = [
//     HomeLayout(),
//     PublishRequestLayout(),
//     AddActivityScreen(),
//     GetAnnouncedActivitiesScreen(),
//     TeamsList(),
//     JoinScreen(),
//     InnerSystem(),
//     AboutPage(),
//     ConnectUsPage(),
//
//    //  ProfileScreen(),
//    // // Container(),
//    //  ProfileScreen(),
//    //  WalletScreen(),
//    //  PointsScreen (),
//    //  NotificationsScreen(),
//    // CustomerOpinions(),
//    //  ConnectUsScreen(),
//    //  PraivtePolicyScreen(),
//    // AboutScreen(),
//
//
//   ];
//
//   List <String> titles = [
//     // AppStringConst.home,
//     // AppStringConst.profile,
//     // AppStringConst.favorite,
//     // // AppStringConst.cart,
//     // AppStringConst.wallet,
//     // AppStringConst.pointsBalance,
//     // AppStringConst.notifications,
//     // AppStringConst.customerOpinions,
//     // AppStringConst.connectUs,
//     // AppStringConst.privacyPolicy,
//     // AppStringConst.about
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) => drawerBloc,
//         child: BlocListener<DrawerBloc, DrawerState>(listener: (context, state) {
//           },
//             child: BlocBuilder<DrawerBloc, DrawerState>(builder: (context, state) {
//               return Scaffold(
//                 // appBar: (
//                 //     DrawerBloc.drawerId == 0
//                 //         ||
//                 //         DrawerBloc.drawerId == 1
//                 //         ||
//                 //         DrawerBloc.drawerId == 2
//                 // )
//                 //     ?
//                 // null:
//                 // AppBar(
//                 //   title: Text(
//                 //       titles[DrawerBloc.drawerId]),
//                 // ),
//                 drawer: const MyDrawer(),
//                 body: screens[DrawerBloc.drawerId],
//           );
//             })
//         )
//     );
//
//   }
// }
