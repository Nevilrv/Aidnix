import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LabCheckoutScreen extends StatefulWidget {
  const LabCheckoutScreen({super.key});

  @override
  State<LabCheckoutScreen> createState() => _LabCheckoutScreenState();
}

class _LabCheckoutScreenState extends State<LabCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: AppString.checkout, fontSize: 18.sp),
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
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
                child: Row(
                  children: [
                    customText(
                      text: AppString.home,
                      fontSize: 17.sp,
                    ),
                    const Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: kGrey),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Center(
                        child: customText(
                            text: AppString.change,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              customText(
                  text: "Bungalow 33, 412 2nd floor, 80 fe...",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              Padding(
                padding: EdgeInsets.only(top: 35.h, bottom: 20.h),
                child: customText(text: "Select Patients", fontSize: 17.sp),
              ),
              Container(
                height: 58.h,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [BoxShadow(color: kLightGrey, blurRadius: 3)],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kLightGreen,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: kWhite,
                            size: 17.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(text: "My self", fontSize: 17.sp),
                          Row(
                            children: [
                              customText(
                                  text: "Age: 21",
                                  fontSize: 12.sp,
                                  color: kDarkGrey1,
                                  fontWeight: FontWeight.w400),
                              SizedBox(width: 12.w),
                              customText(
                                  text: "Gender: Male",
                                  fontSize: 12.sp,
                                  color: kDarkGrey1,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 25.h),
                child: Container(
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [BoxShadow(color: kLightGrey, blurRadius: 3)],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        customText(
                            text: AppString.other,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                  height: 50.h,
                  width: 160.w,
                  buttonText: "",
                  child: Center(
                      child: customText(
                          text: AppString.bookYourSlot, fontSize: 14.sp)),
                  onTap: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: commonBottomCard(
        subtotal: '₹1496',
        gst: '₹299',
        discount: '₹299',
        price: '₹1795',
        height: true,
        button: CustomButton(
            height: 56.h,
            buttonText: "",
            child: Center(
                child: customText(
                    text: AppString.purchase,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp)),
            onTap: () {}),
      ),
    );
  }
}
