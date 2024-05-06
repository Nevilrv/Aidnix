import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/checkup/checkout_contrroler.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CheckOutDetailsLabScreen extends StatefulWidget {
  const CheckOutDetailsLabScreen({super.key});

  @override
  State<CheckOutDetailsLabScreen> createState() =>
      _CheckOutDetailsLabScreenState();
}

class _CheckOutDetailsLabScreenState extends State<CheckOutDetailsLabScreen> {
  CheckupController checkupController = Get.put(CheckupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: AppString.checkoutDetails, fontSize: 18.sp),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GetBuilder<CheckupController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 10.h),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(color: kDarkWhite, blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 13.h),
                        child: Row(
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
                            customText(
                                text: "Greenlab Biotech", fontSize: 18.sp)
                          ],
                        ),
                      ),
                    ),
                  ),
                  customText(text: "Ordered Tests", fontSize: 15.sp),
                  customText(
                      text: "3 Tests",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: kDarkGrey1),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 12.h),
                            itemCount: 3,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(15.r),
                                      boxShadow: [
                                        BoxShadow(
                                            color: kDarkWhite, blurRadius: 3)
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 13.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 45.h,
                                          width: 45.h,
                                          decoration: BoxDecoration(
                                              color:
                                                  kLightGreen.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(8.r)),
                                          child: Image.asset(
                                            controller.orderedTestsData[index]
                                                ['image'],
                                            scale: 2.7,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        customText(
                                            text: controller
                                                    .orderedTestsData[index]
                                                ['name'],
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                        const Spacer(),
                                        customText(
                                          text: "₹299",
                                          fontSize: 18.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(15.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: kDarkWhite, blurRadius: 3)
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                        text: AppString.schedule,
                                        fontSize: 18.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w, top: 15.h),
                                        child: customText(
                                          text: "On 20 January, 2023",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w, top: 7.h, bottom: 6.h),
                                        child: Container(
                                          height: 45.h,
                                          width: 165.w,
                                          decoration: BoxDecoration(
                                              color: kLightGreen,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: kDarkWhite,
                                                    blurRadius: 3)
                                              ]),
                                          child: Center(
                                            child: customText(
                                              text: "10:00 PM-11:00 PM",
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(height: 18.h)
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: checkoutDetailsCard(
        check: 'Check out Details',
        price: '₹1795',
        payment: 'Payment Method',
        paymentPrice: 'visa ending 1234',
        type: 'Pick Up',
        discount: '₹299',
        button: CustomButton(
          height: 56.h,
          buttonText: "",
          child: Center(
              child: customText(
                  text: AppString.purchase,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp)),
          onTap: () {},
        ),
      ),
    );
  }
}
