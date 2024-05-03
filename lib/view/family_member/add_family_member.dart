import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/family_member/family_member_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddFamilyMemberScreen extends StatelessWidget {
  const AddFamilyMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Add Member"),
      body: GetBuilder<FamilyMemberController>(
        init: FamilyMemberController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: kWhite,
                          backgroundImage: const NetworkImage(
                              "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            child: CircleAvatar(
                              radius: 14.r,
                              backgroundColor: kWhite,
                              child: Center(
                                child: Icon(
                                  Icons.add_circle,
                                  color: kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: customText(
                      text: "Add Profile Picture",
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  titleSmallText(text: "Name", color: kDarkGrey),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: controller.nameController,
                    hintText: "Ex. Kanak Sharma",
                    hintStyle: TextStyle(fontSize: 16.sp, color: kBlack, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                  ),
                  SizedBox(height: 15.h),
                  titleSmallText(text: "Phone Number", color: kDarkGrey),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: controller.phoneController,
                    hintText: "Ex. 1234567890",
                  ),
                  SizedBox(height: 15.h),
                  titleSmallText(text: "gender", color: kDarkGrey),
                  SizedBox(height: 5.h),
                  customDropDown(
                    hintText: titleSmallText(text: controller.selectGender.isNotEmpty ? controller.selectGender : "Select Gender"),
                    items: controller.genderList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: titleSmallText(text: value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectGender = value;
                      controller.update();
                    },
                  ),
                  SizedBox(height: 15.h),
                  titleSmallText(text: "Relationship", color: kDarkGrey),
                  SizedBox(height: 5.h),
                  customDropDown(
                    hintText:
                        titleSmallText(text: controller.selectRelation.isNotEmpty ? controller.selectRelation : "Select Relationship"),
                    items: controller.relationList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: titleSmallText(text: value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectRelation = value;
                      controller.update();
                    },
                  ),
                  SizedBox(height: 15.h),
                  titleSmallText(text: "Add note", color: kDarkGrey),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: controller.addNoteController,
                    hintText: "Type here",
                    maxLines: 5,
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    buttonText: "",
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    onTap: () {},
                    child: Center(
                      child: headingSemiBoldText(text: "Save Member"),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
