import 'package:aidnix/constant/app_color.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
      color: color ?? AppColors.blackColor,
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
          color: AppColors.blackColor.withOpacity(0.2),
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
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
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
                        SvgPicture.asset("assets/icons/icon_star.svg"),
                        SizedBox(width: 8.w),
                        regularText(text: "${rating}"),
                        SizedBox(width: 8.w),
                        customText(text: "(${noOfRating} Rating)", fontSize: 10.sp),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/icon_microscope-fill.svg"),
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
