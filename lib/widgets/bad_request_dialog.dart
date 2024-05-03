import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BadRequestDialog extends StatelessWidget {
  const BadRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: kGreen10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image: NetworkImage("https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(text: "Profile Picture updated!", decoration: TextDecoration.none),
                    SizedBox(height: 3.h),
                    customText(
                      text: "Your profile picture has been updated",
                      color: kDarkGrey1,
                      fontSize: 12.sp,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.cancel_outlined,
                  color: Color(0xFF87BBA7),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close, color: kDarkGrey),
                  ),
                ],
              ),
              Image.asset(AppAssets.badRequest, scale: 4),
              SizedBox(height: 30.h),
              titleText(
                textAlign: TextAlign.center,
                text: "You are selecting test from\ndifferrent lab, it will replace your\ncurrent selected test",
              ),
              SizedBox(height: 30.h),
              CustomButton(
                buttonText: '',
                onTap: () {
                  Get.back();
                },
                child: Center(
                  child: headingSemiBoldText(text: "Okay"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
