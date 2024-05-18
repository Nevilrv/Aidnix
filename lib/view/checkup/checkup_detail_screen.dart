import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/checkup/checkup_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckupDetailScreen extends StatefulWidget {
  const CheckupDetailScreen({super.key});

  @override
  State<CheckupDetailScreen> createState() => _CheckupDetailScreenState();
}

class _CheckupDetailScreenState extends State<CheckupDetailScreen> {
  CheckUpController checkUpController = Get.put<CheckUpController>(CheckUpController());

  @override
  void initState() {
    checkUpController.categoryId = Get.arguments != null ? Get.arguments["categoryId"] : "";

    if (checkUpController.categoryId.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        checkUpController.categoryDetailAPI();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Checkup"),
      body: GetBuilder<CheckUpController>(
        init: CheckUpController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: SafeArea(
              child: controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: kGreen,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        if (controller.categoryDetailList.isNotEmpty) ...[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 10.h),
                                  checkupAddCart(
                                    color: kWhite,
                                    title: Positioned(
                                      top: 30.h,
                                      left: 20.w,
                                      child: customText(
                                          textAlign: TextAlign.center,
                                          text: AppString.blood,
                                          fontSize: 24.sp,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    details: Positioned(
                                      top: 65.h,
                                      left: 20.w,
                                      child: customText(
                                          textAlign: TextAlign.start,
                                          text: AppString.bloodDetails,
                                          fontSize: 12.sp,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    image: Positioned(
                                      right: 12.w,
                                      child: Image.asset(AppAssets.dummy, height: 174.h, width: 169.w),
                                    ),
                                    circleColor: kPrimary.withOpacity(0.1),
                                    child: const SizedBox(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12.h),
                                    child: ListView.builder(
                                      itemCount: controller.categoryDetailList.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(vertical: 12.h),
                                          child: checkupCartContainer(
                                            comprehensive: controller.categoryDetailList[index].name ?? "Blood checkup\ncomprehensive",
                                            offerPercentage: controller.categoryDetailList[index].discountTag ?? "70",
                                            price: "₹${controller.categoryDetailList[index].amount ?? 0}",
                                            newPrice: "₹${controller.categoryDetailList[index].totalPrice ?? 0}",
                                            report: "${controller.categoryDetailList[index].reportTime ?? 0} Hours",
                                            type: "Pick Up, Lab Visit",
                                            onTap: () {
                                              Get.toNamed(Routes.testDetailsScreen);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  checkupAddCart(
                                    color: kGreen10,
                                    title: Positioned(
                                      top: 15.h,
                                      left: 20.w,
                                      child: customText(
                                          textAlign: TextAlign.start,
                                          text: "Can’t find what you\nlooking for?",
                                          fontSize: 18.sp,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    details: Positioned(
                                      top: 72.h,
                                      left: 20.w,
                                      child: customText(
                                          textAlign: TextAlign.start,
                                          text: "say “HI” on WhatsApp",
                                          fontSize: 12.sp,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    image: Positioned(right: 0, child: Image.asset(AppAssets.dummyDoctor, scale: 3.1)),
                                    circleColor: kPrimary.withOpacity(0.1),
                                    child: Positioned(
                                      top: 110.h,
                                      left: 20.w,
                                      child: CustomButton(
                                        height: 47.h,
                                        borderRadius: BorderRadius.circular(10.r),
                                        buttonColor: kWhite,
                                        buttonText: AppString.addToCart,
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.whatsapp,
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            customText(
                                                text: AppString.chatWithUs,
                                                color: kLightGreen,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                        ],
                        if (controller.categoryDetailList.isEmpty) ...[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 100.h),
                                  Center(
                                    child: Image.asset(AppAssets.noDataFoundImage, scale: 4),
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customText(
                                        text: "Sorry No Labs Found",
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      regularText(
                                        text: "Sorry no labs found, please modify\nyour search and try again",
                                        color: const Color(0xFF868796),
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        buttonText: "",
                                        child: Row(
                                          children: [
                                            regularSemiBoldText(
                                              text: "Call us",
                                            ),
                                            SizedBox(width: 5.w),
                                            Icon(Icons.arrow_forward, size: 25.w)
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
