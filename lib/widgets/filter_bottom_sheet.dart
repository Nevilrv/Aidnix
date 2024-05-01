import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/home/home_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              constraints: BoxConstraints(maxHeight: 550.h),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 5.w),
                      customText(text: "Filter", fontSize: 24.sp, fontWeight: FontWeight.w600),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: kGrey,
                          size: 30.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: 5,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.filterCategoryIndex = index;
                                    controller.update();
                                  },
                                  child: customText(
                                    text: "Test Name",
                                    fontSize: 16.sp,
                                    fontWeight: controller.filterCategoryIndex == index ? FontWeight.w600 : FontWeight.w300,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        VerticalDivider(width: 0),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 4,
                          child: GridView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5.w,
                              mainAxisSpacing: 10.h,
                              mainAxisExtent: 40.h,
                            ),
                            itemBuilder: (context, indexx) {
                              return CustomButton(
                                buttonText: "",
                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                buttonColor: controller.filterCategoryItemIndex == indexx ? kGreen : kWhite,
                                border: Border.all(color: controller.filterCategoryItemIndex == indexx ? kGreen : kGrey, width: 2.r),
                                borderRadius: BorderRadius.circular(25.r),
                                child: Center(
                                  child: titleSmallText(
                                    text: "Blood",
                                    color: controller.filterCategoryItemIndex == indexx ? kBlack : Color(0xFFBDBDBD),
                                  ),
                                ),
                                onTap: () {
                                  controller.filterCategoryItemIndex = indexx;
                                  controller.update();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        buttonText: "Reset",
                        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                        border: Border.all(color: kGreen),
                        buttonColor: kWhite,
                        onTap: () {},
                      ),
                      CustomButton(
                        buttonText: "Show 2,200 result",
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
