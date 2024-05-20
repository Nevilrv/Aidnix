import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TestDetailsScreen extends StatefulWidget {
  const TestDetailsScreen({super.key});

  @override
  State<TestDetailsScreen> createState() => _TestDetailsScreenState();
}

class _TestDetailsScreenState extends State<TestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: AppString.test),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                customText(text: "Complete Blood Count (CBC)", fontSize: 18.sp, fontWeight: FontWeight.w600),
                SizedBox(height: 16.h),
                customText(
                    textAlign: TextAlign.start,
                    text:
                        "Lorem ipsum dolor sit amet consectetur. Quam nec enim at viverra et risus aliquam. Vel facilisis lorem urna. Lobortis egestas pretium mi justo iaculis vitae. Enim non viverra tempus tincidunt tortor neque volutpat amet. Turpis sit.",
                    fontSize: 16.sp,
                    maxLines: 6,
                    color: kDarkGrey1,
                    fontWeight: FontWeight.w400),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                          color: kLightGreen.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Container(
                                height: 36.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(AppAssets.vacation, height: 24.h, width: 24.h),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(text: "Testing for", fontSize: 11.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                                customText(text: "24 Parameters", fontSize: 12.sp),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Container(
                        height: 50.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                          color: kLightGreen.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Container(
                                height: 36.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(AppAssets.report, height: 26.h, width: 22.h),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(text: "Reports within", fontSize: 11.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                                customText(
                                  text: "6 hours",
                                  fontSize: 12.sp,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.food, height: 26.h, width: 26.h),
                    SizedBox(width: 20.w),
                    customText(text: "No fasting required", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.person, height: 26.h, width: 26.h),
                    SizedBox(width: 20.w),
                    customText(text: "Recommendation for everyone", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: customText(text: "Sample(s) required", fontSize: 15.sp),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.blood, height: 28.h, width: 28.h),
                    SizedBox(width: 15.w),
                    customText(text: AppString.blood, fontSize: 17.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(height: 25.h),
                customText(
                  text: "Tests Included",
                  fontSize: 15.sp,
                ),
                customText(text: "24 Tests", fontSize: 14.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  child: customText(text: "Red blood cell count", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                ),
                customText(text: "Hb - Hemoglobin", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  child: customText(text: "MVC", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                ),
                customText(text: "MCH", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  child: customText(text: "MCHC", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                ),
                customText(text: "Total WBC count", fontSize: 15.sp, color: kDarkGrey1, fontWeight: FontWeight.w400),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: kLightGreen.withOpacity(0.4),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 11.h, bottom: 5.h),
                    child: Row(
                      children: [
                        customText(
                          text: "₹4000",
                          fontSize: 15.sp,
                          decoration: TextDecoration.lineThrough,
                          color: kDarkGrey1,
                        ),
                        SizedBox(width: 8.w),
                        customText(
                          text: "₹1499",
                          fontSize: 20.sp,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: customText(text: "74% off", fontSize: 13.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              CustomButton(
                height: 50.h,
                width: 178.w,
                buttonText: "",
                child: Center(
                  child: regularSemiBoldText(text: AppString.addToCart),
                ),
                onTap: () {
                  Get.toNamed(Routes.cartScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
