import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget regularText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget regularSemiBoldText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget regularBoldText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget titleSmallText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget titleText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget titleSemiBoldText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget titleBoldText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget headingSmallText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget headingText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget headingSemiBoldText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget headingBoldText({
  required String text,
  Color? color,
  int? maxLines,
  TextDecoration? decoration,
  Color? decorationColor,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: color ?? kBlack,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: "Poppins",
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
