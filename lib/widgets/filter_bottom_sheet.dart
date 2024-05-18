import 'dart:developer';
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
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.r),
              ),
            ),
            child: controller.isFilterLoading
                ? Center(child: CircularProgressIndicator(color: kGreen))
                : controller.filterData.isEmpty
                    ? const Center(child: Text("No Data Found!"))
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(flex: 2),
                              customText(text: "Filter", fontSize: 22.sp, fontWeight: FontWeight.w600),
                              const Spacer(),
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
                              SizedBox(width: 30.w),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: controller.filterData.length ?? 0,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.filterCategoryIndex = index;
                                            controller.update();
                                            log('controller.filterData[index].name===========>>>>${controller.filterData[index].name}');
                                          },
                                          child: customText(
                                            text: controller.filterData[index].name ?? '',
                                            fontSize: 16.sp,
                                            fontWeight: controller.filterCategoryIndex == index ? FontWeight.w600 : FontWeight.w300,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                const VerticalDivider(width: 0),
                                SizedBox(width: 10.w),
                                Expanded(
                                  flex: 4,
                                  child: Wrap(
                                    children: List.generate(
                                      controller.filterData[controller.filterCategoryIndex].values?.length ?? 0,
                                      (indexx) => CustomButton(
                                        buttonText: "",
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                                        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                        buttonColor: controller.filterInt[controller.filterCategoryIndex] == indexx ? kGreen : kWhite,
                                        border: Border.all(
                                            color: controller.filterInt[controller.filterCategoryIndex] == indexx ? kGreen : kGrey,
                                            width: 2.r),
                                        borderRadius: BorderRadius.circular(25.r),
                                        child: titleSmallText(
                                          text: controller.filterData[controller.filterCategoryIndex].values?[indexx].name ?? '',
                                          color: controller.filterInt[controller.filterCategoryIndex] == indexx
                                              ? kBlack
                                              : const Color(0xFFBDBDBD),
                                        ),
                                        onTap: () {
                                          controller.filterInt[controller.filterCategoryIndex] = indexx;
                                          controller.update();
                                          log('controller.filterInt======TAP=====>>>>${controller.filterInt}');
                                          log("FILTER_LIST___________${controller.filterData[controller.filterCategoryIndex].values?[indexx].name ?? ''}");
                                        },
                                      ),
                                    ),
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
                                onTap: () {
                                  controller.getList();
                                  controller.filterCategoryIndex = 0;
                                  controller.update();
                                },
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
        },
      ),
    );
  }
}

/// OLD CODE
// import 'dart:developer';
// import 'package:aidnix/theme/app_theme.dart';
// import 'package:aidnix/view/home/home_controller.dart';
// import 'package:aidnix/widgets/app_button.dart';
// import 'package:aidnix/widgets/custom_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class FilterBottomSheet extends StatelessWidget {
//   const FilterBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: MediaQuery.of(context).viewInsets,
//       child: GetBuilder<HomeController>(
//         init: HomeController(),
//         builder: (controller) {
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//             constraints: BoxConstraints(maxHeight: 550.h),
//             decoration: BoxDecoration(
//               color: kWhite,
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(40.r),
//               ),
//             ),
//             child: controller.isFilterLoading
//                 ? Center(child: CircularProgressIndicator(color: kGreen))
//                 : controller.filterData.isEmpty
//                     ? const Center(child: Text("No Data Found!"))
//                     : Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SizedBox(height: 10.h),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Spacer(flex: 2),
//                               customText(text: "Filter", fontSize: 22.sp, fontWeight: FontWeight.w600),
//                               const Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.back();
//                                 },
//                                 child: Icon(
//                                   Icons.close_rounded,
//                                   color: kGrey,
//                                   size: 30.h,
//                                 ),
//                               ),
//                               SizedBox(width: 30.w),
//                             ],
//                           ),
//                           SizedBox(height: 20.h),
//                           Expanded(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: ListView.builder(
//                                     itemCount: controller.filterData.length ?? 0,
//                                     padding: EdgeInsets.zero,
//                                     shrinkWrap: true,
//                                     itemBuilder: (context, index) {
//                                       return Padding(
//                                         padding: EdgeInsets.only(bottom: 15.h),
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             controller.filterCategoryIndex = index;
//                                             controller.update();
//                                             log('controller.filterData[index].name===========>>>>${controller.filterData[index].name}');
//                                           },
//                                           child: customText(
//                                             text: controller.filterData[index].name ?? '',
//                                             fontSize: 16.sp,
//                                             fontWeight: controller.filterCategoryIndex == index ? FontWeight.w600 : FontWeight.w300,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(width: 10.w),
//                                 const VerticalDivider(width: 0),
//                                 SizedBox(width: 10.w),
//                                 Expanded(
//                                   flex: 4,
//                                   child: Wrap(
//                                     children: List.generate(
//                                       controller.filterData[controller.filterCategoryIndex].values?.length ?? 0,
//                                       (indexx) => CustomButton(
//                                         buttonText: "",
//                                         padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
//                                         margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
//                                         buttonColor: controller.filterCategoryItemIndex == indexx ? kGreen : kWhite,
//                                         border:
//                                             Border.all(color: controller.filterCategoryItemIndex == indexx ? kGreen : kGrey, width: 2.r),
//                                         borderRadius: BorderRadius.circular(25.r),
//                                         child: titleSmallText(
//                                           text: controller.filterData[controller.filterCategoryIndex].values?[indexx].name ?? '',
//                                           color: controller.filterCategoryItemIndex == indexx ? kBlack : const Color(0xFFBDBDBD),
//                                         ),
//                                         onTap: () {
//                                           controller.filterCategoryItemIndex = indexx;
//                                           controller.update();
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10.h),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               CustomButton(
//                                 buttonText: "Reset",
//                                 padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
//                                 border: Border.all(color: kGreen),
//                                 buttonColor: kWhite,
//                                 onTap: () {
//                                   controller.filterCategoryIndex = 0;
//                                   controller.filterCategoryItemIndex = -1;
//                                   controller.filterInt = [];
//                                   controller.update();
//                                 },
//                               ),
//                               CustomButton(
//                                 buttonText: "Show 2,200 result",
//                                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//                                 onTap: () {},
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//           );
//         },
//       ),
//     );
//   }
// }
