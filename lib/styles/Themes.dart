import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      titleSpacing: 20,
      actionsIconTheme: IconThemeData(
          color: Colors.black
      ),
      color: Colors.white,
      elevation: 0,
      //  backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20
      )
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
  ),
  floatingActionButtonTheme:  FloatingActionButtonThemeData(
      backgroundColor: defaultColor
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      color: Colors.blueGrey,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  fontFamily: 'Jannah',
  expansionTileTheme: const ExpansionTileThemeData(
    textColor: Colors.black,
    collapsedIconColor: Colors.black,
    collapsedTextColor: Colors.black,

  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    contentTextStyle: TextStyle(
        color: Colors.blueGrey[600],
        fontSize: 18,
      fontWeight: FontWeight.w400
    ),
    titleTextStyle: TextStyle(
        color: Colors.blueGrey[600],
        fontSize: 22,
        fontWeight: FontWeight.bold,

    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColorDark:  Colors.blueGrey[600],
  scaffoldBackgroundColor: HexColor("#161515"),
  primaryColor: HexColor('#17809E'),
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      actionsIconTheme: const IconThemeData(
          color: Colors.white
      ),
      color: HexColor("#161515"),
      elevation: 0,
      //    backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#161515"),
          statusBarIconBrightness: Brightness.light
      ),
      titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: HexColor("#161515"),


  ),
  floatingActionButtonTheme:  FloatingActionButtonThemeData(
      backgroundColor: defaultColor
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  fontFamily: 'Jannah',
  iconTheme: const IconThemeData(
      color: Colors.white
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    textColor: Colors.white,
    collapsedTextColor: Colors.white,
    collapsedIconColor: Colors.white,

  ),
  dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold
      ),
      backgroundColor: HexColor("#161515"),
      contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18
      )
  ),
    unselectedWidgetColor: Colors.blueGrey
);