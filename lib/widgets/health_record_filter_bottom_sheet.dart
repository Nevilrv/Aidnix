import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_records/health_records_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HealthRecordFilterBottomSheet extends StatelessWidget {
  const HealthRecordFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: GetBuilder<HealthRecordsController>(
          init: HealthRecordsController(),
          builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              constraints: BoxConstraints(maxHeight: 550.h),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 5.w),
                        customText(text: "Filter", fontSize: 22.sp, fontWeight: FontWeight.w600),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: kGrey,
                            size: 30.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "User", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    Container(
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
                          Image.asset(AppAssets.arrowDown, scale: 4),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "Date", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: controller.dateController,
                      hintText: "DD/MM/YYYY",
                      suffixIcon: Icon(Icons.calendar_month_outlined),
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
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          buttonText: "Reset",
                          textStyle: TextStyle(color: kGreen, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                          border: Border.all(color: kGreen),
                          buttonColor: kWhite,
                          onTap: () {},
                        ),
                        CustomButton(
                          buttonText: "Apply",
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
