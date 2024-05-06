import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/checkup/checkout_contrroler.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/filter_bottom_sheet.dart';
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
  CheckupController checkupController = Get.put(CheckupController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SafeArea(child: GetBuilder<CheckupController>(
        builder: (controller) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              customAppBar(),
              Padding(
                padding: EdgeInsets.only(top: 22.h),
                child: customSearchBar(
                    searchHint: true,
                    context: context,
                    searchController: controller.searchController,
                    onChanged: (value) {
                      controller.searchValue(value);
                    },
                    onFilterTap: () {
                      customBottomSheet(
                        context: context,
                        child: const FilterBottomSheet(),
                      );
                    }),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (controller.searchController.text.isEmpty) ...[
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
                                    comprehensive:
                                        "Blood checkup\ncomprehensive",
                                    offerPercentage: 70,
                                    price: "₹3000",
                                    newPrice: "₹2500",
                                    report: "6 Hours",
                                    type: "Pick Up, Lab Visit",
                                    onTap: () {
                                      Get.toNamed(Routes.labDetailsScreen);
                                    },
                                    addCartOnTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: kLightGreen,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30.r),
                                                topLeft: Radius.circular(30.r),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                      horizontal: 16.w)
                                                  .copyWith(
                                                      top: 12.h, bottom: 18.h),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: kWhite,
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          7.h,
                                                                      horizontal:
                                                                          7.w),
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    kLightBgColor,
                                                                radius: 30.r,
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          5.w,
                                                                      vertical:
                                                                          5.h),
                                                                  child: Image
                                                                      .asset(
                                                                    AppAssets
                                                                        .labProfile,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 0,
                                                            right: 0,
                                                            child: SvgPicture
                                                                .asset(
                                                              AppAssets
                                                                  .iconVerify,
                                                              height: 30.h,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          customText(
                                                              text:
                                                                  "Greenlab Biotech",
                                                              fontSize: 16.sp),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 3.h,
                                                                    bottom:
                                                                        6.h),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                customText(
                                                                    text:
                                                                        "1 test",
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                SizedBox(
                                                                    width: 3.w),
                                                                customText(
                                                                  text:
                                                                      "₹1200 ",
                                                                  fontSize:
                                                                      16.sp,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6.w,
                                                                    vertical:
                                                                        4.h),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: kWhite
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.r),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                customText(
                                                                    text:
                                                                        "View Test List",
                                                                    fontSize:
                                                                        12.sp,
                                                                    color:
                                                                        kBlack,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                SizedBox(
                                                                    width: 3.w),
                                                                Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 13.sp,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      CustomButton(
                                                        buttonColor: kWhite,
                                                        height: 45.h,
                                                        buttonText: "",
                                                        child: Center(
                                                          child:
                                                              regularSemiBoldText(
                                                            text: AppString
                                                                .checkout,
                                                          ),
                                                        ),
                                                        onTap: () {},
                                                      ),
                                                      SizedBox(width: 9.w),
                                                      GestureDetector(
                                                        onTap: () {
                                                          customShowDialog(
                                                            context: context,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          25.w,
                                                                      vertical:
                                                                          10.h),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20.w,
                                                                      vertical:
                                                                          25.h),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: kWhite,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.r),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 10
                                                                            .h,
                                                                        bottom:
                                                                            28.h),
                                                                    child: customText(
                                                                        text:
                                                                            "Are you Sure you want\nto delete this Test? ",
                                                                        maxLines:
                                                                            2,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        fontSize:
                                                                            24.sp),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            CustomButton(
                                                                          height:
                                                                              47.h,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.r),
                                                                          buttonColor:
                                                                              kWhite,
                                                                          border: Border.all(
                                                                              color: kLightGreen,
                                                                              width: 1),
                                                                          buttonText:
                                                                              "",
                                                                          child:
                                                                              Center(
                                                                            child: customText(
                                                                                text: AppString.yes,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 17.sp,
                                                                                color: kDarkGrey1),
                                                                          ),
                                                                          onTap:
                                                                              () {},
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              15.w),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            CustomButton(
                                                                          height:
                                                                              47.h,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.r),
                                                                          buttonColor:
                                                                              kLightGreen,
                                                                          buttonText:
                                                                              '',
                                                                          child:
                                                                              Center(
                                                                            child: customText(
                                                                                text: AppString.no,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 17.sp),
                                                                          ),
                                                                          onTap:
                                                                              () {
                                                                            Get.back();
                                                                            Get.back();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          15.h)
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 45.h,
                                                          width: 40.h,
                                                          decoration: BoxDecoration(
                                                              color: kWhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Center(
                                                            child: SvgPicture
                                                                .asset(
                                                              AppAssets.delete,
                                                              height: 25.h,
                                                              width: 25.w,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
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
                              child: Image.asset(AppAssets.dummyDoctor,
                                  scale: 3.1)),
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
                      if (controller.searchController.text.isNotEmpty) ...[
                        if (controller.searchController.text.length <= 3) ...[
                          ListView.builder(
                            itemCount: 3,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: customCartContainer(
                                  titleName: "Greenlab Biotech",
                                  rating: 5.0,
                                  noOfRating: "1.1k",
                                  noOfTest: 100,
                                  address:
                                      "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                                  offerPercentage: 20,
                                  distance: 2.2,
                                  isAddToCart: false,
                                ),
                              );
                            },
                          ),
                        ],
                        if (controller.searchController.text.length > 3) ...[
                          SizedBox(height: 100.h),
                          Center(
                            child: Image.asset(AppAssets.noDataFoundImage,
                                scale: 4),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                text: AppString.sorryNoLabs,
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
                                text:
                                    "Sorry no labs found, please modify\nyour search and try again",
                                color: Color(0xFF868796),
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
                                      text: AppString.callUs,
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
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
