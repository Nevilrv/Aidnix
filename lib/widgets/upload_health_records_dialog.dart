import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_records/health_records_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadHealthRecordsDialog extends StatelessWidget {
  const UploadHealthRecordsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthRecordsController>(
        init: HealthRecordsController(),
        builder: (controller) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                    customText(text: "Upload Health Records", fontSize: 20.sp),
                    SizedBox(height: 10.h),
                    regularText(
                      text: "Please upload of valid Health Records from your doctor",
                      color: kDarkGrey1,
                      maxLines: 3,
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: kLightBgColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.asset(AppAssets.fileIcon, scale: 4),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: customText(
                              text: "Manish_Blood_Test_20241",
                              color: kGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "User", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration:
                          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8.r), border: Border.all(color: kLightGrey)),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              underline: SizedBox(),
                              autofocus: false,
                              isDense: true,
                              isExpanded: true,
                              padding: EdgeInsets.zero,
                              hint: customText(
                                text: controller.mySelf.isNotEmpty ? controller.mySelf : "Select My Self",
                                color: Color(0xFF2B2B2B),
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                              icon: SizedBox(),
                              menuMaxHeight: 250.h,
                              items: controller.items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: titleText(text: items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.mySelf = newValue ?? "";
                                controller.update();
                              },
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30.h,
                            color: kBlack,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "Type of record", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration:
                          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8.r), border: Border.all(color: kLightGrey)),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              underline: SizedBox(),
                              autofocus: false,
                              isDense: true,
                              isExpanded: true,
                              padding: EdgeInsets.zero,
                              hint: customText(
                                text: controller.typeOfRecord.isNotEmpty ? controller.typeOfRecord : "Select Report",
                                color: Color(0xFF2B2B2B),
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                              icon: SizedBox(),
                              menuMaxHeight: 250.h,
                              items: controller.items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: titleText(text: items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.typeOfRecord = newValue ?? "";
                                controller.update();
                              },
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30.h,
                            color: kBlack,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "Lab Name", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: controller.labNameController,
                      hintText: "Enter lab name",
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "Doctor Name", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: controller.drNameController,
                      hintText: "Enter doctor name",
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: CustomButton(
                        buttonText: "",
                        child: Center(
                          child: headingSemiBoldText(text: "Save"),
                        ),
                        onTap: () {},
                      ),
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
