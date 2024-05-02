import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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

Widget customSearchBar({
  required BuildContext context,
  required TextEditingController searchController,
  void Function(String)? onChanged,
  void Function()? onFilterTap,
  bool? searchHint,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomTextField(
              controller: searchController,
              hintText: "Search here...",
              textColor: kGrey,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: SvgPicture.asset(
                  "assets/icons/icon_search.svg",
                  width: 10.w,
                ),
              ),
              onChanged: onChanged,
              maxLines: 1,
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: kGreen,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/icon_filter.svg",
                  color: kBlack,
                ),
              ),
            ),
          )
        ],
      ),
      if (searchHint == true) ...[
        SizedBox(height: 10.h),
        SizedBox(
          height: 30.h,
          child: ListView.builder(
            itemCount: 3,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: kLightGrey1,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    regularText(
                      text: "Labs",
                      maxLines: 1,
                      color: kDarkGrey,
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset("assets/icons/icon_close.svg")
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ],
  );
}

Widget customAppBar() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          regularText(text: "Location", color: kGrey),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/icon_location.svg", color: kGreen),
              SizedBox(width: 5.w),
              titleSmallText(text: "New York, USA", color: kBlack),
              SizedBox(width: 10.w),
              SvgPicture.asset("assets/icons/icon_arrow_down.svg"),
            ],
          ),
        ],
      ),
      const Spacer(),
      SvgPicture.asset("assets/icons/icon_notification.svg"),
      SizedBox(width: 12.w),
      Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset("assets/icons/icon_cart.svg"),
          Positioned(
            top: -5.h,
            right: -5.w,
            child: CircleAvatar(
              backgroundColor: kYellow,
              radius: 8.r,
              child: Text(
                '3',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: "Poppins",
                  color: kWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(width: 5.w),
    ],
  );
}

Widget customCartContainer({
  required String titleName,
  required double rating,
  required String noOfRating,
  required int noOfTest,
  required String address,
  required int offerPercentage,
  required double distance,
  required bool isAddToCart,
}) {
  return Container(
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: kBlack.withOpacity(0.2),
          blurRadius: 1.5,
          // spreadRadius: 1,
        ),
      ],
    ),
    child: ClipRRect(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          backgroundColor: kLightBgColor,
                          radius: 30.r,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            child: Image.asset(
                              "assets/icons/image_lab_profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -3.h,
                          right: -3.w,
                          child: SvgPicture.asset(
                            "assets/icons/icon_verify.svg",
                            height: 30.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        customText(text: titleName, fontSize: 20.sp),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: customText(
                              text: "Recommended",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/icon_star.svg"),
                        SizedBox(width: 8.w),
                        regularText(text: "${rating}"),
                        SizedBox(width: 8.w),
                        customText(
                            text: "(${noOfRating} Rating)", fontSize: 10.sp),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            "assets/icons/icon_microscope-fill.svg"),
                        SizedBox(width: 8.w),
                        regularText(text: "${noOfTest}+ Tests"),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/icon_medical.svg"),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: regularText(
                        text: address,
                        maxLines: 3,
                        color: kDarkGrey1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/icon_location_2.svg"),
                    const SizedBox(width: 8),
                    Expanded(
                      child: regularText(
                        text: "${distance} Km from you",
                        maxLines: 2,
                        color: kDarkGrey1,
                      ),
                    ),
                  ],
                ),
                if (isAddToCart) ...[
                  SizedBox(height: 10.h),
                  Divider(height: 0, color: kGrey.withOpacity(0.4)),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/icon_blood_test.svg"),
                      SizedBox(width: 8.w),
                      regularText(
                        text: "Blood Test",
                        color: kDarkGrey1,
                      ),
                      const Spacer(),
                      CustomButton(
                        buttonText: "Add To Cart:₹1200",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            top: 25.h,
            right: -45.w,
            child: Transform.rotate(
              angle: 0.8,
              child: Container(
                height: 25.h,
                width: 150.w,
                color: kRed,
                child: Center(
                  child: Text(
                    '${offerPercentage}% OFF',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Poppins",
                      color: kWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

customBottomSheet(
    {required BuildContext context, required Widget child}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return child;
    },
  );
}

customShowDialog({required BuildContext context, Widget? child}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: child,
      );
    },
  );
}

///Checkup Card Common
Widget checkupCartContainer({
  required String comprehensive,
  required String price,
  required String newPrice,
  required String report,
  required String type,
  required int offerPercentage,
}) {
  return Container(
    width: 384.w,
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: kBlack.withOpacity(0.1),
          blurRadius: 3,
        ),
      ],
    ),
    child: Column(
      children: [
        ClipRRect(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: kLightGreen,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.r),
                      topLeft: Radius.circular(12.r)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 25.w),
                      child: customText(
                          textAlign: TextAlign.start,
                          text: comprehensive,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 22.h,
                          width: 87.w,
                          color: kDarkWhite.withOpacity(0.6),
                          child: Center(
                            child: customText(
                              text: AppString.checkUp,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 17.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                                textAlign: TextAlign.start,
                                text: price,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300),
                            SizedBox(width: 9.w),
                            customText(
                              textAlign: TextAlign.start,
                              text: newPrice,
                              fontSize: 18.sp,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 15.h,
                right: -40.w,
                child: Transform.rotate(
                  angle: 0.7,
                  child: Container(
                    height: 28.h,
                    width: 140.w,
                    color: kRed,
                    child: Center(
                      child: customText(
                        textAlign: TextAlign.start,
                        text: '$offerPercentage% OFF',
                        fontSize: 13.sp,
                        color: kWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h).copyWith(top: 18.h),
          child: Row(
            children: [
              Container(
                height: 36.h,
                width: 33.w,
                decoration: BoxDecoration(
                    color: kLightGreen,
                    borderRadius: BorderRadius.circular(7.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: SvgPicture.asset(
                    AppAssets.streamLine,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        text: AppString.report,
                        color: kDarkGrey1,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400),
                    customText(
                        text: report,
                        color: kDarkGrey1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                AppAssets.vector,
                height: 27.h,
                width: 26.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        text: AppString.type,
                        color: kDarkGrey1,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400),
                    customText(
                        text: type,
                        color: kDarkGrey1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w)
              .copyWith(top: 20.h, bottom: 15.h),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomButton(
                  height: 47.h,
                  borderRadius: BorderRadius.circular(10.r),
                  buttonColor: kWhite,
                  border: Border.all(color: kLightGreen, width: 1),
                  buttonText: AppString.viewDetails,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kBlack26,
                      fontSize: 14,
                      fontFamily: "Poppins"),
                  onTap: () {
                    Get.toNamed(Routes.labDetailsScreen);
                  },
                ),
              ),
              SizedBox(width: 40.w),
              Expanded(
                flex: 1,
                child: CustomButton(
                  height: 47.h,
                  borderRadius: BorderRadius.circular(10.r),
                  buttonColor: kLightGreen,
                  buttonText: AppString.addToCart,
                  onTap: () {},
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

///Contact Card Common

Widget checkupAddCart({
  required Widget title,
  required Widget details,
  required Widget image,
  required Color color,
  required Color circleColor,
  required Widget child,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 176.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(color: kLightGrey.withOpacity(0.7), blurRadius: 2)
                  ]),
            ),
            Positioned(
              right: -20.w,
              bottom: 60.h,
              child: Container(
                height: 160.h,
                width: 170.w,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            image,
            title,
            details,
            child
          ],
        ),
      ],
    ),
  );
}

/// Lab Details Card
Widget customLabDetailsCart({
  required String titleName,
  required double rating,
  required String noOfRating,
  required int noOfTest,
  required String address,
  required double distance,
}) {
  return Container(
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: kBlack.withOpacity(0.1),
          blurRadius: 5,
        ),
      ],
    ),
    child: ClipRRect(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 25.h),
                  child: customText(text: titleName, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppAssets.starIcons, color: kGreen),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: regularText(text: "$rating"),
                    ),
                    customText(text: "($noOfRating Rating)", fontSize: 10.sp),
                    const Spacer(),
                    SvgPicture.asset(AppAssets.microscope, color: kGreen),
                    SizedBox(width: 8.w),
                    SizedBox(
                        width: 140.w,
                        child: regularText(text: "$noOfTest+ Tests")),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppAssets.location2, color: kGreen),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 140.w,
                      child: regularText(
                        text: address,
                        maxLines: 3,
                        color: kDarkGrey1,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(AppAssets.medical, color: kGreen),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 140.w,
                      child: regularText(
                        text: "${distance}km away from you",
                        maxLines: 2,
                        color: kDarkGrey1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15)
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

///-- Common Bottom Card Widget

Widget commonBottomCard({
  required String subtotal,
  required String gst,
  required String discount,
  required String price,
  required Widget button,
  bool? height = false,
}) {
  return Container(
    height: 270.h,
    decoration: BoxDecoration(
      color: kWhite,
      boxShadow: [BoxShadow(color: kLightGrey, blurRadius: 3)],
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.r),
        topLeft: Radius.circular(30.r),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                child: Row(
                  children: [
                    customText(
                      text: "Subtotal",
                      fontSize: 17.sp,
                    ),
                    const Spacer(),
                    customText(
                      text: subtotal,
                      fontSize: 19.sp,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  customText(
                    text: "GST 20%",
                    fontSize: 17.sp,
                  ),
                  const Spacer(),
                  customText(
                    text: gst,
                    fontSize: 19.sp,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  children: [
                    customText(
                      text: "Discount applied",
                      fontSize: 17.sp,
                    ),
                    const Spacer(),
                    customText(
                      text: discount,
                      fontSize: 19.sp,
                    ),
                  ],
                ),
              ),
              height == true ? SizedBox(height: 18.h) : const SizedBox(),
              Row(
                children: [
                  customText(
                    text: "Total Price",
                    fontSize: 21.sp,
                  ),
                  const Spacer(),
                  customText(
                      text: price,
                      fontSize: 21.sp,
                      color: kLightGreen,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
          const Spacer(),
          button,
          SizedBox(height: 5.h)
        ],
      ),
    ),
  );
}
