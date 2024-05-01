import 'package:aidnix/Constant/app_assets.dart';

import 'package:aidnix/Constant/app_string.dart';
import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Utils/app_routes.dart';
import 'package:aidnix/Utils/custom_widget%20.dart';
import 'package:aidnix/Widgets/app_button.dart';
import 'package:aidnix/Widgets/app_textfield.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  text: AppString.enterYourPhone,
                  color: kBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            customText(
                text: AppString.enterYourDetails,
                color: kBlack,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w)
                  .copyWith(top: 32.h, bottom: 60.h),
              child: Form(
                key: formKey,
                child: AppCommonTextField(
                    prefixIcon: const CountryCodePicker(
                      padding: EdgeInsets.zero,
                      initialSelection: 'IN',
                      favorite: ['+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      showFlag: false,
                    ),
                    controller: controller.numberController,
                    textInputType: TextInputType.number,
                    labelText: "",
                    validator: (value) {
                      if (controller.numberController.text.isEmpty) {
                        return AppString.pleaseEnterValid;
                      } else if (value.length != 10) {
                        return AppString.pleaseEnterValid;
                      } else {
                        return null;
                      }
                    }),
              ),
            ),
            AppFilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.toNamed(Routes.otpScreen);
                }
              },
              fontSize: 18.sp,
              radius: 11.r,
              width: 374.w,
              height: 60.h,
              title: AppString.sendOtp,
            ),
          ],
        );
      },
    ));
  }
}
