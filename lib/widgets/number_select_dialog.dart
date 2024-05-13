import 'dart:developer';

import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Widgets/app_button.dart';
import 'package:aidnix/view/auth/auth_controller.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NumberSelectDialog extends StatelessWidget {
  NumberSelectDialog({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
              headingText(text: "Select Mobile Number"),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.simInfo?.cards.length,
                  // itemCount: 3,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    log('controller.simInfo.cards.length2===========>>>>${controller.simInfo?.cards.length}');
                    return GestureDetector(
                      onTap: () {
                        log('index===========>>>>${index}');
                        controller.numberSelect = index;
                        controller.update();
                        // Get.back();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Row(
                            children: [
                              controller.numberSelect == index ? Icon(Icons.check_box, color: kPrimary) : Icon(Icons.check_box_outline_blank, color: kGrey),
                              SizedBox(width: 10.w),
                              headingText(text: controller.simInfo?.cards[index].phoneNumber ?? '${controller.simInfo?.cards[index].displayName}'),
                              // headingText(text: '1234567890 $index'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }
}
