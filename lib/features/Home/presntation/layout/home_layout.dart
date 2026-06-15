
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
//
// class JJJJ extends StatefulWidget {
//   @override
//   _JJJJState createState() => _JJJJState();
// }
//
// class _JJJJState extends State<JJJJ> {
//   int _selectedIndex = 0;
//
//   List<Widget> tabItems = [
//     Center(child: Text("0")),
//     Center(child: Text("1")),
//     Center(child: Text("2")),
//     Center(child: Text("3")),
//     Center(child: Text("4"))
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flashy Tabbar (Flutter)'),
//         ),
//         body: Center(
//           child: tabItems[_selectedIndex],
//         ),
//         bottomNavigationBar: FlashyTabBar(
//           animationCurve: Curves.linear,
//           selectedIndex: _selectedIndex,
//           iconSize: 30,
//           showElevation: false, // use this to remove appBar's elevation
//           onItemSelected: (index) => setState(() {
//             _selectedIndex = index;
//           }),
//           items: [
//             FlashyTabBarItem(
//               icon: Icon(Icons.event),
//               title: Text('Events'),
//             ),
//             FlashyTabBarItem(
//               icon: Image.asset(
//                 "assets/homeIcon.png",
//                 color: Color(0xff9496c1),
//                 width: 30,
//               ),
//               title: Text('Home'),
//             ),
//             FlashyTabBarItem(
//               icon: Icon(Icons.search),
//               title: Text('Search'),
//             ),
//             FlashyTabBarItem(
//               icon: Icon(Icons.highlight),
//               title: Text('Highlights'),
//             ),
//             FlashyTabBarItem(
//               icon: Icon(Icons.settings),
//               title: Text('한국어'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/features/JoinRequest/presentation/screen/join-screen.dart';
import 'package:saa_f/features/auth/presentation/screens/login.dart';
import 'package:saa_f/features/auth/presentation/screens/reset-password-screen.dart';
import 'package:saa_f/features/auth/presentation/screens/sinup.dart';
import 'package:saa_f/screens/DrawerList/presintaiton/drawer_screen.dart';

import '../../../../core/constant/strings-const.dart';
import '../../../publish/domain/bloc/publish-bloc.dart';
import '../../../publish/domain/bloc/publish-event.dart';
import '../../../publish/presentation/screens/post-list.dart';
import '../screens/Home_screen.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedPos = 1;
  double bottomNavBarHeight = 60;
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: BodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget  BodyContainer() {
    Color? selectedColor = tabItems[selectedPos].circleColor;
    Widget slogan;
    switch (selectedPos) {
      case 0:
        {
          slogan = PostList();
          context
              .read<PublishBloc>()
              .add(PublishRefreshEvent());


        }
    //     slogan =  Container(
    //       child: TextButton(
    //         child: Container(
    //           width: 50,
    //           height: 10,
    //           color: Colors.blue,
    //         ),
    //         onPressed: (){
    // Navigator.of(context).pushReplacement(MyAnimatedRoute(page: JoinScreen()));
    //         },
    //       ),
    //     );
        break;
      case 1:
        slogan =  HomeScreen();

        break;
      case 2:
        slogan=   DrawerList();
        break;
      default:
        slogan = const Text("erro");
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: slogan,
      ),
      // onTap: () {
      //   if (_navigationController.value == tabItems.length - 1) {
      //     _navigationController.value = 0;
      //   } else {
      //     _navigationController.value = _navigationController.value! + 1;
      //   }
      // },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: <BoxShadow>[
        const BoxShadow(color: Colors.black45, blurRadius: 20.0),
      ],
      animationDuration: const Duration(milliseconds: 400),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }
// @override
// void dispose() {
//   super.dispose();
//   _navigationController.dispose();
// }
}




List<TabItem> tabItems = List.of([
  TabItem(
    Icons.photo,
    // FontAwesomeIcons.photoVideo,
    "المنشورات",
    // Colors.white54,
    Colors.teal,
    labelStyle: TextStyle(
      color: primaryColor!,
      fontWeight: FontWeight.bold,
    ),
  ),

  TabItem(
    Icons.home_filled,
    "الرئيسية",
    Colors.teal,
    labelStyle: TextStyle(
      color: primaryColor!,
      fontWeight: FontWeight.bold,
    ),

  ),
  TabItem(
    Icons.view_timeline,
    "الخيارات",
    Colors.teal,
    labelStyle: TextStyle(
      color: primaryColor!,
      fontWeight: FontWeight.bold,
    ),
  ),
]);
