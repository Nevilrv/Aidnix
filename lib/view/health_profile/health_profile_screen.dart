import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_profile/health_profile_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/select_activity_dialog.dart';
import 'package:aidnix/widgets/select_cancel_reason_dialog.dart';
import 'package:aidnix/widgets/select_diseases_dialog.dart';
import 'package:aidnix/widgets/select_height_dialog.dart';
import 'package:aidnix/widgets/select_smoking_dialog.dart';
import 'package:aidnix/widgets/select_weight_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HealthProfileScreen extends StatelessWidget {
  const HealthProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(titleText: "Health profile"),
      body: GetBuilder<HealthProfileController>(
          init: HealthProfileController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  /// Height

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: titleText(text: "Height"),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              customShowDialog(
                                context: context,
                                child: SelectHeightDialog(),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: kDropDownBgColor,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  customText(
                                    text: controller.height.isNotEmpty ? controller.height : "Select height",
                                    color: Color(0xFF2B2B2B),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 30.h,
                                    color: kBlack,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Old Height DropDown

                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //         flex: 2,
                  //         child: titleText(text: "Height"),
                  //       ),
                  //       Expanded(
                  //         flex: 3,
                  //         child: Container(
                  //           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  //           decoration: BoxDecoration(
                  //             color: kDropDownBgColor,
                  //             borderRadius: BorderRadius.circular(8.r),
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Expanded(
                  //                 child: DropdownButton(
                  //                   underline: SizedBox(),
                  //                   autofocus: false,
                  //                   isDense: true,
                  //                   isExpanded: true,
                  //                   padding: EdgeInsets.zero,
                  //                   hint: customText(
                  //                     text: controller.height.isNotEmpty ? controller.height : "Select height",
                  //                     color: Color(0xFF2B2B2B),
                  //                   ),
                  //                   borderRadius: BorderRadius.circular(12.r),
                  //                   icon: SizedBox(),
                  //                   menuMaxHeight: 250.h,
                  //                   items: controller.items.map((String items) {
                  //                     return DropdownMenuItem(
                  //                       value: items,
                  //                       child: titleText(text: items),
                  //                     );
                  //                   }).toList(),
                  //                   onChanged: (String? newValue) {
                  //                     controller.height = newValue ?? "";
                  //                     controller.update();
                  //                   },
                  //                 ),
                  //               ),
                  //               Icon(
                  //                 Icons.keyboard_arrow_down_rounded,
                  //                 size: 30.h,
                  //                 color: kBlack,
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  /// Wieght

                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.2),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: titleText(text: "Weight"),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              customShowDialog(
                                context: context,
                                child: SelectWeightDialog(),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: kDropDownBgColor,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  customText(
                                    text: controller.weight.isNotEmpty ? controller.weight : "Select weight",
                                    color: Color(0xFF2B2B2B),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 30.h,
                                    color: kBlack,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// BirthDate

                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.2),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: titleText(text: "Birthdate"),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: kDropDownBgColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: customText(
                              text: "DD-MM-YYYY",
                              color: Color(0xFF2B2B2B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.2),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: titleText(text: "Activity level(exercise)"),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      customShowDialog(
                        context: context,
                        child: SelectActivityDialog(),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: kDropDownBgColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: controller.activityLevel.isNotEmpty ? controller.activityLevel : "Select Activity level",
                            color: Color(0xFF2B2B2B),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30.h,
                            color: kBlack,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: titleText(text: "Smoking"),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      customShowDialog(
                        context: context,
                        child: SelectSmokingDialog(),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: kDropDownBgColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: controller.smoking.isNotEmpty ? controller.smoking : "Select smoking",
                            color: Color(0xFF2B2B2B),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30.h,
                            color: kBlack,
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: titleText(text: "Chronic diseases"),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      customShowDialog(
                        context: context,
                        child: SelectDiseasesDialog(),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: kDropDownBgColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: controller.diseases.isNotEmpty ? controller.diseases : "Choose diseases",
                            color: Color(0xFF2B2B2B),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30.h,
                            color: kBlack,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: titleText(text: "Other chronic/ notes"),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: CustomTextField(
                      controller: controller.noteController,
                      hintText: "Write here...",
                      borderColor: kDropDownBgColor,
                      maxLines: 5,
                      borderSize: 0,
                      filled: true,
                      fillColor: kDropDownBgColor,
                      textColor: Color(0xFF2B2B2B),
                      hintStyle: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: titleText(text: "Medicine allergies"),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: CustomTextField(
                      controller: controller.medicineAllergiesController,
                      hintText: "Write here...",
                      borderColor: kDropDownBgColor,
                      maxLines: 5,
                      borderSize: 0,
                      filled: true,
                      fillColor: kDropDownBgColor,
                      textColor: Color(0xFF2B2B2B),
                      hintStyle: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: titleText(text: "Other allergies"),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: CustomTextField(
                      controller: controller.otherAllergiesController,
                      hintText: "Write here...",
                      borderColor: kDropDownBgColor,
                      maxLines: 5,
                      borderSize: 0,
                      filled: true,
                      fillColor: kDropDownBgColor,
                      textColor: Color(0xFF2B2B2B),
                      hintStyle: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: CustomButton(
                      buttonText: "",
                      child: Center(
                        child: headingSemiBoldText(text: "Save"),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            );
          }),
    );
  }
}
