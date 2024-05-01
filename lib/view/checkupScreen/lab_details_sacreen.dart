import 'package:aidnix/Constant/app_assets.dart';
import 'package:aidnix/Constant/app_string.dart';
import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Utils/app_routes.dart';
import 'package:aidnix/Utils/common_widget.dart';
import 'package:aidnix/Utils/custom_widget%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LabDetailsScreen extends StatefulWidget {
  const LabDetailsScreen({super.key});

  @override
  State<LabDetailsScreen> createState() => _LabDetailsScreenState();
}

class _LabDetailsScreenState extends State<LabDetailsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 28.w).copyWith(top: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 23.sp,
                    ),
                    const Spacer(),
                    customText(
                        text: AppString.labDetails,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 11.h, bottom: 13.h),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.labImageScreen);
                  },
                  child: assetImage(
                    AppAssets.labImage,
                    height: 238.h,
                    width: 430.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customLabDetailsCart(
                      titleName: "Greenlab Biotech",
                      rating: 5.0,
                      noOfRating: "1.1k",
                      noOfTest: 100,
                      address: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                      distance: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 13.h, bottom: 35.h),
                      child: Container(
                        height: 123.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kWhite,
                            boxShadow: [
                              BoxShadow(
                                  color: kGrey.withOpacity(0.2), blurRadius: 3)
                            ],
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w)
                              .copyWith(top: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: AppString.about,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                              SizedBox(height: 10.h),
                              customText(
                                  text:
                                      "Lorem ipsum dolor sit amet consectetur. ",
                                  fontSize: 16.sp,
                                  color: kDarkGrey1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  fontWeight: FontWeight.w400),
                              Row(
                                children: [
                                  customText(
                                      text: "Quam ...",
                                      fontSize: 16.sp,
                                      color: kDarkGrey1,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      fontWeight: FontWeight.w400),
                                  customText(
                                      text: "Read more",
                                      fontSize: 16.sp,
                                      color: kBlack,
                                      fontWeight: FontWeight.w500),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    customText(
                        text: AppString.test,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                    Padding(
                      padding: EdgeInsets.only(top: 19.h),
                      child: customSearchBar(
                          context: context,
                          searchController: searchController,
                          searchHis: false),
                    ),
                    ListView.builder(
                      itemCount: 3,
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
                              type: "Pick Up, Lab Visit"),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
