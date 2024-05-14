import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/custom_widget.dart';
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
  void initState() {
    // TODO: implement initState
    authScreenController.otpToken = Get.arguments['otp_token'] ?? "";
    super.initState();
  }

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
                    child: assetImage(AppAssets.logo, height: 105.h, width: 108.w),
                  ),
                  customText(text: AppString.welcomeToAidNix, color: kWhite, fontSize: 24.sp, fontWeight: FontWeight.w600),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 97.h, bottom: 5.h),
              child: customText(text: AppString.enterYourOtp, fontSize: 24.sp, fontWeight: FontWeight.w600),
            ),
            customText(text: AppString.otpDetails, fontSize: 14.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w400),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w).copyWith(top: 24.h, bottom: 40.h),
              child: Form(
                key: formKey,
                child: Pinput(
                  length: 4,
                  errorPinTheme: PinTheme(
                    width: 79.w,
                    height: 80.h,
                    textStyle: TextStyle(
                      fontSize: 22.sp,
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
                      fontSize: 22.sp,
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
                  validator: (value) {
                    print('validating code: $value');
                    if (value!.isEmpty) {
                      return AppString.pleaseEnterOtp;
                    } else if (value.length < 4) {
                      return "Please Enter Valid OTP";
                    } else {
                      return null;
                    }
                  },
                  onCompleted: null,
                ),
              ),
            ),
            CustomButton(
              buttonText: "",
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Center(
                child: regularSemiBoldText(text: AppString.verify),
              ),
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  await controller.otpVerify(controller.otpController.text, controller.otpToken);
                  // Get.offAllNamed(Routes.dashboardScreen);
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      text: AppString.receiveOtp, color: kBlack, fontSize: 14.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w400),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () async {
                      await controller.loginAPI(resendOtp: true);
                    },
                    child: customText(
                        text: AppString.resendOtp,
                        color: kGreen,
                        fontSize: 14.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
