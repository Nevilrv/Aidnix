import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_profile/health_profile_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectActivityDialog extends StatelessWidget {
  const SelectActivityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthProfileController>(
        init: HealthProfileController(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            constraints: BoxConstraints(maxHeight: 300.h),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    headingText(text: "Select Activity"),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.cancel_outlined),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.healthData?.dropDowns?.activityLevels?.length ?? 0,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: GestureDetector(
                          onTap: () {
                            controller.activityLevel = controller.healthData?.dropDowns?.activityLevels?[index] ?? "";
                          },
                          child:
                              titleText(text: controller.healthData?.dropDowns?.activityLevels?[index] ?? "", textAlign: TextAlign.center),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  buttonText: "",
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Center(
                    child: headingSemiBoldText(text: "Save"),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        });
  }
}
