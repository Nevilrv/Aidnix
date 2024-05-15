import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/health_records/health_records_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/rename_file_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditHealthRecordsScreen extends StatelessWidget {
  const EditHealthRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Health Records"),
      body: GetBuilder<HealthRecordsController>(
          init: HealthRecordsController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingText(text: "Edit Records"),
                    SizedBox(height: 20.h),
                    regularText(text: "Name", color: kDarkGrey1),
                    SizedBox(height: 10.h),
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
                              text: controller.docNameController.text.trim().isNotEmpty
                                  ? controller.docNameController.text.trim()
                                  : "Manish_Blood_Test_20241",
                              color: kGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            customShowDialog(
                              context: context,
                              child: RenameFileDialog(),
                            );
                          },
                          child: Image.asset(AppAssets.editIconGreen, scale: 4),
                        ),
                        SizedBox(width: 25.w),
                        GestureDetector(
                          onTap: () {
                            controller.deleteHealthDocs(docId: "");
                          },
                          child: Image.asset(AppAssets.deleteIconRed, scale: 4),
                        ),
                        SizedBox(width: 20.w),
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
                              items: controller.userList.map((String items) {
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
                    regularText(text: "Type of record", color: kDarkGrey1),
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
                                text: controller.typeOfRecord.isNotEmpty ? controller.typeOfRecord : "Select Report",
                                color: Color(0xFF2B2B2B),
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                              icon: SizedBox(),
                              menuMaxHeight: 250.h,
                              items: controller.typeOfRecordsList.map((String items) {
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
                          Image.asset(AppAssets.arrowDown, scale: 4),
                        ],
                      ),
                    ),

                    /// Old Field

                    // SizedBox(height: 20.h),
                    // regularText(text: "Lab Name", color: kDarkGrey1),
                    // SizedBox(height: 10.h),
                    // CustomTextField(
                    //   controller: controller.labNameController,
                    //   hintText: "Enter lab name",
                    // ),
                    // SizedBox(height: 20.h),
                    // regularText(text: "Doctor Name", color: kDarkGrey1),
                    // SizedBox(height: 10.h),
                    // CustomTextField(
                    //   controller: controller.drNameController,
                    //   hintText: "Enter doctor name",
                    // ),

                    SizedBox(height: 50.h),
                    CustomButton(
                      buttonText: "",
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Center(
                        child: headingSemiBoldText(text: "Save"),
                      ),
                      onTap: () {
                        controller.editHealthDocs(docId: "");
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
