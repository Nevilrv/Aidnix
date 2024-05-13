import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

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
      appBar: const AppAppBar(titleText: AppString.labDetails),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.labImageScreen);
                },
                child: assetImage(
                  AppAssets.labImage,
                  height: 238.h,
                  width: 430.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    customLabDetailsCart(
                      titleName: "Greenlab Biotech",
                      rating: 5.0,
                      noOfRating: "1.1k",
                      noOfTest: 100,
                      address: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                      distance: 3,
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kWhite,
                          boxShadow: [
                            BoxShadow(
                                color: kGrey.withOpacity(0.2), blurRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w)
                            .copyWith(top: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: AppString.about,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600),
                            SizedBox(height: 5.h),
                            ReadMoreText(
                              'Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur Quam ...',
                              trimMode: TrimMode.Line,
                              trimLines: 1,
                              colorClickableText: Colors.pink,
                              trimCollapsedText: 'Read more',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: kDarkGrey1,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                              moreStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: kBlack,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    customText(
                        text: AppString.test,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                    Padding(
                      padding: EdgeInsets.only(top: 19.h),
                      child: customSearchBar(
                        context: context,
                        searchController: searchController,
                        searchHint: false,
                      ),
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
                              type: "Pick Up, Lab Visit",
                              onTap: () {
                                Get.toNamed(Routes.testDetailsScreen);
                              }),
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
