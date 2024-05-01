import 'package:aidnix/Constant/app_assets.dart';
import 'package:aidnix/Constant/app_string.dart';
import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Utils/custom_widget%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LabImageScreen extends StatefulWidget {
  const LabImageScreen({super.key});

  @override
  State<LabImageScreen> createState() => _LabImageScreenState();
}

class _LabImageScreenState extends State<LabImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 28.w).copyWith(top: 10.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  customText(
                      text: AppString.labDetails,
                      fontSize: 18.sp,
                      color: kWhite,
                      fontWeight: FontWeight.w500),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(height: 60.h),
            assetImage(AppAssets.labImage, height: 642.h, width: 432.w)
          ],
        ),
      ),
    );
  }
}
