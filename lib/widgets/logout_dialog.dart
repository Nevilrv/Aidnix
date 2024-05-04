import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_profile/health_profile_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthProfileController>(
        init: HealthProfileController(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: titleText(text: "Are you sure you want to logout?", textAlign: TextAlign.center),
                ),
                SizedBox(height: 30.h),
                Divider(
                  height: 0,
                  color: kGrey.withOpacity(0.3),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: titleText(
                          text: "CANCEL",
                          color: Color(0xFF595959),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    SizedBox(
                      height: 80.h,
                      child: VerticalDivider(
                        color: kGrey.withOpacity(0.3),
                        width: 0,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                      child: GestureDetector(
                        onTap: () {},
                        child: titleText(
                          text: "LOGOUT",
                          color: Color(0xFFF14D4D),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
