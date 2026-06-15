import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/colors/light-colors.dart';

final ThemeData lightTheme = ThemeData(

  primaryColor: primaryColor,

  scaffoldBackgroundColor: scaffoldColor,
  primarySwatch: const   MaterialColor(
    0xFF00004A,
    <int, Color>{
      50: Color(0xFFE8E8F3),
      100: Color(0xFFC6C6E0),
      200: Color(0xFFA3A3CC),
      300: Color(0xFF8080B8),
      400: Color(0xFF5E5EAA),
      500: Color(0xFF3B3B9A), // This is your primary color
      600: Color(0xFF35358A),
      700: Color(0xFF2E2E7B),
      800: Color(0xFF28286C),
      900: Color(0xFF1E1E52),
    },
  ),
  iconTheme: IconThemeData (
    color: primaryColor,
    size: 50,
  ),
  appBarTheme: AppBarTheme(
    elevation: 10,
    color: Colors.white,
    titleTextStyle:  TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    centerTitle: true,
    iconTheme:  IconThemeData(
      color: primaryColor,
      size: 30,
    ),
    actionsIconTheme: IconThemeData(
      color: primaryColor,
      size: 30,
    ),
    systemOverlayStyle:  SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    elevation: 50,
    backgroundColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    elevation: 30,
    iconSize: 25,
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    // backgroundColor: bottomNavigationBarColor,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 35
    ),
    selectedItemColor: primaryColor,
    selectedLabelStyle: TextStyle(
      color: primaryColor,
      fontSize: 15,
      fontWeight: FontWeight.w900,
    ),
    unselectedIconTheme: IconThemeData(
      color:lightGrey,
    ),
    unselectedItemColor: lightGrey,
    unselectedLabelStyle: TextStyle(
      color: primaryColor,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    ),
  ),
  tabBarTheme : TabBarTheme(
    labelColor: primaryColor,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),

    unselectedLabelColor: Colors.grey,
    unselectedLabelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),

    overlayColor: MaterialStateProperty.all<Color>(Colors.grey), // لون الـ overlay

  ),


  inputDecorationTheme: InputDecorationTheme(
    // prefixIconColor: primaryColor,
    // suffixIconColor: primaryColor,
    contentPadding: const EdgeInsets.all(16),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    counterStyle: TextStyle(
        fontSize: 15,
        color: lightGrey
    ),
    labelStyle: TextStyle(
      color: primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
    helperStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: lightGrey
    ),
    errorStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: errorColor,
    ),
    fillColor: Colors.black87,
    hintStyle: TextStyle (
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: lightGrey,
    ),
    iconColor: primaryColor,
    focusColor: primaryColor,
  ),
  dividerTheme: DividerThemeData(
    color: lightGrey,
    indent:10, //المسافة من اليمين
    endIndent: 10, //المسافة من اليسار
    space: 30, //البعد من اليمين واليسار
    thickness: 5,//السماكة
  ),
  // textTheme:  TextTheme(
  //   titleLarge: const TextStyle(
  //     fontSize: 60,
  //     fontWeight: FontWeight.bold,
  //     color: Colors.black,
  //   ),
  //   //This style is the style of text inside textField
  //   titleMedium: const TextStyle(
  //       fontSize: 20,
  //       fontWeight: FontWeight.w500
  //   ),
  //   bodySmall: const TextStyle(
  //       fontSize: 25,
  //       color: Colors.black,
  //       fontWeight: FontWeight.normal
  //   ),
  //
  //   labelMedium: const TextStyle(
  //       fontSize: 20,
  //       color: Colors.black,
  //       fontWeight: FontWeight.normal
  //   ),
  //
  //
  //   labelLarge: TextStyle(
  //       fontSize: 40,
  //       fontWeight: FontWeight.w500,
  //       color: primaryColor
  //   ),
  //   headlineMedium: const TextStyle(
  //       fontSize: 20,
  //       fontWeight: FontWeight.w500,
  //       color: Colors.black
  //   ),
  //
  // ),
  menuTheme: MenuThemeData (
      style: MenuStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey; // Customize the disabled state color
          }
          return Colors.red; // Customize the default state color
        }),

      )
  ),


  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.white,
    elevation: 8,
    textStyle: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    // Customize other properties like shape, etc.
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    // Customize other properties of the dropdown menu theme
    menuStyle: MenuStyle (
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey; // Customize the disabled state color
        }
        return Colors.red; // Customize the default state color
      }),

    ),
  ),

);
