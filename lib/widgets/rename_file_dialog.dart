import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_records/health_records_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RenameFileDialog extends StatelessWidget {
  const RenameFileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthRecordsController>(
        init: HealthRecordsController(),
        builder: (controller) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              constraints: BoxConstraints(maxHeight: 750.h),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customText(text: "Rename the file", fontSize: 20.sp),
                    SizedBox(height: 20.h),
                    regularText(text: "File name", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: controller.docNameController,
                      hintText: "Enter file name",
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      buttonText: "",
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Center(
                        child: headingSemiBoldText(text: "Save"),
                      ),
                      onTap: () {
                        controller.update();
                        Get.back();
                      },
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
