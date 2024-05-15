import 'dart:developer';

import 'package:aidnix/utils/app_routes.dart';
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
                                  context: context,
                                  searchController: controller.search,
                                  onChanged: (value) {
                                    controller.search.text = value;
                                    controller.update();
                                  },
                                  onFilterTap: () {
                                    customBottomSheet(
                                      context: context,
                                      child: const FilterBottomSheet(),
                                    );
                                  }),
                            ),

                            if (controller.search.text.isEmpty) ...[
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
                                      Row(
                                        children: [
                                          CustomButton(
                                            buttonText: "",
                                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                            child: Row(
                                              children: [
                                                Image.asset(AppAssets.callIcon, scale: 4),
                                                SizedBox(width: 5.w),
                                                customText(
                                                    text: controller.homeData?.chatOrChatHelp?.buttons?[0].title ?? "", fontSize: 12.sp),
                                              ],
                                            ),
                                            onTap: () {},
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomButton(
                                            buttonText: "",
                                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                            buttonColor: kWhite,
                                            child: Row(
                                              children: [
                                                Image.asset(AppAssets.whatsAppLogo, scale: 4),
                                                SizedBox(width: 5.w),
                                                customText(
                                                    text: controller.homeData?.chatOrChatHelp?.buttons?[1].title ?? "", fontSize: 12.sp),
                                              ],
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
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
                                              customText(text: "See All", fontSize: 12.sp),
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
                                            controller.homeData!.nearbyLabs!.length,
                                            (bannerIndex) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                                child: customCartContainer(
                                                  titleName: controller.homeData?.nearbyLabs?[bannerIndex].name ?? "",
                                                  rating: controller.homeData?.nearbyLabs?[bannerIndex].reviews ?? "",
                                                  noOfRating: controller.homeData?.nearbyLabs?[bannerIndex].reviews ?? "",
                                                  noOfTest: controller.homeData?.nearbyLabs?[bannerIndex].totalTests ?? "",
                                                  address: controller.homeData?.nearbyLabs?[bannerIndex].address ?? "",
                                                  offerPercentage: 20,
                                                  distance:
                                                      "${controller.homeData?.nearbyLabs?[bannerIndex].distance!.value.toString()} ${controller.homeData?.nearbyLabs![bannerIndex].distance?.unit ?? ""}",
                                                  isAddToCart: false,
                                                  isRecommended: controller.homeData?.nearbyLabs?[bannerIndex].recommended ?? false,
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
                                      child: Column(
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
                                              return Container(
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
                                                          text: controller.homeData!.reviews![bannerIndex].rating.toString(),
                                                          color: kYellow),
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

                            if (controller.search.text.isNotEmpty) ...[
                              if (controller.search.text.length <= 3) ...[
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
                                      rating: '5.0',
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
                              if (controller.search.text.length > 3) ...[
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
        });
  }
}
