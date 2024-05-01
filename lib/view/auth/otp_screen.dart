import 'dart:developer';
import 'package:aidnix/Constant/app_assets.dart';

import 'package:aidnix/Constant/app_string.dart';
import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Utils/custom_widget%20.dart';
import 'package:aidnix/Widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'auth_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthController authScreenController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthController>(
      builder: (controller) {
        return Column(
          children: [
            Container(
              height: 240.h,
              width: 430.w,
              color: kGreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 41.h, bottom: 22.h),
                    child:
                        assetImage(AppAssets.logo, height: 105.h, width: 108.w),
                  ),
                  customText(
                      text: AppString.welcomeToAidNix,
                      color: kWhite,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 97.h, bottom: 5.h),
              child: customText(
                  text: AppString.enterYourOtp,
                  color: kBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            customText(
                text: AppString.otpDetails,
                color: kBlack,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w)
                  .copyWith(top: 24.h, bottom: 40.h),
              child: Form(
                key: formKey,
                child: Pinput(
                  length: 4,
                  errorPinTheme: PinTheme(
                    width: 79.w,
                    height: 80.h,
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: "Poppins",
                      color: kBlack,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      border: Border.all(color: kRed),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 79.w,
                    height: 80.h,
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontFamily: "Poppins",
                      color: kBlack,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      border: Border.all(color: kLightGrey),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: controller.otpController,
                  textInputAction: TextInputAction.next,
                  showCursor: true,
                  validator: (s) {
                    print('validating code: $s');
                  },
                  onCompleted: null,
                ),
              ),
            ),
            AppFilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  log("data");
                }
              },
              fontSize: 18.sp,
              radius: 11.r,
              width: 374.w,
              height: 60.h,
              title: AppString.verify,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      text: AppString.receiveOtp,
                      color: kBlack,
                      fontSize: 14.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400),
                  customText(
                      text: AppString.resendOtp,
                      color: kGreen,
                      fontSize: 14.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400),
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
