import 'package:flutter/material.dart';

Color kPrimary = const Color(0xff31C48D);
Color kBlack = const Color(0xff000000);
Color kWhite = const Color(0xffffffff);
Color kLightGrey = const Color(0xffD8E0F1);
Color kLightGrey1 = const Color(0xffF1F1F1);
Color kGrey = const Color(0xff9192A3);
Color kDarkGrey = const Color(0xff868796);
Color kDarkGrey1 = const Color(0xff686978);
Color kOlive = const Color(0xff687877);
Color kYellow = const Color(0xffFEA800);
Color kRed = const Color(0xffF14D4D);


ThemeData kLightTheme = ThemeData(
  colorScheme: const ColorScheme.light(background: Colors.white),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Colors.black,fontSize: 18),
  ),
);
ThemeData kDarkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(background: Colors.black),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Colors.white,fontSize: 18),
  ),
);

