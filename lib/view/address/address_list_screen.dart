import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Widgets/app_button.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          return Scaffold(
            appBar: const AppAppBar(titleText: "Addresses"),
            body: controller.addressList.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.addressList.length,
                    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: kGrey,
                              blurRadius: 1.5.r,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: kWhite,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: kGreen,
                                  width: 1.5.r,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: titleSmallText(
                                text: controller.addressList[index],
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(AppAssets.noDataFoundImage, scale: 4),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(
                            text: "No address added yet",
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
                            text: "Tap ‘Add new address’ button below\nto add your first address",
                            color: Color(0xFF868796),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
            bottomNavigationBar: CustomButton(
              margin: EdgeInsets.only(top: 10.h, bottom: 20.h, left: 25.w, right: 25.w),
              buttonText: "",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  headingSemiBoldText(text: "Add new address"),
                ],
              ),
              onTap: () {
                Get.toNamed(Routes.addAddressScreen);
              },
            ),
          );
        });
  }
}
