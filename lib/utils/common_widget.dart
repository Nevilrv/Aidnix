import 'package:aidnix/Constant/app_assets.dart';
import 'package:aidnix/Constant/app_string.dart';
import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Widgets/app_button.dart';
import 'package:aidnix/Widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_widget .dart';

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
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: kBlack.withOpacity(0.1),
          blurRadius: 5,
        ),
      ],
    ),
    child: ClipRRect(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          backgroundColor: kLightGrey,
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                              AppAssets.labProfile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          right: -3,
                          child: SvgPicture.asset(
                            AppAssets.verify,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        customText(text: titleName, fontSize: 20),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Center(
                            child: customText(
                              text: AppString.recommended,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.starIcons),
                        const SizedBox(width: 8),
                        regularText(text: "$rating"),
                        const SizedBox(width: 8),
                        customText(
                            text: "(${noOfRating} Rating)", fontSize: 10),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.microscope),
                        const SizedBox(width: 8),
                        regularText(text: "$noOfTest+ Tests"),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.medical),
                    const SizedBox(width: 8),
                    Expanded(
                      child: regularText(
                        text: address,
                        maxLines: 3,
                        color: kDarkGrey1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.location2),
                    const SizedBox(width: 8),
                    Expanded(
                      child: regularText(
                        text: "$distance Km from you",
                        maxLines: 2,
                        color: kDarkGrey1,
                      ),
                    ),
                  ],
                ),
                if (isAddToCart) ...[
                  const SizedBox(height: 10),
                  Divider(height: 0, color: kGrey.withOpacity(0.4)),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.bloodTest),
                      const SizedBox(width: 8),
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
            top: 25,
            right: -45,
            child: Transform.rotate(
              angle: 0.8,
              child: Container(
                height: 25,
                width: 150,
                color: kRed,
                child: Center(
                  child: customText(
                      textAlign: TextAlign.start,
                      text: '$offerPercentage% OFF',
                      fontSize: 13.sp,
                      color: kWhite,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
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
                  onTap: () {},
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

/// Custom Search Bar
Widget customSearchBar({
  required BuildContext context,
  required TextEditingController searchController,
  void Function(String)? onChanged,
  void Function()? onFilterTap,
  bool? searchHis = true,
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
              hintText: "Search here..!",
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
      searchHis == true
          ? SizedBox(
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
            )
          : const SizedBox(),
    ],
  );
}

/// Custom App Bar
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
