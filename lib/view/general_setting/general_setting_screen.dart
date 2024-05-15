import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralSettingScreen extends StatelessWidget {
  const GeneralSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "General Setting"),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Stack(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
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
                  child: VerticalDivider(width: 0),
                ),
                SizedBox(width: 10.w),
                Image.asset(
                  AppAssets.mailIcon,
                  scale: 4,
                  color: kGreen,
                ),
                SizedBox(width: 10.w),
                regularText(
                  text: "email@mail.com",
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
                  child: titleSmallText(text: "+ADD", color: kGreen),
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
                  child: titleSmallText(text: "+ADD", color: kGreen),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Divider(
            height: 0,
            color: kGrey.withOpacity(0.3),
          ),
          Spacer(),
          CustomButton(
            buttonText: "",
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            child: Center(
              child: headingSemiBoldText(text: "Save"),
            ),
            onTap: () {},
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
