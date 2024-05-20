import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/checkup/cart_controller.dart';
import 'package:aidnix/view/checkup/checkup_controller.dart';
import 'package:aidnix/view/dashboard/dashboard_controller.dart';
import 'package:aidnix/view/home/home_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  HomeController homeController = Get.put(HomeController());
  CartController cartController = Get.put(CartController());

  // String cartId = "be641211-a8ba-4830-a905-f3597f2e8e9f";
  // String labId = "1f24f386-5fcc-4b83-a19d-5b50d5582359";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await homeController.homeAPI().then((value) async {
        await cartController.getCartData();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return GetBuilder<CartController>(
            init: CartController(),
            builder: (cartController) {
              return Scaffold(
                backgroundColor: kWhite,
                body: controller.screenList[controller.selected],
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: kLightGreen,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.r),
                      topLeft: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Show Cart Popup
                      if (controller.selected != 3 && cartController.cartData != null)
                        if ((cartController.cartData?.labItems?.length ?? 0) > 0)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 12.h, bottom: 18.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: kLightBgColor,
                                      radius: 30.r,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                        child: Image.asset(
                                          AppAssets.labProfile,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 2.h,
                                      right: 2.w,
                                      child: Icon(
                                        Icons.verified,
                                        color: kGreen,
                                        size: 20.w,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 15.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(text: cartController.cartData?.labItems?.first.name ?? '', fontSize: 16.sp),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.h, bottom: 6.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          customText(text: "1 test", fontSize: 12.sp, fontWeight: FontWeight.w300),
                                          SizedBox(width: 3.w),
                                          customText(
                                            text: "₹ ${cartController.cartData?.labItems?.first.amount ?? 0}",
                                            fontSize: 16.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: kWhite.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(15.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          customText(text: "View Test List", fontSize: 12.sp, color: kBlack, fontWeight: FontWeight.w300),
                                          SizedBox(width: 3.w),
                                          Icon(Icons.arrow_forward_ios, size: 13.sp)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CustomButton(
                                  buttonColor: kWhite,
                                  height: 45.h,
                                  buttonText: "",
                                  child: Center(
                                    child: regularSemiBoldText(
                                      text: AppString.checkout,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(width: 9.w),
                                GestureDetector(
                                  onTap: () {
                                    customShowDialog(
                                      context: context,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                                        decoration: BoxDecoration(
                                          color: kWhite,
                                          borderRadius: BorderRadius.circular(25.r),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 10.h, bottom: 28.h),
                                              child: customText(
                                                  text: "Are you Sure you want\nto delete this Test? ",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  fontSize: 24.sp),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: CustomButton(
                                                    height: 47.h,
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    buttonColor: kWhite,
                                                    border: Border.all(color: kLightGreen, width: 1),
                                                    buttonText: "",
                                                    child: Center(
                                                      child: customText(
                                                          text: AppString.yes,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 17.sp,
                                                          color: kDarkGrey1),
                                                    ),
                                                    onTap: () async {
                                                      /// Delete Cart Item API
                                                      await cartController.deleteCartItemDataApi();
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 15.w),
                                                Expanded(
                                                  flex: 1,
                                                  child: CustomButton(
                                                    height: 47.h,
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    buttonColor: kLightGreen,
                                                    buttonText: '',
                                                    child: Center(
                                                      child: customText(text: AppString.no, fontWeight: FontWeight.w600, fontSize: 17.sp),
                                                    ),
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15.h)
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 40.h,
                                    decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppAssets.delete,
                                        height: 25.h,
                                        width: 25.w,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                      /// BottomBar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          color: kBottomColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            controller.bottomItems.length,
                            (index) => GestureDetector(
                              onTap: () {
                                controller.selected = index;
                                controller.update();
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    controller.bottomItems[index]['icon']!,
                                    height: 28,
                                    color: controller.selected == index ? kBlack : const Color(0xffA6A6A6),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.bottomItems[index]['title']!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Poppins",
                                      color: controller.selected == index ? kBlack : const Color(0xffA6A6A6),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
