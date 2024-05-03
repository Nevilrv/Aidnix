import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_profile/health_profile_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectCancelReasonDialog extends StatelessWidget {
  const SelectCancelReasonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthProfileController>(
        init: HealthProfileController(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            constraints: BoxConstraints(maxHeight: 600.h),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                headingText(text: "Reason for Cancellation"),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cancelReasonList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle_outlined,
                                  color: kGreen,
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: customText(
                                    text: controller.cancelReasonList[index],
                                    maxLines: 5,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  buttonText: "",
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Center(
                    child: headingSemiBoldText(text: "Processed"),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 15.h),
              ],
            ),
          );
        });
  }
}
