import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: 'FontBold',
      primarySwatch:  Colors.blue,
     // primarySwatch:  Colors.lightBlue,
      primaryColor: const Color(0xff5599ff),
      secondaryHeaderColor:const Color(0xff5599ff), //Primary2Color
      backgroundColor:const Color(0xffFFFFFF),
      hintColor:const Color(0xFF9D9D9D),
      focusColor:const Color(0xFF222222), // TextColor
      hoverColor:const Color(0xFF6C6C6C), // labelColor
      highlightColor: const Color(0xff5599ff), // primary3Color
      unselectedWidgetColor: const Color(0xff5599ff), // primary3Color
    );
  }


}