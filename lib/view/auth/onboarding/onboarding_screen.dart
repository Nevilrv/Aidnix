import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/auth/auth_controller.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  AuthController authScreenController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GetBuilder<AuthController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 620.h,
                  child: PageView.builder(
                    controller: controller.pageController,
                    // physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.changeTabs(index);
                        },
                        child: Column(
                          children: [
                            assetImage(
                              controller.onBoardList[index]['image'],
                              height: 415.h,
                              width: 601.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40.h, bottom: 21.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customText(text: AppString.welcome, color: kBlack, fontSize: 32.sp, fontWeight: FontWeight.w700),
                                  customText(text: AppString.aidNix, color: kGreen, fontSize: 32.sp, fontWeight: FontWeight.w700)
                                ],
                              ),
                            ),
                            customText(
                                text: "${controller.onBoardList[index]['text']}",
                                color: kBlack,
                                fontSize: 16.sp,
                                maxLines: 1,
                                fontWeight: FontWeight.w500),
                            customText(
                                textAlign: TextAlign.center,
                                text: "${controller.onBoardList[index]['detailText']}",
                                color: kBlack,
                                fontSize: 16.sp,
                                maxLines: 2,
                                fontWeight: FontWeight.w300),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      height: 8.h,
                      width: controller.selected == index ? 32.w : 8.w,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r), color: kLightGreen),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.h, bottom: 42.h),
                  child: CustomButton(
                    buttonText: "",
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    child: Center(
                      child: regularSemiBoldText(text: AppString.signIn),
                    ),
                    onTap: () {
                      controller.nextPage();
                    },
                  ),
                ),
                controller.selected == 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 28.h,
                            width: 28.w,
                            child: Checkbox(
                                activeColor: controller.check ? kGreen : kRed,
                                value: controller.check,
                                onChanged: (value) {
                                  controller.checkValue(value);
                                }),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          customText(
                              textAlign: TextAlign.center,
                              text: AppString.agreeTo,
                              color: controller.check ? kDarkGrey1 : kRed,
                              fontSize: 12.sp,
                              maxLines: 2,
                              fontWeight: FontWeight.w400),
                          customText(
                              textAlign: TextAlign.center,
                              text: AppString.termsConditions,
                              color: controller.check ? kGreen : kRed,
                              fontSize: 12.sp,
                              maxLines: 2,
                              fontWeight: FontWeight.w400),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          );
        },
      )),
    );
  }
}
