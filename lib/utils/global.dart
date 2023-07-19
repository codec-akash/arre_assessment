import 'package:arre_assessment/utils/keys.dart';
import 'package:flutter/material.dart';

class Global {
  static ThemeData lightTheme = ThemeData.light();
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff4BC7B6),
    scaffoldBackgroundColor: const Color(0xff171E26),
    canvasColor: const Color(0xff232C36),
    brightness: Brightness.dark,
    fontFamily: Keys.fontFamilyUbuntu,
  );
}
