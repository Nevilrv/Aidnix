import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentPageScreen extends StatefulWidget {
  const PaymentPageScreen({super.key});

  @override
  State<PaymentPageScreen> createState() => _PaymentPageScreenState();
}

class _PaymentPageScreenState extends State<PaymentPageScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: AppString.payment, fontSize: 18.sp),
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
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [BoxShadow(color: kLightGrey, blurRadius: 3)],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 14.w),
                      child: SizedBox(
                        width: 18.w,
                        child: Radio(
                            activeColor: kLightGreen,
                            value: 1,
                            groupValue: selected,
                            onChanged: (int? value) {
                              selected = value!;
                              setState(() {});
                            }),
                      ),
                    ),
                    customText(
                        text: AppString.cashDelivery,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [BoxShadow(color: kLightGrey, blurRadius: 3)],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 14.w),
                      child: SizedBox(
                        width: 18.w,
                        child: Radio(
                            activeColor: kLightGreen,
                            value: 2,
                            groupValue: selected,
                            onChanged: (int? value) {
                              selected = value!;
                              setState(() {});
                            }),
                      ),
                    ),
                    //  SizedBox(width: 10.w),
                    customText(
                        text: AppString.upi,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                    text: AppString.bookYourTest,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp)),
            onTap: () {
              Get.toNamed(Routes.labCheckoutScreen);
            }),
      ),
    );
  }
}
