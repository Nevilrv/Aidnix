import 'dart:developer';

import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/utils/shared_prefs.dart';
import 'package:aidnix/view/auth/auth_controller.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());
  _onInit() async {
    log('preferences Token ===========>>>>${preferences.getString(SharedPreference.token)}');
    Future.delayed(const Duration(seconds: 3), () {
      if (preferences.getString(SharedPreference.token) != null && preferences.getString(SharedPreference.token).toString() != "") {
        Get.offAllNamed(Routes.dashboardScreen);
      } else {
        Get.offAllNamed(Routes.onboardingScreen);
      }
    });
  }

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("MediaQuery.of(context).devicePixelRatio;___${MediaQuery.of(context).devicePixelRatio}");
    return Scaffold(
      body: Container(
        height: 932.h,
        width: 432.w,
        decoration: BoxDecoration(
          color: kGreen1,
          image: const DecorationImage(image: AssetImage(AppAssets.splashBG), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            assetImage(AppAssets.logo, height: 105.h, width: 108.w),
            Padding(
              padding: EdgeInsets.only(top: 22.h, bottom: 5.h),
              child: customText(
                text: AppString.welcomeToAidNix,
                color: kWhite,
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            customText(text: AppString.splashDetails, color: kBlack, fontSize: 14.sp, fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }
}
