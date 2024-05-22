import 'dart:developer';
import 'dart:io';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/profile/profile_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GeneralSettingScreen extends StatefulWidget {
  const GeneralSettingScreen({super.key});

  @override
  State<GeneralSettingScreen> createState() => _GeneralSettingScreenState();
}

class _GeneralSettingScreenState extends State<GeneralSettingScreen> {
  ProfileController profileController = Get.put<ProfileController>(ProfileController());

  @override
  void initState() {
    profileController.isAddEmail = false;
    profileController.isAddGender = false;
    profileController.emailController.clear();
    profileController.selectGender = "";
    profileController.profileImage = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "General Setting"),
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: 10.h),
                Stack(
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: controller.profileImage != null
                            ? DecorationImage(
                                image: FileImage(
                                  File(controller.profileImage?.path ?? ""),
                                ),
                                fit: BoxFit.cover,
                              )
                            : const DecorationImage(
                                image: NetworkImage(
                                  // controller.profileData?.profilePic?.id ??
                                  "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          FilePickerResult? image = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['jpeg'],
                          );
                          if (image != null) {
                            if (image.files.isNotEmpty) {
                              controller.profileImage = image.files.first;
                              controller.update();
                              log('Profile Image Path ::::::::::::::: ${controller.profileImage?.path}');
                            }
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: kWhite,
                          radius: 17.r,
                          child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: kGreen,
                            child: Image.asset(
                              AppAssets.editIcon,
                              scale: 3.5,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                customText(
                  text: "Ahsan Hasan",
                  fontSize: 20.sp,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.callIcon,
                        scale: 3,
                        color: kGreen,
                      ),
                      SizedBox(width: 10.w),
                      regularText(
                        text: "+91 1234567890",
                        color: kDarkGrey1,
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        height: 20.h,
                        child: const VerticalDivider(width: 0),
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        AppAssets.mailIcon,
                        scale: 4,
                        color: kGreen,
                      ),
                      SizedBox(width: 10.w),
                      regularText(
                        text: controller.profileData?.email ?? "email@mail.com",
                        color: kDarkGrey1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: titleText(text: "Email"),
                      ),
                      Expanded(
                        flex: 2,
                        child: controller.isAddEmail
                            ? CustomTextField(
                                controller: controller.emailController,
                                contentPadding: EdgeInsets.zero,
                                borderRadius: 0,
                                borderColor: kWhite,
                                borderSize: 0,
                                isDense: true,
                                hintText: "Enter your email",
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.isAddEmail = true;
                                  controller.update();
                                },
                                child: titleSmallText(text: "+ADD", color: kGreen),
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(
                  height: 0,
                  color: kGrey.withOpacity(0.3),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: titleText(text: "Gender"),
                      ),
                      Expanded(
                        flex: 2,
                        child: controller.isAddGender
                            ? customDropDown(
                                borderColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                                hintText:
                                    titleSmallText(text: controller.selectGender.isNotEmpty ? controller.selectGender : "Select Gender"),
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
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.isAddGender = true;
                                  controller.update();
                                },
                                child: titleSmallText(text: "+ADD", color: kGreen),
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(
                  height: 0,
                  color: kGrey.withOpacity(0.3),
                ),
                const Spacer(),
                CustomButton(
                  buttonText: "",
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Center(
                    child: headingSemiBoldText(text: "Save"),
                  ),
                  onTap: () {
                    controller.updateGeneralSetting();
                  },
                ),
                SizedBox(height: 50.h),
              ],
            );
          }),
    );
  }
}
