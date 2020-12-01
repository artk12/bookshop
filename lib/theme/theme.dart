import 'package:book/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
  scaffoldBackgroundColor: LightColor.scaffoldBackground,
  fontFamily: 'iranian_sans',
  backgroundColor: LightColor.background,
  accentColor: LightColor.accent,
  primaryColor: LightColor.appbarTitle,
  // iconTheme: IconThemeData(color: LightColor.appbarTitle,size: 18),
  brightness: Brightness.light,
  // accentIconTheme: IconThemeData(color: LightColor.appbarTitle,size: 18),
  buttonColor: LightColor.accent,
  textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: LightColor.appbarTitle),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      headline3: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      headline4: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
      subtitle1: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
          fontWeight: FontWeight.normal, color: Colors.black, height: 1.2)),
);
