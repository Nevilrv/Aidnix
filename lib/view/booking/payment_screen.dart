import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/booking/booking_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
        init: BookingController(),
        builder: (controller) {
          return Scaffold(
            appBar: const AppAppBar(titleText: AppString.payment),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 25.h),
                      child: customText(
                        text: AppString.selectMethod,
                        fontSize: 17.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectedPaymentMethod = "PASC";
                        controller.update();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(color: kLightGrey, blurRadius: 3),
                          ],
                        ),
                        child: Row(
                          children: [
                            controller.selectedPaymentMethod == "PASC"
                                ? Icon(Icons.radio_button_checked_rounded, color: kGreen)
                                : Icon(
                                    Icons.radio_button_off_rounded,
                                    color: kGrey,
                                  ),
                            SizedBox(width: 15.w),
                            customText(text: AppString.cashDelivery, fontSize: 17.sp, fontWeight: FontWeight.w400),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        controller.selectedPaymentMethod = "UPI";
                        controller.update();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(color: kLightGrey, blurRadius: 3),
                          ],
                        ),
                        child: Row(
                          children: [
                            controller.selectedPaymentMethod == "UPI"
                                ? Icon(Icons.radio_button_checked_rounded, color: kGreen)
                                : Icon(Icons.radio_button_off_rounded, color: kGrey),
                            SizedBox(width: 15.w),
                            customText(text: AppString.upi, fontSize: 17.sp, fontWeight: FontWeight.w400),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: commonBottomCart(
              buttonText: AppString.bookYourTest,
              buttonOnTap: () {
                Get.toNamed(Routes.labCheckoutScreen);
              },
            ),
          );
        });
  }
}
