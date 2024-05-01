import 'package:aidnix/Constant/app_color.dart';
import 'package:flutter/material.dart';

extension SizedExtension on double {
  addHSpace() {
    return SizedBox(height: this);
  }

  addWSpace() {
    return SizedBox(width: this);
  }
}

extension AppDivider on double {
  Widget appDivider({Color? color}) {
    return Divider(
      thickness: this,
      color: color ?? AppColors.whiteColor,
    );
  }
}

extension OpenSansTextStyle on String {
  Widget regularTextStyle({
    Color? fontColor,
    double? fontSize,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
    TextAlign? textAlign,
    int? maxLine,
    FontWeight? weight,
  }) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        color: fontColor ?? AppColors.blackColor,
        fontSize: fontSize ?? 17,
        fontFamily: "OpenSans",
        fontWeight: weight ?? FontWeight.normal,
        decoration: textDecoration ?? TextDecoration.none,
      ),
      textAlign: textAlign,
    );
  }

  Widget mediumTextStyle({
    Color? fontColor,
    double? fontSize,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
    TextAlign? textAlign,
    int? maxLine,
  }) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        color: fontColor ?? AppColors.blackColor,
        fontSize: fontSize ?? 17,
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w500,
        decoration: textDecoration ?? TextDecoration.none,
      ),
      textAlign: textAlign,
    );
  }

  Widget semiBoldTextStyle(
      {Color? fontColor,
      double? fontSize,
      TextDecoration? textDecoration,
      TextOverflow? textOverflow,
      int? maxLine,
      TextAlign? textAlign}) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        color: fontColor ?? AppColors.blackColor,
        fontSize: fontSize ?? 17,
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w600,
        decoration: textDecoration ?? TextDecoration.none,
      ),
      textAlign: textAlign,
    );
  }

  Widget boldTextStyle(
      {Color? fontColor,
      double? fontSize,
      TextDecoration? textDecoration,
      int? maxLine,
      TextOverflow? textOverflow,
      TextAlign? textAlign}) {
    return Text(
      this,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        color: fontColor ?? AppColors.blackColor,
        fontSize: fontSize ?? 17,
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w900,
        decoration: textDecoration ?? TextDecoration.none,
      ),
      textAlign: textAlign,
    );
  }
}

const TextStyle textStyleBlackH16W500 = TextStyle(
  fontSize: 16,
  color: AppColors.blackColor,
  fontFamily: "OpenSans",
  fontWeight: FontWeight.w500,
);

const TextStyle textStyleGreyH16W400 = TextStyle(
  fontSize: 16,
  color: AppColors.greyColor,
  fontWeight: FontWeight.w400,
  fontFamily: "OpenSans",
);

const TextStyle textStyleBlackH15W500 = TextStyle(
  fontSize: 15,
  color: AppColors.blackColor,
  fontWeight: FontWeight.w500,
  fontFamily: "OpenSans",
);
