import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/cart/cart_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put<CartController>(CartController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.getCartData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Scaffold(
            appBar: const AppAppBar(titleText: AppString.cart),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.h, bottom: 18.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundColor: kLightGreenIconColor,
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
                                bottom: -2.h,
                                right: -2.w,
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
                              SizedBox(height: 10.h),
                              customText(text: "Greenlab Biotech Tests", fontSize: 18.sp),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                  color: kLightGreen.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customText(
                                      text: "View lab details",
                                      fontSize: 10.sp,
                                      color: kBlack,
                                    ),
                                    SizedBox(width: 3.w),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 13.sp,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    customText(text: "${controller.cartData?.totalItems ?? 0} Tests added", fontSize: 17.sp, fontWeight: FontWeight.w400),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.cartData?.labItems?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 9.h),
                            child: Container(
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(color: kLightGrey, blurRadius: 3),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 17.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        customText(
                                          text: controller.cartData?.labItems?[index].name ?? "",
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                                          decoration: BoxDecoration(
                                            color: kLightGreen.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(10.r),
                                          ),
                                          child: Center(
                                            child: customText(
                                              text: "${controller.cartData?.labItems?[index].discountTag ?? 0}",
                                              fontSize: 11.sp,
                                              color: kBlack,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9.h),
                                    index == 1
                                        ? Container(
                                            width: 85.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                              color: kOrange,
                                              borderRadius: BorderRadius.circular(10.r),
                                            ),
                                            child: Center(
                                              child: customText(
                                                text: "campaign",
                                                fontSize: 11.sp,
                                                color: kWhite,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
                                    SizedBox(height: 3.h),
                                    Row(
                                      children: [
                                        customText(
                                            text: "₹${controller.cartData?.labItems?[index].amount ?? 0}",
                                            fontSize: 15.sp,
                                            decoration: TextDecoration.lineThrough,
                                            color: kDarkGrey,
                                            fontWeight: FontWeight.w400),
                                        SizedBox(width: 8.w),
                                        customText(
                                            text: "₹${controller.cartData?.labItems?[index].totalPrice ?? 0}",
                                            fontSize: 20.sp,
                                            color: kGreen1,
                                            fontWeight: FontWeight.w600),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            controller.deleteCartItemDataApi(
                                              labItemId: controller.cartData?.labItems?[index].referenceId ?? "",
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                            decoration: BoxDecoration(
                                              color: kRed.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(10.r),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                AppAssets.delete,
                                                height: 22.h,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: commonBottomCart(
              buttonText: AppString.proceed,
              buttonOnTap: () {
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
                        SvgPicture.asset(
                          AppAssets.wrongCart,
                          height: 60.h,
                          width: 60.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          child: customText(
                              text: "You are selecting a test from different lab, it will replace your current selected tests",
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              fontSize: 18.sp),
                        ),
                        CustomButton(
                          height: 56.h,
                          buttonText: "",
                          child: Center(child: customText(text: AppString.oK, fontWeight: FontWeight.bold, fontSize: 18.sp)),
                          onTap: () {
                            Get.toNamed(Routes.paymentScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
