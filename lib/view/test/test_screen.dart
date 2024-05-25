import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/test/test_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TestController testController = Get.put(TestController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testController.testAPI();
    });
    super.initState();
  }

  @override
  void dispose() {
    testController.searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      init: TestController(),
      builder: (controller) {
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(color: kGreen),
              )
            : controller.testList.isEmpty
                ? Column(
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
                    ],
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),

                          /// header

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            child: customAppBar(),
                          ),

                          ///search bar

                          SizedBox(height: 25.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            child: customSearchBar(
                              searchController: controller.searchController,
                              onChanged: (value) {
                                controller.searchController.text = value;
                              },
                              onFilterTap: () {
                                customBottomSheet(
                                  context: context,
                                  child: FilterBottomSheet(
                                    onSearchFilterTap: () {},
                                  ),
                                );
                              },
                              onSuffixTap: () {
                                if (controller.searchController.text.trim().isNotEmpty) {
                                  controller.testAPI();
                                }
                              },
                            ),
                          ),

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
                            itemCount: controller.testList.length,
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: customCartContainer(
                                  titleName: controller.testList[index].name ?? '',
                                  rating: controller.testList[index].lab?.reviews ?? '',
                                  noOfRating: controller.testList[index].lab?.reviews ?? '',
                                  noOfTest: controller.testList[index].lab?.totalTests ?? '',
                                  address: controller.testList[index].lab?.address ?? '',
                                  offerPercentage: controller.testList[index].discountTag ?? '',
                                  distance:
                                      "${controller.testList[index].lab?.distance?.value ?? ''}  ${controller.testList[index].lab?.distance?.unit ?? ''}",
                                  isAddToCart: true,
                                  isRecommended: true,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}
