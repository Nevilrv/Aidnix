import 'package:aidnix/view/home/home_controller.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchLabListingScreen extends StatefulWidget {
  const SearchLabListingScreen({super.key});

  @override
  State<SearchLabListingScreen> createState() => _SearchLabListingScreenState();
}

class _SearchLabListingScreenState extends State<SearchLabListingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),

                      /// header

                      customAppBar(),

                      ///search bar

                      SizedBox(height: 15.h),

                      customSearchBar(context: context, searchController: controller.search),

                      SizedBox(height: 15.h),

                      regularText(
                        text: "Great! Please select the lab which suits you best",
                        color: kDarkGrey,
                        maxLines: 2,
                      ),

                      SizedBox(height: 20.h),

                      ListView.builder(
                        itemCount: 3,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        itemBuilder: (context, index) {
                          return customCartContainer(
                            titleName: "Greenlab Biotech",
                            rating: "5.0",
                            noOfRating: "1.1k",
                            noOfTest: "100",
                            address: "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                            offerPercentage: 20,
                            distance: '2.2',
                            isAddToCart: true,
                            isRecommended: true,
                          );
                        },
                      ),
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
