import 'package:book/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
  scaffoldBackgroundColor: LightColor.scaffoldBackground,
  fontFamily: 'markazi',
  backgroundColor: LightColor.background,
  accentColor: LightColor.accent,
  primaryColor: LightColor.appbarTitle,
  primaryColorDark: LightColor.appbarBackground,
  appBarTheme: AppBarTheme(
    color: LightColor.appbarBackground
  ),
  // iconTheme: IconThemeData(color: LightColor.appbarTitle,size: 18),
  brightness: Brightness.light,
  dividerColor: LightColor.dividerColor,
  // accentIconTheme: IconThemeData(color: LightColor.appbarTitle,size: 18),
  buttonColor: LightColor.accent,
  textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: LightColor.appbarTitle),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
      headline3: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 19, color: Colors.black),
      headline4: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
      subtitle1: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyText1: TextStyle(fontSize: 18,
          fontWeight: FontWeight.normal, color: Colors.black, height: 1.2)),
);

final ThemeData dark = ThemeData(
  scaffoldBackgroundColor: DarkColor.scaffoldBackground,
  fontFamily: 'markazi',
  backgroundColor: DarkColor.background,
  accentColor: LightColor.accent,
  primaryColor: DarkColor.appbarTitle,
  disabledColor: DarkColor.dividerColor,
  primaryColorDark: DarkColor.appbarBackground,
  appBarTheme: AppBarTheme(
      color: DarkColor.appbarBackground
  ),
  // iconTheme: IconThemeData(color: LightColor.appbarTitle,size: 18),
  brightness: Brightness.dark,
  // accentIconTheme: IconThemeData(color: LightColor.appbarTitle,size: 18),
  buttonColor: DarkColor.accent,
  textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: DarkColor.appbarTitle),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white70),
      headline3: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 19, color: Colors.white70),
      headline4: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
      subtitle1: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      bodyText1: TextStyle(fontSize: 18,
          fontWeight: FontWeight.normal, color: Colors.white70, height: 1.5)),
);