import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/booking/bar_code.dart';
import 'package:aidnix/view/booking/booking_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/reschedule_booking_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  BookingController bookingController = Get.put<BookingController>(BookingController());
  @override
  void initState() {
    bookingController.refId = Get.arguments != null ? Get.arguments["refId"] : "";

    if (bookingController.refId.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        bookingController.getBookingDetail();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Booking Details"),
      body: SingleChildScrollView(
        child: GetBuilder<BookingController>(
          init: BookingController(),
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundColor: kLightBgColor,
                                radius: 30.r,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                  child: Image.asset(
                                    AppAssets.labProfile,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -1.h,
                                right: -1.w,
                                child: Icon(
                                  Icons.verified,
                                  color: kGreen,
                                  size: 20.w,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 20.w),
                          customText(
                            text: controller.bookingData?.lab?.name ?? "",
                            fontSize: 20.sp,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 70.h, top: 20.h, bottom: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppAssets.clock, scale: 4),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(text: AppString.appointmentDateText, fontSize: 10.sp, color: kDarkGrey1),
                                customText(text: controller.bookingData?.scheduledDate ?? "", fontSize: 14.sp),
                                customText(text: controller.bookingData?.scheduledTime ?? "", fontSize: 10.sp, color: kDarkGrey1),
                              ],
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              AppAssets.microscopeIcon,
                              color: kGreen,
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(text: AppString.typeText, fontSize: 10.sp, color: kDarkGrey1),
                                customText(text: controller.bookingData?.scheduleType ?? AppString.pickUpText, fontSize: 14.sp)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            buttonText: "",
                            onTap: () {
                              // controller.rescheduleBooking();

                              customBottomSheet(
                                context: context,
                                child: const RescheduleBookingBottomSheet(),
                              );
                            },
                            child: headingSmallText(text: AppString.rescheduleText),
                          ),
                          CustomButton(
                            buttonText: "",
                            onTap: () {
                              controller.cancelBooking();
                            },
                            border: Border.all(color: kGreen),
                            buttonColor: kWhite,
                            child: headingSmallText(text: AppString.cancelTestText),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      titleSemiBoldText(text: AppString.patientText),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.r,
                            backgroundImage: const NetworkImage(
                              "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                            ),
                          ),
                          SizedBox(width: 20.w),
                          titleSmallText(text: "Kapil Darsan"),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(const BarCodeScreen());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: kBlack),
                              ),
                              child: Image.asset(
                                AppAssets.qrCodeGreenImage,
                                scale: 4,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      titleSemiBoldText(text: AppString.bookedTestText),
                      regularText(text: "${controller.bookingData?.labItems?.length ?? 0} Tests"),
                      SizedBox(height: 10.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.bookingData?.labItems?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            padding: EdgeInsets.only(right: 30.w, left: 10.w, bottom: 10.h, top: 10.h),
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: kGrey.withOpacity(0.1),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                  margin: EdgeInsets.only(right: 10.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: kLightGreen.withOpacity(0.15),
                                  ),
                                  child: Image.asset(AppAssets.bloodTestSmallIcon, scale: 4),
                                ),
                                titleSmallText(text: controller.bookingData?.labItems?[index].name ?? ""),
                                const Spacer(),
                                headingSemiBoldText(text: "₹${controller.bookingData?.labItems?[index].totalPrice ?? "0"}")
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10.h),
                      headingSemiBoldText(text: AppString.trackOrderTest),
                      SizedBox(height: 20.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: kLightGreen1,
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Image.asset(AppAssets.clock, scale: 4),
                              ),
                              Container(
                                width: 1.3,
                                height: 40,
                                color: kGreen,
                              ),
                            ],
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleSemiBoldText(text: "Order Confirmed"),
                              SizedBox(height: 5.h),
                              customText(text: "on 20 Jan, 2024", color: kGrey, fontWeight: FontWeight.w400)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: kGreen,
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: SvgPicture.asset(AppAssets.microscopeIcon, color: Colors.white),
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: kGrey,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleSemiBoldText(
                                text: "sample collected",
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              customText(text: "on 23 Jan, 2024", color: kGrey, fontWeight: FontWeight.w400)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                child: Image.asset(
                                  AppAssets.stepperCircle,
                                  scale: 4,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: kGrey,
                              ),
                            ],
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleSemiBoldText(
                                text: "Results Ready",
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              customText(
                                text: "on 23 Jan, 2024",
                                color: kDarkGrey,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Image.asset(
                              AppAssets.stepperCircle,
                              scale: 4,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleSemiBoldText(
                                text: "Report Delivered",
                              ),
                              SizedBox(height: 5.h),
                              customText(
                                text: "on 23 Jan, 2024",
                                color: kDarkGrey,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 7),
                        blurRadius: 10,
                        color: kGrey,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headingSemiBoldText(text: AppString.bookingSummaryTest),
                      SizedBox(height: 10.h),
                      customBookingSummery(title: "Subtotal", price: controller.bookingData?.amount ?? 0),
                      customBookingSummery(title: "GST 20%", price: 0),
                      customBookingSummery(title: "Discount applied", price: controller.bookingData?.discount ?? 0),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(text: "Total Price", fontSize: 20.sp, fontWeight: FontWeight.w600),
                          customText(
                              text: "₹${controller.bookingData?.totalPrice ?? 0}",
                              fontSize: 20.sp,
                              color: kGreen,
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                      SizedBox(height: 20.h),
                      titleSemiBoldText(text: "Address"),
                      SizedBox(height: 5.h),
                      titleText(text: "2972 Westheimer Rd. Santa Ana, Illinois\n85486 "),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
