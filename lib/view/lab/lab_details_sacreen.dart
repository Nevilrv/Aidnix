import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/lab/lab_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/filter_bottom_sheet.dart';
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
  LabController labController = Get.put(LabController());

  @override
  void initState() {
    labController.labId = Get.arguments != null ? Get.arguments["labId"] : "";

    if (labController.labId.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await labController.labDetailsAPI();
        await labController.labItemsDetailsAPI();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: AppString.labDetails),
      body: GetBuilder<LabController>(
        init: LabController(),
        builder: (controller) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(color: kGreen),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.labData != null) ...[
                          Column(
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
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 22.w),
                                child: customLabDetailsCart(
                                  titleName: controller.labData?.name ?? '',
                                  rating: controller.labData?.reviews ?? '',
                                  noOfRating: controller.labData?.reviews ?? '',
                                  noOfTest: controller.labData?.totalTests ?? '',
                                  address: controller.labData?.address ?? '',
                                  distance:
                                      "${controller.labData?.distance?.value.toString() ?? ''} ${controller.labData?.distance?.unit ?? ''}",
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 22.w),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: kWhite,
                                      boxShadow: [BoxShadow(color: kGrey.withOpacity(0.2), blurRadius: 3)],
                                      borderRadius: BorderRadius.circular(20.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 10.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customText(text: AppString.about, fontSize: 18.sp, fontWeight: FontWeight.w600),
                                        SizedBox(height: 5.h),
                                        ReadMoreText(
                                          // controller.labData?.description ?? ''  ,
                                          'Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur Quam ...',
                                          trimMode: TrimMode.Line,
                                          trimLines: 1,
                                          colorClickableText: Colors.pink,
                                          trimCollapsedText: 'Read more',
                                          style: TextStyle(
                                              fontSize: 16.sp, color: kDarkGrey1, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                                          moreStyle:
                                              TextStyle(fontSize: 16.sp, color: kBlack, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: customText(text: AppString.test, fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 19.h, left: 22.w, right: 22.w),
                          child: customSearchBar(
                            searchController: controller.searchController,
                            searchHint: false,
                            onChanged: (value) {
                              controller.searchController.text = value;
                              controller.searchData = [];
                              controller.update();
                            },
                            onFilterTap: () {
                              if (controller.filterData.isEmpty) {
                                controller.getFilterApi().then((value) {
                                  controller.getList();
                                });
                              }

                              customBottomSheet(
                                context: context,
                                child: const FilterBottomSheet(),
                              );
                            },
                            onSuffixTap: () {
                              if (controller.searchController.text.isNotEmpty) {
                                controller.searchAPI();
                              }
                            },
                          ),
                        ),
                        if (controller.searchController.text.isEmpty) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  itemCount: controller.labItems.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 12.h),
                                      child: checkupCartContainer(
                                          comprehensive: controller.labItems[index].name ?? "Blood checkup\ncomprehensive",
                                          offerPercentage: controller.labItems[index].discountTag ?? "70",
                                          price: "₹${controller.labItems[index].amount ?? 0}",
                                          newPrice: "₹${controller.labItems[index].totalPrice ?? 0}",
                                          report: "${controller.labItems[index].reportTime ?? 0} Hours",
                                          type: "Pick Up, Lab Visit",
                                          onTap: () {
                                            Get.toNamed(Routes.testDetailsScreen);
                                          }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (controller.searchController.text.isNotEmpty) ...[
                          if (controller.isSearchLoading)
                            Center(
                              child: CircularProgressIndicator(color: kGreen),
                            )
                          else if (controller.searchData.isNotEmpty) ...[
                            SizedBox(height: 15.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: regularText(
                                text: "Great! Please select the lab which suits you best",
                                color: kDarkGrey,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            ListView.builder(
                              itemCount: controller.searchData.length,
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 15.h),
                                  child: customCartContainer(
                                    titleName: controller.searchData[index].name ?? '',
                                    rating: controller.searchData[index].lab?.reviews ?? '',
                                    noOfRating: controller.searchData[index].lab?.reviews ?? '',
                                    noOfTest: controller.searchData[index].lab?.totalTests ?? '',
                                    address: controller.searchData[index].lab?.address ?? '',
                                    offerPercentage: controller.searchData[index].discountTag ?? '',
                                    distance:
                                        "${controller.searchData[index].lab?.distance?.value ?? ''}  ${controller.searchData[index].lab?.distance?.unit ?? ''}",
                                    isAddToCart: true,
                                    isRecommended: true,
                                  ),
                                );
                              },
                            ),
                          ],
                          if (controller.isSearchLoading == false)
                            if (controller.searchData.isEmpty) ...[
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 100.h),
                                    Center(
                                      child: Image.asset(AppAssets.noDataFoundImage, scale: 4),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        customText(
                                          text: "Sorry No Labs Found",
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        regularText(
                                          text: "Sorry no labs found, please modify\nyour search and try again",
                                          color: const Color(0xFF868796),
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                          buttonText: "",
                                          child: Row(
                                            children: [
                                              regularSemiBoldText(
                                                text: "Call us",
                                              ),
                                              SizedBox(width: 5.w),
                                              Icon(Icons.arrow_forward, size: 25.w)
                                            ],
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30.h),
                                  ],
                                ),
                              ),
                            ],
                        ],
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
