import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/colors/dark-colors.dart';

final ThemeData darkTheme = ThemeData(
    primaryColor: darkThemePrimaryColor,
    scaffoldBackgroundColor: darkThemeScaffoldColor,
    primarySwatch: MaterialColor(4285420417,{50: Color( 0xfff3eff5 )
      , 100: Color( 0xffe6e0eb )
      , 200: Color( 0xffcec1d7 )
      , 300: Color( 0xffb5a2c3 )
      , 400: Color( 0xff9d83af )
      , 500: Color( 0xff84649b )
      , 600: Color( 0xff6a507c )
      , 700: Color( 0xff4f3c5d )
      , 800: Color( 0xff35283e )
      , 900: Color( 0xff1a141f )
    }),
    iconTheme: IconThemeData (
      color: darkThemePrimaryColor,
      size: 50,
    ),
    appBarTheme: AppBarTheme(
      elevation: 10,
      color: darkThemePrimaryColor,
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      systemOverlayStyle:  SystemUiOverlayStyle(

        statusBarColor: darkThemePrimaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    drawerTheme:  DrawerThemeData(
      elevation: 50,
      backgroundColor: darkThemeScaffoldColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkThemePrimaryColor,
      elevation: 30,
      iconSize: 25,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: bottomNavigationBarDarkColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
          color: darkThemeLightColor,
          size: 35
      ),
      selectedItemColor: darkThemeLightColor,
      selectedLabelStyle: TextStyle(
        color: darkThemeLightColor,
        fontSize: 15,
        fontWeight: FontWeight.w900,
      ),
      unselectedIconTheme: IconThemeData(
        color:lightGrey,
      ),
      unselectedItemColor: lightGrey,
      unselectedLabelStyle: TextStyle(
        color: darkThemePrimaryColor,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    ),
    tabBarTheme: const TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: darkThemeLightColor,
        labelStyle: TextStyle(
          color: darkThemeLightColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        unselectedLabelColor:lightGrey,
        dividerColor: darkThemeLightColor
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: darkThemeLightColor,
      suffixIconColor: darkThemeLightColor,
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
        color: darkThemeLightColor,
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
      iconColor: darkThemeLightColor,
      focusColor: darkThemeLightColor,
    ),
    dividerTheme: DividerThemeData(
      color: lightGrey,
      indent:10, //المسافة من اليمين
      endIndent: 10, //المسافة من اليسار
      space: 30, //البعد من اليمين واليسار
      thickness: 5,//السماكة
    ),
    textTheme:  TextTheme(
      titleLarge: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: darkThemeTextColor,
      ),
      //This style is the style of text inside textField

      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: darkThemeTextColor,
      ),
      bodySmall: TextStyle(
          fontSize: 25,
          color: darkThemeTextColor,
          fontWeight: FontWeight.normal
      ),
      labelMedium: TextStyle(
          fontSize: 20,
          color: darkThemeTextColor,
          fontWeight: FontWeight.normal
      ),
      titleSmall: TextStyle(
        color: darkThemeTextColor,
      ),
      labelLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: darkThemeLightColor
      ),
      headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white
      ),

    )
);