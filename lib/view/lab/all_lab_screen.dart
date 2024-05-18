import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/lab/lab_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllLabsScreen extends StatefulWidget {
  const AllLabsScreen({super.key});

  @override
  State<AllLabsScreen> createState() => _AllLabsScreenState();
}

class _AllLabsScreenState extends State<AllLabsScreen> {
  LabController labController = Get.put(LabController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      labController.allLabsAPI();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LabController>(
        init: LabController(),
        builder: (controller) {
          return Scaffold(
            appBar: const AppAppBar(titleText: "Labs Near You"),
            body: controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(color: kGreen),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),

                            /// header

                            // customAppBar(),

                            ///search bar

                            // SizedBox(height: 15.h),
                            //
                            // customSearchBar(
                            //   searchController: controller.search,
                            //   onChanged: (value) {
                            //     controller.search.text = value;
                            //
                            //     if (value.trim().isEmpty) {
                            //       controller.searchHomeData = [];
                            //     }
                            //
                            //     controller.update();
                            //   },
                            //   onFilterTap: () {
                            //     customBottomSheet(
                            //       context: context,
                            //       child: const FilterBottomSheet(),
                            //     );
                            //   },
                            //   onSuffixTap: () {
                            //     if (controller.search.text.trim().isNotEmpty) {
                            //       controller.homeSearchAPI();
                            //     }
                            //   },
                            // ),

                            SizedBox(height: 15.h),

                            regularText(
                              text: "Great! Please select the lab which suits you best",
                              color: kDarkGrey,
                              maxLines: 2,
                            ),

                            SizedBox(height: 20.h),

                            if (controller.allLabsList.isNotEmpty) ...[
                              ListView.builder(
                                itemCount: controller.allLabsList.length,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                primary: false,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: customCartContainer(
                                      titleName: controller.allLabsList[index].name ?? '',
                                      rating: controller.allLabsList[index].reviews ?? '',
                                      noOfRating: controller.allLabsList[index].reviews ?? '',
                                      noOfTest: controller.allLabsList[index].totalTests ?? '',
                                      address: controller.allLabsList[index].address ?? '',
                                      // offerPercentage: controller.allLabsList[index].discountTag ?? '',
                                      offerPercentage: '20%',
                                      distance:
                                          "${controller.allLabsList[index].distance?.value ?? ''}  ${controller.allLabsList[index].distance?.unit ?? ''}",
                                      isAddToCart: true,
                                      isRecommended: true,
                                    ),
                                  );
                                },
                              ),
                            ],

                            if (controller.allLabsList.isEmpty) ...[
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
                          ],
                        ),
                      ),
                    ),
                  ),
            // bottomNavigationBar: Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            //   decoration: BoxDecoration(
            //     color: kGreen.withOpacity(0.4),
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(25.r),
            //       topRight: Radius.circular(25.r),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: List.generate(
            //       controller.bottomItems.length,
            //       (index) => GestureDetector(
            //         onTap: () {
            //           controller.selected = index;
            //           controller.update();
            //         },
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             SvgPicture.asset(
            //               controller.bottomItems[index]['icon']!,
            //               height: 28.h,
            //               color: controller.selected == index ? kBlack : const Color(0xffA6A6A6),
            //             ),
            //             SizedBox(height: 5.h),
            //             Text(
            //               controller.bottomItems[index]['title']!,
            //               style: TextStyle(
            //                 fontSize: 10.sp,
            //                 fontFamily: "Poppins",
            //                 color: controller.selected == index ? kBlack : const Color(0xffA6A6A6),
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          );
        });
  }
}
