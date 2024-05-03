import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/booking/booking_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingAllScreen extends StatefulWidget {
  const BookingAllScreen({Key? key}) : super(key: key);

  @override
  State<BookingAllScreen> createState() => _BookingAllScreenState();
}

class _BookingAllScreenState extends State<BookingAllScreen> with TickerProviderStateMixin {
  BookingController bookingController = Get.put(BookingController());

  @override
  void initState() {
    bookingController.tabController = TabController(length: 4, vsync: this);
    // bookingController.tabController?.addListener(_handleTabSelection);

    super.initState();
  }

  // void _handleTabSelection() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppAppBar(titleText: AppString.bookingText),
        body: GetBuilder<BookingController>(
          builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Divider(
                        height: 0,
                        color: kGrey,
                        thickness: 1.h,
                      ),
                      ListView.builder(
                        itemCount: controller.tabList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.selectTabIndex = index;
                                    controller.update();
                                  },
                                  child: titleSemiBoldText(
                                    text: "${controller.tabList[index]}",
                                    color: controller.selectTabIndex == index ? kGreen : kBlack,
                                  ),
                                ),
                                Container(
                                  height: controller.selectTabIndex == index ? 3.h : 0,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: controller.selectTabIndex == index ? kGreen : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.bookingDetailsScreen);
                        },
                        child: customBookingContainer(
                          titleName: "Greenlab Biotech",
                          category: "Blood test",
                          date: "12 Jan, 2024",
                          status: AppString.upcomingText,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );

            /// Old Design

            // return Column(
            //   children: [
            //
            //
            //
            //
            //
            //     DefaultTabController(
            //       length: 4,
            //       child: TabBar(
            //         controller: controller.tabController,
            //         labelPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            //         indicatorColor: kGreen,
            //         indicatorSize: TabBarIndicatorSize.tab,
            //         dividerColor: kLightGrey,
            //         indicatorWeight: 3,
            //         isScrollable: true,
            //         tabs: [
            //           controller.tabController?.index == 0
            //               ? titleBoldText(text: AppString.allText, color: kGreen)
            //               : titleSmallText(text: AppString.allText),
            //           controller.tabController?.index == 1
            //               ? titleBoldText(text: AppString.upcomingText, color: kGreen)
            //               : titleSmallText(text: AppString.upcomingText),
            //           controller.tabController?.index == 2
            //               ? titleBoldText(text: AppString.completedText, color: kGreen)
            //               : titleSmallText(text: AppString.completedText),
            //           controller.tabController?.index == 3
            //               ? titleBoldText(text: AppString.cancelledText, color: kGreen)
            //               : titleSmallText(text: AppString.cancelledText)
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       child: TabBarView(
            //         controller: controller.tabController,
            //         children: [
            //           ListView.builder(
            //             itemCount: 3,
            //             padding: EdgeInsets.zero,
            //             shrinkWrap: true,
            //             physics: const NeverScrollableScrollPhysics(),
            //             primary: false,
            //             itemBuilder: (context, index) {
            //               return GestureDetector(
            //                 onTap: () {
            //                   Get.toNamed(Routes.bookingDetailsScreen);
            //                 },
            //                 child: customBookingContainer(
            //                   titleName: "Greenlab Biotech",
            //                   category: "Blood test",
            //                   date: "12 Jan, 2024",
            //                   status: AppString.upcomingText,
            //                 ),
            //               );
            //             },
            //           ),
            //           ListView.builder(
            //             itemCount: 2,
            //             padding: EdgeInsets.zero,
            //             shrinkWrap: true,
            //             physics: const NeverScrollableScrollPhysics(),
            //             primary: false,
            //             itemBuilder: (context, index) {
            //               return customBookingContainer(
            //                 titleName: "Greenlab Biotech",
            //                 category: "Blood test",
            //                 date: "12 Jan, 2024",
            //                 status: AppString.upcomingText,
            //               );
            //             },
            //           ),
            //           ListView.builder(
            //             itemCount: 2,
            //             padding: EdgeInsets.zero,
            //             shrinkWrap: true,
            //             physics: const NeverScrollableScrollPhysics(),
            //             primary: false,
            //             itemBuilder: (context, index) {
            //               return customBookingContainer(
            //                 titleName: "Greenlab Biotech",
            //                 category: "Blood test",
            //                 date: "12 Jan, 2024",
            //                 status: AppString.completedText,
            //               );
            //             },
            //           ),
            //           ListView.builder(
            //             itemCount: 1,
            //             padding: EdgeInsets.zero,
            //             shrinkWrap: true,
            //             physics: const NeverScrollableScrollPhysics(),
            //             primary: false,
            //             itemBuilder: (context, index) {
            //               return customBookingContainer(
            //                 titleName: "Greenlab Biotech",
            //                 category: "Blood test",
            //                 date: "12 Jan, 2024",
            //                 status: AppString.cancelledText,
            //               );
            //             },
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // );
          },
        ));
  }
}
