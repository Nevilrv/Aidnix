import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Widgets/app_button.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  AddressController addressController = Get.put<AddressController>(AddressController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addressController.getAllAddress();
    });

    super.initState();
  }

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
                      return GestureDetector(
                        onTap: () async {
                          controller.primaryAddress = controller.addressList[index];
                          controller.homePageAddress = "${controller.addressList[index].city}";

                          List<Location> locations = await locationFromAddress(
                              "${controller.addressList[index].line1}, ${controller.addressList[index].line2}, ${controller.addressList[index].city}, ${controller.addressList[index].state} - ${controller.addressList[index].pincode}");

                          controller.latitude = locations.first.latitude;
                          controller.longitude = locations.first.longitude;

                          controller.update();
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: kGrey.withOpacity(0.5),
                                blurRadius: 1.r,
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
                                child: Icon(
                                  Icons.circle,
                                  color:
                                      controller.primaryAddress?.referenceId == controller.addressList[index].referenceId ? kGreen : kWhite,
                                  size: 12,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: titleSmallText(
                                  // text: "${controller.addressList[index].line1},${controller.addressList[index].line2?.isNotEmpty ?? false ? "${controller.addressList[index].line2},${controller.addressList[index].city?.isNotEmpty ?? false ? "${controller.addressList[index].city}," : "${controller.addressList[index].state}"}" : "${controller.addressList[index].city?.isNotEmpty ?? false ? "${controller.addressList[index].city}," : "${controller.addressList[index].state}"}"} - ${controller.addressList[index].pincode}",
                                  text:
                                      "${controller.addressList[index].line1}, ${controller.addressList[index].line2}, ${controller.addressList[index].city}, ${controller.addressList[index].state} - ${controller.addressList[index].pincode}",
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
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
