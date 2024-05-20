import 'dart:convert';
import 'dart:developer';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/utils/call_chat_service.dart';
import 'package:aidnix/view/home/home_controller.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/filter_bottom_sheet.dart';
import 'package:aidnix/widgets/upload_prescription_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.homeAPI();
    });
    super.initState();
  }

  @override
  void dispose() {
    homeController.search.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(color: kGreen),
              )
            : controller.homeData == null
                ? const Center(
                    child: Text("No Data Found!"),
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
                              searchController: controller.search,
                              onChanged: (value) {
                                controller.search.text = value;

                                if (value.trim().isEmpty) {
                                  controller.isSearch = false;
                                  controller.searchHomeData = [];
                                }

                                controller.update();
                              },
                              onFilterTap: () {
                                if (controller.filterData.isEmpty) {
                                  controller.getHomeFilterApi().then((value) {
                                    controller.getList();
                                  });
                                }

                                customBottomSheet(
                                  context: context,
                                  child: FilterBottomSheet(
                                    onSearchFilterTap: () {},
                                  ),
                                );
                              },
                              onSuffixTap: () {
                                if (controller.search.text.trim().isNotEmpty) {
                                  controller.homeSearchAPI();
                                }
                              },
                            ),
                          ),

                          if (controller.isSearch == false) ...[
                            /// First Lab Test

                            SizedBox(height: 20.h),

                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 22.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFFC0F4FF),
                                borderRadius: BorderRadius.circular(12.r),
                                image: const DecorationImage(
                                  image: AssetImage(AppAssets.homeFirstLabTest),
                                  scale: 4.5,
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                              child: ClipRRect(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                      child: SizedBox(
                                        width: 200.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            headingSemiBoldText(text: controller.homeData?.firstTimeOffer?.title ?? "", maxLines: 2),
                                            SizedBox(height: 5.h),
                                            customText(
                                              text: controller.homeData?.firstTimeOffer?.subtitle ?? "",
                                              fontSize: 12.sp,
                                              color: kDarkGrey1,
                                              maxLines: 2,
                                            ),
                                            SizedBox(height: 20.h),
                                            CustomButton(
                                              buttonText: controller.homeData?.firstTimeOffer?.buttons?.first.title ?? "",
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 18.h,
                                      right: -45.w,
                                      child: Transform.rotate(
                                        angle: 0.5,
                                        child: Container(
                                          height: 25.h,
                                          width: 180.w,
                                          color: kYellow1,
                                          child: Center(
                                            child: Text(
                                              controller.homeData?.firstTimeOffer?.discountTag ?? "",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "Poppins",
                                                color: kBlack,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Book Prescription

                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 22.w),
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(12.r),
                                image: const DecorationImage(
                                  image: AssetImage(AppAssets.homeBookPrescription),
                                  scale: 4,
                                  alignment: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(color: kBlack.withOpacity(0.1), blurRadius: 40),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 200.w,
                                      child: headingSemiBoldText(text: controller.homeData?.bookingHelp?.title ?? "", maxLines: 2),
                                    ),
                                    SizedBox(height: 5.h),
                                    // customText(
                                    //   text: "Our health experts will call you\nback in 2 minutes",
                                    //   fontSize: 12.sp,
                                    //   color: kGreen,
                                    //   maxLines: 2,
                                    // ),
                                    // SizedBox(height: 5.h),
                                    SizedBox(
                                      width: 200.w,
                                      child: customText(
                                        text: controller.homeData?.bookingHelp?.subtitle ?? "",
                                        fontSize: 12.sp,
                                        color: kDarkGrey1,
                                        fontWeight: FontWeight.w400,
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    CustomButton(
                                      buttonText: controller.homeData?.bookingHelp?.buttons?.first.title ?? "",
                                      onTap: () {
                                        customShowDialog(
                                          context: context,
                                          child: const UploadPrescriptionDialog(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Call or Chat Health Expert

                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 22.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE6F4EF),
                                borderRadius: BorderRadius.circular(12.r),
                                image: const DecorationImage(
                                  image: AssetImage(AppAssets.dummyDoctor),
                                  scale: 4,
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 200.w,
                                      child: headingSemiBoldText(text: controller.homeData?.chatOrChatHelp?.title ?? "", maxLines: 2),
                                    ),
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      width: 200.w,
                                      child: customText(
                                        text: controller.homeData?.chatOrChatHelp?.subtitle ?? "",
                                        fontSize: 12,
                                        color: const Color(0xFF7A8980),
                                        fontWeight: FontWeight.w400,
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    SizedBox(
                                      width: 250.w,
                                      height: 40.h,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.homeData?.chatOrChatHelp?.buttons?.length ?? 0,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(right: 10.w),
                                            child: CustomButton(
                                              onTap: () async {
                                                if (controller.homeData?.chatOrChatHelp?.buttons?[index].titleImage?.code == "CALL") {
                                                  launchUrlDailMethod("1234567890");
                                                } else {
                                                  launchWhatsappMethod(context, "1234567890");
                                                }
                                              },
                                              buttonText: "",
                                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                              buttonColor: controller.homeData?.chatOrChatHelp?.buttons?[index].titleImage?.code == "CALL"
                                                  ? kGreen
                                                  : kWhite,
                                              child: Row(
                                                children: [
                                                  controller.homeData?.chatOrChatHelp?.buttons?[index].titleImage?.code == "CALL"
                                                      ? Image.asset(AppAssets.callIcon, scale: 4)
                                                      : Image.asset(AppAssets.whatsAppLogo, scale: 4),
                                                  SizedBox(width: 5.w),
                                                  customText(
                                                    text: controller.homeData?.chatOrChatHelp?.buttons?[index].title ?? "",
                                                    fontSize: 12.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Labs Near You
                            controller.homeData!.nearbyLabs!.length == 0
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      SizedBox(height: 20.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            titleSemiBoldText(text: "Labs Near You"),
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed(Routes.allLabsScreen);
                                              },
                                              child: customText(text: "See All", fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          viewportFraction: 0.85,
                                          padEnds: true,
                                          enlargeCenterPage: false,
                                          height: 270.h,
                                          initialPage: 0,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlayInterval: const Duration(seconds: 8),
                                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          onPageChanged: (pageIndex, reason) {
                                            controller.currentNearYouBannerIndex = pageIndex;
                                            controller.update();
                                          },
                                        ),
                                        items: List.generate(
                                          controller.homeData?.nearbyLabs?.length ?? 0,
                                          (bannerIndex) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                    Routes.labDetailsScreen,
                                                    arguments: {"labId": controller.homeData?.nearbyLabs?[bannerIndex].referenceId ?? ""},
                                                  );
                                                },
                                                child: customCartContainer(
                                                  titleName: controller.homeData?.nearbyLabs?[bannerIndex].name ?? "",
                                                  rating: controller.homeData?.nearbyLabs?[bannerIndex].reviews ?? "",
                                                  noOfRating: controller.homeData?.nearbyLabs?[bannerIndex].reviews ?? "",
                                                  noOfTest: controller.homeData?.nearbyLabs?[bannerIndex].totalTests ?? "",
                                                  address: controller.homeData?.nearbyLabs?[bannerIndex].address ?? "",
                                                  offerPercentage: '20%',
                                                  distance:
                                                      "${controller.homeData?.nearbyLabs?[bannerIndex].distance!.value.toString()} ${controller.homeData?.nearbyLabs![bannerIndex].distance?.unit ?? ""}",
                                                  isAddToCart: false,
                                                  isRecommended: controller.homeData?.nearbyLabs?[bannerIndex].recommended ?? false,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          controller.homeData!.nearbyLabs!.length,
                                          (index1) {
                                            return Padding(
                                              padding: EdgeInsets.only(right: 3.w),
                                              child: index1 == controller.currentNearYouBannerIndex
                                                  ? AnimatedContainer(
                                                      duration: const Duration(milliseconds: 500),
                                                      height: 5.h,
                                                      width: 20.w,
                                                      decoration: BoxDecoration(
                                                        color: kGreen,
                                                        borderRadius: BorderRadius.circular(20.r),
                                                      ),
                                                    )
                                                  : CircleAvatar(backgroundColor: kGreen, radius: 3.r),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                            /// Test Category

                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: titleSemiBoldText(text: "Test Category"),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: 150.h,
                              child: ListView.builder(
                                itemCount: controller.homeData?.testCategories?.length,
                                padding: EdgeInsets.symmetric(horizontal: 22.w),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          Routes.checkUpDetailScreen,
                                          arguments: {
                                            "categoryId": controller.homeData?.testCategories?[index].referenceId ?? "",
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.r),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFFFAFCFB),
                                                  Color(0xFFE0EDE8),
                                                ],
                                              ),
                                            ),
                                            child: Image.asset(AppAssets.bloodTestIcon, height: 70.h),
                                          ),
                                          SizedBox(height: 10.h),
                                          customText(text: controller.homeData?.testCategories![index].name ?? ''),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            /// Path Labs
                            controller.homeData!.campaigns!.length == 0
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      SizedBox(height: 10.h),
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          viewportFraction: 0.85,
                                          padEnds: true,
                                          enlargeCenterPage: false,
                                          height: 245.h,
                                          initialPage: 0,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlayInterval: const Duration(seconds: 8),
                                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          onPageChanged: (pageIndex, reason) {
                                            controller.currentPathLabBannerIndex = pageIndex;
                                            controller.update();
                                          },
                                        ),
                                        items: List.generate(
                                          controller.homeData!.campaigns!.length,
                                          (bannerIndex) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                  Routes.labDetailsScreen,
                                                  arguments: {"labId": controller.homeData?.campaigns?[bannerIndex].lab?.referenceId ?? ""},
                                                );
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                                                padding: EdgeInsets.only(left: 15.w, top: 15.h, bottom: 15.h),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: kGreen,
                                                  borderRadius: BorderRadius.circular(15.r),
                                                  image: const DecorationImage(
                                                    image: AssetImage(AppAssets.homePathLabTwo),
                                                    scale: 4,
                                                    alignment: Alignment.bottomRight,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        CustomButton(
                                                          buttonText: "LIMITED FOR 3 DAYS",
                                                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                                          buttonColor: kBlack,
                                                          textStyle: TextStyle(color: kGreen, fontSize: 9.sp, fontWeight: FontWeight.w600),
                                                          onTap: () {},
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                                                          decoration: BoxDecoration(
                                                            color: kBlack,
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(20.r),
                                                              bottomLeft: Radius.circular(20.r),
                                                            ),
                                                          ),
                                                          child: customText(
                                                              text: "Ads", color: kGreen, fontSize: 10.sp, fontWeight: FontWeight.w400),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      children: [
                                                        Image.asset(AppAssets.homePathLab, scale: 4),
                                                        SizedBox(width: 10.w),
                                                        SizedBox(
                                                          width: 180.w,
                                                          child: customText(
                                                            text: controller.homeData?.campaigns?[bannerIndex].lab?.name ?? '',
                                                            fontSize: 20.sp,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    SizedBox(
                                                      width: 200.w,
                                                      child: regularText(
                                                        text: controller.homeData?.campaigns?[bannerIndex].title ?? '',
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        customText(
                                                          text: "₹${controller.homeData?.campaigns?[bannerIndex].amount ?? ''}",
                                                          decoration: TextDecoration.lineThrough,
                                                          decorationColor: kBlack,
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        customText(
                                                          text: "₹${controller.homeData?.campaigns?[bannerIndex].totalPrice ?? ''}",
                                                          fontSize: 20.sp,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppAssets.location2,
                                                          color: kBlack,
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Expanded(
                                                          child: regularText(
                                                              text:
                                                                  "${controller.homeData?.campaigns?[bannerIndex].lab?.distance?.value ?? ''} ${controller.homeData?.campaigns?[bannerIndex].lab?.distance?.unit ?? ''} from you"),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          controller.homeData!.campaigns!.length,
                                          (index1) {
                                            return Padding(
                                              padding: EdgeInsets.only(right: 3.w),
                                              child: index1 == controller.currentPathLabBannerIndex
                                                  ? AnimatedContainer(
                                                      duration: const Duration(milliseconds: 500),
                                                      height: 5.h,
                                                      width: 20.w,
                                                      decoration: BoxDecoration(
                                                        color: kGreen,
                                                        borderRadius: BorderRadius.circular(20.r),
                                                      ),
                                                    )
                                                  : CircleAvatar(backgroundColor: kGreen, radius: 3.r),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                            /// First Lab Test

                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 22.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFFC0F4FF),
                                borderRadius: BorderRadius.circular(12.r),
                                image: const DecorationImage(
                                  image: AssetImage(AppAssets.homeFirstLabTest),
                                  scale: 4.5,
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                              child: ClipRRect(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                      child: SizedBox(
                                        width: 200.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            headingSemiBoldText(text: controller.homeData?.otherOffers?.title ?? '', maxLines: 2),
                                            SizedBox(height: 5.h),
                                            customText(
                                              text: controller.homeData?.otherOffers?.subtitle ?? '',
                                              fontSize: 12.sp,
                                              color: kDarkGrey1,
                                              maxLines: 2,
                                            ),
                                            SizedBox(height: 20.h),
                                            CustomButton(
                                              buttonText: controller.homeData?.otherOffers?.buttons?.first.title ?? '',
                                              onTap: () {
                                                Get.toNamed(Routes.bookingScreen);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 18.h,
                                      right: -45.w,
                                      child: Transform.rotate(
                                        angle: 0.5,
                                        child: Container(
                                          height: 25.h,
                                          width: 180.w,
                                          color: kYellow1,
                                          child: Center(
                                            child: Text(
                                              controller.homeData?.otherOffers?.discountTag ?? '',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "Poppins",
                                                color: kBlack,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Reviews

                            SizedBox(height: 15.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: titleSemiBoldText(text: "Reviews"),
                            ),
                            SizedBox(height: 10.h),
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 0.85,
                                padEnds: true,
                                enlargeCenterPage: false,
                                height: 250.h,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlayInterval: const Duration(seconds: 8),
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                onPageChanged: (pageIndex, reason) {
                                  controller.currentReviewBannerIndex = pageIndex;
                                  controller.update();
                                },
                              ),
                              items: List.generate(
                                controller.homeData!.reviews!.length,
                                (bannerIndex) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                    padding: EdgeInsets.only(left: 15.w, top: 15.h, bottom: 15.h, right: 15.w),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(15.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlack.withOpacity(0.1),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 50.h,
                                              width: 50.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15.r),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                      "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                headingText(text: controller.homeData!.reviews![bannerIndex].name ?? ''),
                                                SizedBox(height: 5.h),
                                                Row(
                                                  children: [
                                                    RatingBar.builder(
                                                      initialRating: controller.homeData!.reviews![bannerIndex].rating!.toDouble(),
                                                      minRating: 1,
                                                      direction: Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 25.h,
                                                      ignoreGestures: true,
                                                      itemPadding: EdgeInsets.zero,
                                                      itemBuilder: (context, _) => const Icon(
                                                        Icons.star_rate_rounded,
                                                        color: Color(0xffFEA800),
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    titleText(
                                                        text: controller.homeData!.reviews![bannerIndex].rating.toString(), color: kYellow),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        titleSmallText(
                                          text: controller.homeData!.reviews![bannerIndex].review ?? '',
                                          color: kDarkGrey1,
                                          maxLines: 4,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                controller.homeData!.reviews!.length,
                                (index1) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 3.w),
                                    child: index1 == controller.currentReviewBannerIndex
                                        ? AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            height: 5.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              color: kGreen,
                                              borderRadius: BorderRadius.circular(20.r),
                                            ),
                                          )
                                        : CircleAvatar(backgroundColor: kGreen, radius: 3.r),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],

                          if (controller.isSearch) ...[
                            if (controller.isLoading)
                              Center(
                                child: CircularProgressIndicator(color: kGreen),
                              )
                            else if (controller.searchHomeData.isNotEmpty) ...[
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
                                itemCount: controller.searchHomeData.length,
                                padding: EdgeInsets.symmetric(horizontal: 22.w),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                primary: false,
                                itemBuilder: (context, index) {
                                  log('controller.searchHomeData?.length===========>>>>${jsonEncode(controller.searchHomeData)}');
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: customCartContainer(
                                      titleName: controller.searchHomeData[index].name ?? '',
                                      rating: controller.searchHomeData[index].lab?.reviews ?? '',
                                      noOfRating: controller.searchHomeData[index].lab?.reviews ?? '',
                                      noOfTest: controller.searchHomeData[index].lab?.totalTests ?? '',
                                      address: controller.searchHomeData[index].lab?.address ?? '',
                                      offerPercentage: controller.searchHomeData[index].discountTag ?? '',
                                      distance:
                                          "${controller.searchHomeData[index].lab?.distance?.value ?? ''}  ${controller.searchHomeData[index].lab?.distance?.unit ?? ''}",
                                      isAddToCart: true,
                                      isRecommended: true,
                                    ),
                                  );
                                },
                              ),
                            ] else ...[
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
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}
