import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/checkup/checkout_contrroler.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LabCartPageScreen extends StatefulWidget {
  const LabCartPageScreen({super.key});

  @override
  State<LabCartPageScreen> createState() => _LabCartPageScreenState();
}

class _LabCartPageScreenState extends State<LabCartPageScreen> {
  CheckupController checkupController = Get.put(CheckupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: AppString.cart, fontSize: 18.sp),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 23.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: GetBuilder<CheckupController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.h, bottom: 18.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundColor: kLightBgColor,
                                radius: 30.r,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  child: Image.asset(
                                    AppAssets.labProfile,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -3.h,
                                right: -3.w,
                                child: SvgPicture.asset(
                                  AppAssets.iconVerify,
                                  height: 30.h,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              customText(
                                  text: "Greenlab Biotech Tests",
                                  fontSize: 18.sp),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: kLightGreen.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customText(
                                      text: "View lab details",
                                      fontSize: 11.sp,
                                      color: kBlack,
                                    ),
                                    SizedBox(width: 3.w),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 13.sp,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    customText(
                        text: "3 Tests added",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 9.h),
                            child: Container(
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(color: kLightGrey, blurRadius: 3)
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.w, vertical: 17.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        customText(
                                            text: controller
                                                .checkupCardList[index],
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(width: 10.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 3.h),
                                          decoration: BoxDecoration(
                                            color: kLightGreen.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Center(
                                            child: customText(
                                              text: "30%",
                                              fontSize: 11.sp,
                                              color: kBlack,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9.h),
                                    index == 1
                                        ? Container(
                                            width: 85.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                              color: kOrange,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Center(
                                              child: customText(
                                                  text: "campaign",
                                                  fontSize: 11.sp,
                                                  color: kWhite,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        : const SizedBox(),
                                    SizedBox(height: 3.h),
                                    Row(
                                      children: [
                                        customText(
                                            text: "₹4000",
                                            fontSize: 15.sp,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: kDarkGrey,
                                            fontWeight: FontWeight.w400),
                                        SizedBox(width: 8.w),
                                        customText(
                                            text: "₹349",
                                            fontSize: 20.sp,
                                            color: kGreen1,
                                            fontWeight: FontWeight.w600),
                                        const Spacer(),
                                        Container(
                                          width: 40.h,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            color: kRed.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppAssets.delete,
                                              height: 22.h,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            )),
      ),
      bottomNavigationBar: commonBottomCard(
        subtotal: '₹1496',
        gst: '₹299',
        discount: '₹299',
        price: '₹1795',
        button: CustomButton(
          height: 56.h,
          buttonText: "",
          child: Center(
              child: customText(
                  text: AppString.proceed,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp)),
          onTap: () {
            customShowDialog(
              context: context,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.wrongCart,
                      height: 60.h,
                      width: 60.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      child: customText(
                          text:
                              "You are selecting a test from differrent lab, it will replace your current selected tests",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          fontSize: 18.sp),
                    ),
                    CustomButton(
                        height: 56.h,
                        buttonText: "",
                        child: Center(
                            child: customText(
                                text: AppString.oK,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp)),
                        onTap: () {
                          Get.toNamed(Routes.paymentPageScreen);
                        }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
