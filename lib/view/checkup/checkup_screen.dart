import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckupScreen extends StatefulWidget {
  const CheckupScreen({super.key});

  @override
  State<CheckupScreen> createState() => _CheckupScreenState();
}

class _CheckupScreenState extends State<CheckupScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            customAppBar(),
            Padding(
              padding: EdgeInsets.only(top: 26.h),
              child: customSearchBar(
                  searchHint: false,
                  context: context,
                  searchController: searchController),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                          child: Image.asset(AppAssets.dummy,
                              height: 174.h, width: 169.w)),
                      circleColor: kPrimary.withOpacity(0.1),
                      child: const SizedBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: checkupCartContainer(
                                comprehensive: "Blood checkup\ncomprehensive",
                                offerPercentage: 70,
                                price: "₹3000",
                                newPrice: "₹2500",
                                report: "6 Hours",
                                type: "Pick Up, Lab Visit",
                                onTap: () {
                                  Get.toNamed(Routes.labDetailsScreen);
                                }),
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
                      image: Positioned(
                          right: 0,
                          child:
                              Image.asset(AppAssets.dummyDoctor, scale: 3.1)),
                      circleColor: kPrimary.withOpacity(0.1),
                      child: Positioned(
                        top: 110.h,
                        left: 20.w,
                        child: CustomButton(
                          height: 47.h,
                          width: 165.w,
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
                              customText(text: AppString.chatWithUs, color: kLightGreen, fontSize: 12.sp, fontWeight: FontWeight.w500),
                              customText(
                                  text: AppString.chatWithUs,
                                  color: kLightGreen,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
