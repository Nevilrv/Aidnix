import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestDetailsScreen extends StatefulWidget {
  const TestDetailsScreen({super.key});

  @override
  State<TestDetailsScreen> createState() => _TestDetailsScreenState();
}

class _TestDetailsScreenState extends State<TestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w).copyWith(top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 23.sp,
                  ),
                  const Spacer(),
                  customText(text: AppString.test, fontSize: 18.sp, fontWeight: FontWeight.w500),
                  const Spacer(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 16.h),
                child: customText(
                    textAlign: TextAlign.start, text: "Complete Blood Count (CBC)", fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              customText(
                  textAlign: TextAlign.start,
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Quam nec enim at viverra et risus aliquam. Vel a facilisis lorem urna. Lobortis egestas pretium mi justo iaculis vitae. Enim non viverra tempus tincidunt tortor neque volutpat amet. Turpis sit.",
                  fontSize: 16.sp,
                  maxLines: 6,
                  color: kDarkGrey1,
                  fontWeight: FontWeight.w400),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: kLightGreen.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Container(
                              height: 36.h,
                              width: 36.w,
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      height: 50.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: kLightGreen.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
