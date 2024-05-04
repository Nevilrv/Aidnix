import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadPrescriptionDialog extends StatelessWidget {
  const UploadPrescriptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            customText(text: "Upload prescription", fontSize: 20.sp),
            SizedBox(height: 10.h),
            regularText(
              text: "Please upload of valid prescription from your doctor",
              color: kDarkGrey1,
              maxLines: 3,
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    buttonText: "",
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        Image.asset(AppAssets.fileImage, scale: 4),
                        SizedBox(height: 10.h),
                        customText(text: "Upload file"),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 40.w),
                Expanded(
                  child: CustomButton(
                    buttonText: "",
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        Image.asset(AppAssets.camera, scale: 4),
                        SizedBox(height: 8.h),
                        customText(text: "Take Photo"),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(text: "Note: "),
                Expanded(
                  child: regularText(
                    text: "Always upload a clean version of your prescription for getting better result.",
                    color: kDarkGrey1,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            regularText(
              text: "Max limit: 5mb",
              color: kDarkGrey1,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
