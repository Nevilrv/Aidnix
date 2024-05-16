import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/view/health_records/health_records_controller.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/health_record_filter_bottom_sheet.dart';
import 'package:aidnix/widgets/upload_health_records_dialog.dart';
import 'package:aidnix/widgets/upload_prescription_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HealthRecordsScreen extends StatefulWidget {
  const HealthRecordsScreen({super.key});

  @override
  State<HealthRecordsScreen> createState() => _HealthRecordsScreenState();
}

class _HealthRecordsScreenState extends State<HealthRecordsScreen> with TickerProviderStateMixin {
  HealthRecordsController healthRecordsController = Get.put<HealthRecordsController>(HealthRecordsController());

  @override
  void initState() {
    healthRecordsController.tabController = TabController(length: 4, vsync: this);
    healthRecordsController.tabController?.addListener(handleTabSelection);

    healthRecordsController.getHealthDocs();

    super.initState();
  }

  void handleTabSelection() {
    healthRecordsController.update();
    debugPrint("TabController Index ::::::::: ${healthRecordsController.tabController?.index} ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Health Records"),
      body: GetBuilder<HealthRecordsController>(
        init: HealthRecordsController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                customSearchBar(
                  searchController: controller.searchController,
                  onFilterTap: () {
                    customBottomSheet(
                      context: context,
                      child: const HealthRecordFilterBottomSheet(),
                    );
                  },
                ),
                SizedBox(height: 15.h),

                DefaultTabController(
                  length: 4,
                  child: TabBar(
                    controller: controller.tabController,
                    labelPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    indicatorColor: kGreen,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: kLightGrey,
                    indicatorWeight: 3,
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    tabs: [
                      controller.tabController?.index == 0
                          ? titleBoldText(text: "Reports", color: kGreen)
                          : titleSmallText(text: "Reports"),
                      controller.tabController?.index == 1
                          ? titleBoldText(text: "Prescriptions", color: kGreen)
                          : titleSmallText(text: "Prescriptions"),
                      controller.tabController?.index == 2
                          ? titleBoldText(text: "Invoice", color: kGreen)
                          : titleSmallText(text: "Invoice"),
                      controller.tabController?.index == 3 ? titleBoldText(text: "Others", color: kGreen) : titleSmallText(text: "Others")
                    ],
                  ),
                ),

                SizedBox(height: 15.h),

                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          regularText(text: "Jan 24"),
                          SizedBox(height: 10.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                                  decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kGrey.withOpacity(0.1),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                                        decoration: BoxDecoration(
                                          color: kLightBgColor,
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                        child: Image.asset(AppAssets.pdfIcon, scale: 4),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            headingText(
                                              text: "Manish_Blood_Test_20241",
                                              color: Color(0xFF0B0B0B),
                                            ),
                                            SizedBox(height: 5.h),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                customText(
                                                  text: "2 Jan, 2024",
                                                  color: kDarkGrey1,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                regularText(text: "Mohsin Ali", color: kDarkGrey1),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 50.h),
                          Center(
                            child: Image.asset(AppAssets.noDataFoundImage, scale: 4),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                text: "No health record found",
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
                                text: "Keep track all your prescriptions\nand reports one place.",
                                color: Color(0xFF868796),
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
                                buttonText: "Add a health records",
                                onTap: () {
                                  customShowDialog(
                                    context: context,
                                    child: UploadPrescriptionDialog(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(),
                      Container(),
                    ],
                  ),
                ),

                // if (controller.selectTabIndex == 0) ...[
                //                 //   regularText(text: "Jan 24"),
                //                 //   SizedBox(height: 20.h),
                //                 //   Expanded(
                //                 //     child: ListView.builder(
                //                 //       itemCount: 3,
                //                 //       shrinkWrap: true,
                //                 //       padding: EdgeInsets.symmetric(horizontal: 10.w),
                //                 //       itemBuilder: (context, index) {
                //                 //         return Container(
                //                 //           margin: EdgeInsets.symmetric(vertical: 8.h),
                //                 //           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                //                 //           decoration: BoxDecoration(
                //                 //             color: kWhite,
                //                 //             borderRadius: BorderRadius.circular(12.r),
                //                 //             boxShadow: [
                //                 //               BoxShadow(
                //                 //                 color: kGrey.withOpacity(0.1),
                //                 //                 blurRadius: 30,
                //                 //               ),
                //                 //             ],
                //                 //           ),
                //                 //           child: Row(
                //                 //             children: [
                //                 //               Container(
                //                 //                 padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                //                 //                 decoration: BoxDecoration(
                //                 //                   color: kLightBgColor,
                //                 //                   borderRadius: BorderRadius.circular(10.r),
                //                 //                 ),
                //                 //                 child: Image.asset(AppAssets.pdfIcon, scale: 4),
                //                 //               ),
                //                 //               SizedBox(width: 10.w),
                //                 //               Expanded(
                //                 //                 child: Column(
                //                 //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                 //                   children: [
                //                 //                     headingText(
                //                 //                       text: "Manish_Blood_Test_20241",
                //                 //                       color: Color(0xFF0B0B0B),
                //                 //                     ),
                //                 //                     SizedBox(height: 5.h),
                //                 //                     Row(
                //                 //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 //                       children: [
                //                 //                         customText(
                //                 //                           text: "2 Jan, 2024",
                //                 //                           color: kDarkGrey1,
                //                 //                           fontSize: 12.sp,
                //                 //                           fontWeight: FontWeight.w400,
                //                 //                         ),
                //                 //                         regularText(text: "Mohsin Ali", color: kDarkGrey1),
                //                 //                       ],
                //                 //                     ),
                //                 //                   ],
                //                 //                 ),
                //                 //               ),
                //                 //             ],
                //                 //           ),
                //                 //         );
                //                 //       },
                //                 //     ),
                //                 //   ),
                //                 // ],
                //                 // if (controller.selectTabIndex == 1) ...[
                //                 //   SizedBox(height: 50.h),
                //                 //   Center(
                //                 //     child: Image.asset(AppAssets.noDataFoundImage, scale: 4),
                //                 //   ),
                //                 //   SizedBox(height: 20.h),
                //                 //   Row(
                //                 //     mainAxisAlignment: MainAxisAlignment.center,
                //                 //     children: [
                //                 //       customText(
                //                 //         text: "No health record found",
                //                 //         fontSize: 20.sp,
                //                 //         fontWeight: FontWeight.w600,
                //                 //         textAlign: TextAlign.center,
                //                 //       ),
                //                 //     ],
                //                 //   ),
                //                 //   SizedBox(height: 10.h),
                //                 //   Row(
                //                 //     mainAxisAlignment: MainAxisAlignment.center,
                //                 //     children: [
                //                 //       regularText(
                //                 //         text: "Keep track all your prescriptions\nand reports one place.",
                //                 //         color: Color(0xFF868796),
                //                 //         maxLines: 3,
                //                 //         textAlign: TextAlign.center,
                //                 //       ),
                //                 //     ],
                //                 //   ),
                //                 //   SizedBox(height: 30.h),
                //                 //   Row(
                //                 //     mainAxisAlignment: MainAxisAlignment.center,
                //                 //     children: [
                //                 //       CustomButton(
                //                 //         buttonText: "Add a health records",
                //                 //         onTap: () {
                //                 //           customShowDialog(
                //                 //             context: context,
                //                 //             child: UploadPrescriptionDialog(),
                //                 //           );
                //                 //         },
                //                 //       ),
                //                 //     ],
                //                 //   ),
                //                 // ],
                SizedBox(height: 20.h),
              ],
            ),
          );

          /// Old Screen

          // return Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 15.w),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(height: 10.h),
          //       customSearchBar(
          //         context: context,
          //         searchController: controller.searchController,
          //         onFilterTap: () {
          //           customBottomSheet(
          //             context: context,
          //             child: const HealthRecordFilterBottomSheet(),
          //           );
          //         },
          //       ),
          //       SizedBox(height: 15.h),
          //       SizedBox(
          //         height: 50.h,
          //         child: Stack(
          //           alignment: Alignment.bottomCenter,
          //           children: [
          //             Divider(
          //               height: 0,
          //               color: kGrey,
          //               thickness: 1.h,
          //             ),
          //             ListView.builder(
          //               itemCount: controller.tabList.length,
          //               padding: EdgeInsets.zero,
          //               shrinkWrap: true,
          //               scrollDirection: Axis.horizontal,
          //               itemBuilder: (context, index) {
          //                 return Padding(
          //                   padding: EdgeInsets.only(right: 10.w),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       GestureDetector(
          //                         onTap: () {
          //                           controller.selectTabIndex = index;
          //                           controller.update();
          //                         },
          //                         child: titleSemiBoldText(
          //                           text: "${controller.tabList[index]}",
          //                           color: controller.selectTabIndex == index ? kGreen : kBlack,
          //                         ),
          //                       ),
          //                       Container(
          //                         height: controller.selectTabIndex == index ? 3.h : 0,
          //                         width: 100.w,
          //                         decoration: BoxDecoration(
          //                           color: controller.selectTabIndex == index ? kGreen : Colors.transparent,
          //                           borderRadius: BorderRadius.circular(10),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 );
          //               },
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 15.h),
          //       if (controller.selectTabIndex == 0) ...[
          //         regularText(text: "Jan 24"),
          //         SizedBox(height: 20.h),
          //         Expanded(
          //           child: ListView.builder(
          //             itemCount: 3,
          //             shrinkWrap: true,
          //             padding: EdgeInsets.symmetric(horizontal: 10.w),
          //             itemBuilder: (context, index) {
          //               return Container(
          //                 margin: EdgeInsets.symmetric(vertical: 8.h),
          //                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          //                 decoration: BoxDecoration(
          //                   color: kWhite,
          //                   borderRadius: BorderRadius.circular(12.r),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: kGrey.withOpacity(0.1),
          //                       blurRadius: 30,
          //                     ),
          //                   ],
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     Container(
          //                       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          //                       decoration: BoxDecoration(
          //                         color: kLightBgColor,
          //                         borderRadius: BorderRadius.circular(10.r),
          //                       ),
          //                       child: Image.asset(AppAssets.pdfIcon, scale: 4),
          //                     ),
          //                     SizedBox(width: 10.w),
          //                     Expanded(
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           headingText(
          //                             text: "Manish_Blood_Test_20241",
          //                             color: Color(0xFF0B0B0B),
          //                           ),
          //                           SizedBox(height: 5.h),
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               customText(
          //                                 text: "2 Jan, 2024",
          //                                 color: kDarkGrey1,
          //                                 fontSize: 12.sp,
          //                                 fontWeight: FontWeight.w400,
          //                               ),
          //                               regularText(text: "Mohsin Ali", color: kDarkGrey1),
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ],
          //       if (controller.selectTabIndex == 1) ...[
          //         SizedBox(height: 50.h),
          //         Center(
          //           child: Image.asset(AppAssets.noDataFoundImage, scale: 4),
          //         ),
          //         SizedBox(height: 20.h),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             customText(
          //               text: "No health record found",
          //               fontSize: 20.sp,
          //               fontWeight: FontWeight.w600,
          //               textAlign: TextAlign.center,
          //             ),
          //           ],
          //         ),
          //         SizedBox(height: 10.h),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             regularText(
          //               text: "Keep track all your prescriptions\nand reports one place.",
          //               color: Color(0xFF868796),
          //               maxLines: 3,
          //               textAlign: TextAlign.center,
          //             ),
          //           ],
          //         ),
          //         SizedBox(height: 30.h),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             CustomButton(
          //               buttonText: "Add a health records",
          //               onTap: () {
          //                 customShowDialog(
          //                   context: context,
          //                   child: UploadPrescriptionDialog(),
          //                 );
          //               },
          //             ),
          //           ],
          //         ),
          //       ],
          //       SizedBox(height: 20.h),
          //     ],
          //   ),
          // );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kGreen,
        onPressed: () {
          // Get.toNamed(Routes.editHealthRecordsScreen);

          customShowDialog(
            context: context,
            child: UploadHealthRecordsDialog(),
          );
        },
        child: Icon(
          Icons.add,
          color: kWhite,
        ),
      ),
    );
  }
}
