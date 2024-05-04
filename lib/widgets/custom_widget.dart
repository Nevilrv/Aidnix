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
  double? height,
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
      height: height,
    ),
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}

Widget regularText({
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

///HeadingText
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

///Heading SemiBold Text
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

///Heading Bold Text
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

///Custom Search Bar
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
                  AppAssets.iconSearch,
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
                  AppAssets.iconFilter,
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
                    SvgPicture.asset(AppAssets.iconClose),
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

/// Custom AppBar
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
              SvgPicture.asset(AppAssets.iconLocation, color: kGreen),
              SizedBox(width: 5.w),
              titleSmallText(text: "New York, USA", color: kBlack),
              SizedBox(width: 10.w),
              SvgPicture.asset(AppAssets.iconArrowDown),
            ],
          ),
        ],
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          Get.toNamed(Routes.notificationScreen);
        },
        child: SvgPicture.asset(AppAssets.iconNotification),
      ),
      SizedBox(width: 12.w),
      Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(AppAssets.iconCart),
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

/// Custom Cart Container
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
          color: kBlack.withOpacity(0.1),
          blurRadius: 10,
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
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                            child: Image.asset(
                              AppAssets.labProfile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -3.h,
                          right: -3.w,
                          child: SvgPicture.asset(
                            AppAssets.iconVerify,
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
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
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
                        SvgPicture.asset(AppAssets.starIcons),
                        SizedBox(width: 8.w),
                        regularText(text: "${rating}"),
                        SizedBox(width: 8.w),
                        customText(text: "(${noOfRating} Rating)", fontSize: 10.sp),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.microscopeIcon),
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
                    SvgPicture.asset(AppAssets.medical),
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
                    SvgPicture.asset(AppAssets.location2),
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
                      SvgPicture.asset(AppAssets.blood),
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

/// Custom Bottom Sheet
customBottomSheet({required BuildContext context, required Widget child}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return child;
    },
  );
}

/// Custom Show Dialog
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
  required void Function() onTap,
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
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12.r), topLeft: Radius.circular(12.r)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 25.w),
                      child: customText(textAlign: TextAlign.start, text: comprehensive, fontSize: 18.sp, fontWeight: FontWeight.w600),
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
                decoration: BoxDecoration(color: kLightGreen, borderRadius: BorderRadius.circular(7.r)),
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
                    customText(text: AppString.report, color: kDarkGrey1, fontSize: 11.sp, fontWeight: FontWeight.w400),
                    customText(text: report, color: kDarkGrey1, fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                    customText(text: AppString.type, color: kDarkGrey1, fontSize: 11.sp, fontWeight: FontWeight.w400),
                    customText(text: type, color: kDarkGrey1, fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 20.h, bottom: 15.h),
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
                  textStyle: TextStyle(fontWeight: FontWeight.w500, color: kBlack26, fontSize: 14, fontFamily: "Poppins"),
                  onTap: onTap,
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
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: kLightGrey.withOpacity(0.7), blurRadius: 2)]),
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
                    SvgPicture.asset(AppAssets.microscopeIcon, color: kGreen),
                    SizedBox(width: 8.w),
                    SizedBox(width: 140.w, child: regularText(text: "$noOfTest+ Tests")),
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

/// Custom Booking

Widget customBookingContainer({
  required String titleName,
  required String category,
  required String status,
  required String date,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: kBlack.withOpacity(0.1),
          blurRadius: 20,
        ),
      ],
    ),
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
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Image.asset(
                      AppAssets.labProfile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -3.h,
                  right: -3.w,
                  child: SvgPicture.asset(AppAssets.iconVerify, height: 30.h),
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
                SizedBox(height: 3.h),
                customText(text: category, fontSize: 14.sp, color: kDarkGrey1),
                SizedBox(height: 5.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: kLightBlue,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: customText(
                      text: status,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: kBlue,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            )
          ],
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.clock, scale: 3),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(text: AppString.appointmentDateText, fontSize: 10.sp, color: kDarkGrey1),
                      customText(text: date),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.microscopeIcon,
                    color: kGreen,
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(text: AppString.typeText, fontSize: 10.sp, color: kDarkGrey1),
                      customText(text: AppString.pickUpText, fontSize: 14.sp)
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

customBookingSummery({required String title, required int price}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 3.h),
    child: Row(
      children: [
        titleSemiBoldText(
          text: title,
        ),
        const Spacer(),
        headingSemiBoldText(text: "₹$price"),
      ],
    ),
  );
}

customDropDown({
  final ValueChanged? onChanged,
  final double? height,
  final Widget? hintText,
  final Color? borderColor,
  final Color? iconColor,
  final List<DropdownMenuItem<dynamic>>? items,
  void Function()? onTap,
  Color? color,
  double? iconSize,
  bool? isExpand,
  double? horizontal,
  TextStyle? style,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
    decoration: BoxDecoration(
      color: color ?? Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor ?? kLightGrey),
    ),
    child: DropdownButton(
      hint: hintText,
      onTap: onTap,
      // style: style ?? TextStyle(fontWeight: FontWeight.w600, color: kBlack, fontSize: 12.sp, fontFamily: "Poppins"),
      icon: Image.asset(AppAssets.arrowDown, scale: 4),

      isDense: true,
      isExpanded: isExpand ?? true,
      underline: const SizedBox(),
      items: items,
      onChanged: onChanged,
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
        mainAxisSize: MainAxisSize.min,
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
                  customText(text: price, fontSize: 21.sp, color: kLightGreen, fontWeight: FontWeight.w600),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.h),
          button,
          SizedBox(height: 15.h)
        ],
      ),
    ),
  );
}

///--Check Out Details Card
Widget checkoutDetailsCard({
  required String check,
  required String price,
  required String payment,
  required String paymentPrice,
  required String type,
  required String discount,
  required Widget button,
  bool? height = false,
}) {
  return Container(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
            child: customText(text: check, fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              customText(
                text: "Total Price",
                fontSize: 16.sp,
              ),
              const Spacer(),
              customText(text: price, fontSize: 18.sp, color: kLightGreen, fontWeight: FontWeight.w600),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              children: [
                customText(
                  text: payment,
                  fontSize: 16.sp,
                ),
                const Spacer(),
                customText(text: paymentPrice, fontSize: 16.sp, fontWeight: FontWeight.w400),
              ],
            ),
          ),
          Row(
            children: [
              customText(
                text: "Test Type",
                fontSize: 16.sp,
              ),
              const Spacer(),
              customText(text: type, fontSize: 16.sp, fontWeight: FontWeight.w400),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              children: [
                customText(
                  text: "Discount applied",
                  fontSize: 16.sp,
                ),
                const Spacer(),
                customText(
                  text: discount,
                  fontSize: 18.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          button,
          SizedBox(height: 15.h)
        ],
      ),
    ),
  );
}
