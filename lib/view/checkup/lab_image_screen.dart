import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/custom_widget.dart';
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
      appBar: AppBar(
        title: customText(
            text: AppString.labDetails, fontSize: 18.sp, color: kWhite),
        centerTitle: true,
        surfaceTintColor: kBlack,
        backgroundColor: kBlack,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 23.sp,
            color: kWhite,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            assetImage(AppAssets.labImage, height: 642.h, width: 432.w)
          ],
        ),
      ),
    );
  }
}
