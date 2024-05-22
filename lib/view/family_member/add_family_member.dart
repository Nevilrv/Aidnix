import 'dart:developer';
import 'dart:io';
import 'package:aidnix/theme/app_layout.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/family_member/family_member_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  const AddFamilyMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {
  FamilyMemberController familyMemberController = Get.put(FamilyMemberController());
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    familyMemberController.nameController.clear();
    familyMemberController.phoneController.clear();
    familyMemberController.ageController.clear();
    familyMemberController.addNoteController.clear();
    familyMemberController.selectGender = '';
    familyMemberController.selectRelation = '';
    familyMemberController.pickedImage = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Add Member"),
      body: GetBuilder<FamilyMemberController>(
        init: FamilyMemberController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                FilePickerResult? image = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpeg'],
                                );
                                if (image != null) {
                                  controller.pickedImage = image.files.single.path ?? "";
                                  controller.update();
                                  log('pickedImage.path===========>>>>${controller.pickedImage}');
                                }
                              } catch (e) {
                                log("EEEEEE_________$e");
                              }
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: kLightBgColor),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: controller.pickedImage.isNotEmpty
                                    ? Image.file(
                                        File(controller.pickedImage),
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: 100,
                                        color: kGreen,
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
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
                      hintText: "Full Name",
                      hintStyle: TextStyle(fontSize: 16.sp, color: kBlack, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Please Enter Valid Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    titleSmallText(text: "Phone Number", color: kDarkGrey),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: controller.phoneController,
                      hintText: "12345 67890",
                      keyboardType: TextInputType.number,
                      hintStyle: TextStyle(fontSize: 16.sp, color: kBlack, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      maxLength: 10,
                    ),
                    SizedBox(height: 15.h),
                    titleSmallText(text: "Age", color: kDarkGrey),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: controller.ageController,
                      hintText: "Enter age",
                      keyboardType: TextInputType.number,
                      hintStyle: TextStyle(fontSize: 16.sp, color: kBlack, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Please Enter Valid Age";
                        } else {
                          return null;
                        }
                      },
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
                      hintStyle: TextStyle(fontSize: 16.sp, color: kBlack, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      maxLines: 5,
                      maxLength: 1000,
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      buttonText: "",
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          if (controller.selectGender.isNotEmpty) {
                            if (controller.selectRelation.isNotEmpty) {
                              /// Add Family Member Api

                              Map<String, dynamic> body1 = {
                                "name": controller.nameController.text,
                                "age": int.parse(controller.ageController.text),
                                "relation": controller.selectRelation,
                                "gender": controller.selectGender,
                                "phone_number": controller.phoneController.text.trim(),
                                "note": controller.addNoteController.text,
                              };

                              controller.addFamilyMemberApi(body: body1);
                            } else {
                              showErrorSnackBar("Please Select Relation");
                            }
                          } else {
                            showErrorSnackBar("Please Select Gender");
                          }
                        }
                      },
                      child: controller.isAddDataLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Center(
                              child: headingSemiBoldText(text: "Save Member"),
                            ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
