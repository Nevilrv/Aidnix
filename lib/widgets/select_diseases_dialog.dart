import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_profile/health_profile_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectDiseasesDialog extends StatelessWidget {
  const SelectDiseasesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthProfileController>(
        init: HealthProfileController(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            constraints: BoxConstraints(maxHeight: 500.h),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      headingText(text: "Chronic diseases"),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.cancel_outlined),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(
                  height: 0,
                  color: kLightBgColor,
                  thickness: 1.5,
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.diseasesList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 20.w),
                                Icon(
                                  Icons.circle_outlined,
                                  color: kLightBgColor,
                                ),
                                SizedBox(width: 20.w),
                                titleText(
                                  text: controller.diseasesList[index],
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Divider(height: 0, color: kLightBgColor, thickness: 1.5),
                            SizedBox(height: 10.h),
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
                    child: headingSemiBoldText(text: "Save"),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        });
  }
}
