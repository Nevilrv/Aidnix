import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/checkup/checkout_contrroler.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingSlotScreen extends StatefulWidget {
  const BookingSlotScreen({super.key});

  @override
  State<BookingSlotScreen> createState() => _BookingSlotScreenState();
}

class _BookingSlotScreenState extends State<BookingSlotScreen> {
  CheckupController checkupController = Get.put(CheckupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: AppString.booking),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: SingleChildScrollView(
            child: GetBuilder<CheckupController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: AppString.home,
                                fontSize: 17.sp,
                              ),
                              SizedBox(height: 12.h),
                              customText(text: "Bungalow 33, 412 2nd floor, 80 fe...", fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                            decoration:
                                BoxDecoration(border: Border.all(color: kGreyBorderColor), borderRadius: BorderRadius.circular(4.r)),
                            child: Center(
                              child: customText(text: AppString.change, fontSize: 12.sp, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.h, bottom: 20.h),
                      child: customText(text: "When shell we collect your sample?", fontSize: 18.sp),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.calender,
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 10.w),
                        customText(text: AppString.selectDay, fontSize: 15.sp, fontWeight: FontWeight.w300),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 110.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.selectDeyValue(index);
                                      },
                                      child: Container(
                                        height: 70.h,
                                        width: 70.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: controller.selectDey == index ? kLightGreen : kLightGreen.withOpacity(0.2)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            customText(text: "FEB", fontSize: 14.sp, fontWeight: FontWeight.w400),
                                            customText(
                                                text: controller.timeShortData[index]['date'],
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 3.h, top: 3.h),
                                      child: customText(
                                          text: controller.timeShortData[index]['dey'], fontSize: 12.sp, fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 45.h, right: 3.w),
                          child: Icon(Icons.arrow_forward_ios, size: 22.sp),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.clock,
                            height: 23.h,
                            width: 23.w,
                          ),
                          SizedBox(width: 10.w),
                          customText(text: AppString.selectProffered, fontSize: 15.sp, fontWeight: FontWeight.w300),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Container(
                        decoration: BoxDecoration(color: kWhite12, borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.only(top: 11.h, left: 15.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.morning,
                                    height: 35.h,
                                    width: 35.w,
                                  ),
                                  SizedBox(width: 15.w),
                                  customText(
                                    text: "Morning",
                                    fontSize: 15.sp,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h).copyWith(right: 20.h),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, crossAxisSpacing: 10.w, mainAxisSpacing: 10.h, childAspectRatio: 2 / 0.8),
                                  itemCount: controller.morningList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.selectMorningValue(index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: controller.morningTime == index ? kLightGreen : kLightGreen),
                                            color: controller.morningTime == index ? kLightGreen : kWhite,
                                            borderRadius: BorderRadius.circular(30.r)),
                                        child: Center(
                                          child: customText(
                                            text: controller.morningList[index],
                                            color: controller.morningTime == index ? kBlack : kLightGreen,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Container(
                        decoration: BoxDecoration(color: kWhite12, borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.only(top: 11.h, left: 15.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.afternoon,
                                    height: 50.h,
                                    width: 50.w,
                                  ),
                                  SizedBox(width: 15.w),
                                  customText(
                                    text: "Afternoon",
                                    fontSize: 15.sp,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h).copyWith(right: 20.h),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, crossAxisSpacing: 10.w, mainAxisSpacing: 10.h, childAspectRatio: 2 / 0.8),
                                  itemCount: controller.afternoonList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.selectAfternoonValue(index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: controller.afternoonTime == index ? kLightGreen : kLightGreen),
                                            color: controller.afternoonTime == index ? kLightGreen : kWhite,
                                            borderRadius: BorderRadius.circular(30.r)),
                                        child: Center(
                                          child: customText(
                                            text: controller.afternoonList[index],
                                            color: controller.afternoonTime == index ? kBlack : kLightGreen,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: kWhite12, borderRadius: BorderRadius.circular(15.r)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 11.h, left: 15.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.evening,
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                SizedBox(width: 15.w),
                                customText(
                                  text: "Evening",
                                  fontSize: 15.sp,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h).copyWith(right: 140.w),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 10.w, mainAxisSpacing: 10.h, childAspectRatio: 2 / 0.8),
                                itemCount: controller.eveningList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.selectEveningValue(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: controller.eveningTime == index ? kLightGreen : kLightGreen),
                                          color: controller.eveningTime == index ? kLightGreen : kWhite,
                                          borderRadius: BorderRadius.circular(30.r)),
                                      child: Center(
                                        child: customText(
                                          text: controller.eveningList[index],
                                          color: controller.eveningTime == index ? kBlack : kLightGreen,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: kLightGreen.withOpacity(0.4),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: customText(
                      text: AppString.bookYourSlot,
                      fontSize: 15.sp,
                      color: kBlack54,
                    ),
                  ),
                  customText(
                    text: "9th Fab | 06:45 AM",
                    fontSize: 15.sp,
                  )
                ],
              ),
              CustomButton(
                height: 50.h,
                width: 178.w,
                buttonText: "",
                child: Center(
                  child: regularSemiBoldText(text: AppString.confirmSlot),
                ),
                onTap: () {
                  customShowDialog(
                    context: context,
                    child: StatefulBuilder(
                      builder: (context, setState12) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              customText(text: "Reason for Cancellation", maxLines: 3, fontSize: 20.sp),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                child: Column(
                                  children: List.generate(
                                    checkupController.confirmSlotList.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.only(bottom: 21.h),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.w, right: 14.w),
                                            child: SizedBox(
                                              width: 25.w,
                                              height: 30.h,
                                              child: Radio(
                                                  activeColor: kLightGreen,
                                                  value: checkupController.confirmSlotList[index]['value'],
                                                  groupValue: checkupController.selectReason,
                                                  onChanged: (value) {
                                                    checkupController.selectReason = value!;
                                                    setState12(() {});
                                                  }),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 280.w,
                                            child: customText(
                                                text: checkupController.confirmSlotList[index]['name'],
                                                fontSize: 18.sp,
                                                maxLines: 2,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CustomButton(
                                  height: 56.h,
                                  buttonText: "",
                                  child: Center(child: customText(text: AppString.processed, fontSize: 17.sp)),
                                  onTap: () {
                                    Get.toNamed(Routes.checkOutDetailsLabScreen);
                                  }),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
