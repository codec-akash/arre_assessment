import 'package:arre_assessment/utils/keys.dart';
import 'package:flutter/material.dart';

class Global {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff4BC7B6),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.grey,
    brightness: Brightness.light,
    fontFamily: Keys.fontFamilyUbuntu,
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff4BC7B6),
    scaffoldBackgroundColor: const Color(0xff171E26),
    canvasColor: const Color(0xff232C36),
    brightness: Brightness.dark,
    fontFamily: Keys.fontFamilyAcumin,
  );
  static const Color textColor = Color(0xffE4F1EE);
  static const Color greenGradientColor = Color(0xffABFAFF);
  static const Color whiteGradientColor = Color(0xffD5FFAB);
}
