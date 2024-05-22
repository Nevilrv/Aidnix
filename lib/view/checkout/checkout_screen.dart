import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/models/res_get_family_member.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:aidnix/view/checkout/checkout_contrroler.dart';
import 'package:aidnix/view/family_member/family_member_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LabCheckoutScreen extends StatefulWidget {
  const LabCheckoutScreen({super.key});

  @override
  State<LabCheckoutScreen> createState() => _LabCheckoutScreenState();
}

class _LabCheckoutScreenState extends State<LabCheckoutScreen> {
  FamilyMemberController familyMemberController = Get.put(FamilyMemberController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      familyMemberController.getFamilyMemberApi();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FamilyMemberController>(
        init: FamilyMemberController(),
        builder: (familyCont) {
          return GetBuilder<CheckoutController>(
              init: CheckoutController(),
              builder: (controller) {
                return GetBuilder<AddressController>(
                    init: AddressController(),
                    builder: (addressCont) {
                      return Scaffold(
                        appBar: const AppAppBar(titleText: AppString.checkout),
                        body: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 21.w),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                text: addressCont.primaryAddress?.type?.toUpperCase() ?? "HOME",
                                                fontSize: 17.sp,
                                              ),
                                              SizedBox(height: 12.h),
                                              customText(
                                                text:
                                                    "${addressCont.primaryAddress?.line1 ?? ""}, ${addressCont.primaryAddress?.line2 ?? ""}, ${addressCont.primaryAddress?.city ?? ""}, ${addressCont.primaryAddress?.state ?? ""}, ${addressCont.primaryAddress?.pincode ?? ""}",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.addressListScreen);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: kGreyBorderColor),
                                              borderRadius: BorderRadius.circular(4.r),
                                            ),
                                            child: Center(
                                              child: customText(
                                                text: AppString.change,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 35.h, bottom: 20.h),
                                    child: customText(
                                      text: AppString.selectPatients,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  if (familyCont.selfData != null) ...[
                                    GestureDetector(
                                      onTap: () {
                                        familyCont.isFamilyPatient = false;
                                        familyCont.selectedFamilyMember = null;
                                        familyCont.update();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                                        decoration: BoxDecoration(
                                          color: kWhite,
                                          borderRadius: BorderRadius.circular(15.r),
                                          boxShadow: [
                                            BoxShadow(color: kLightGrey, blurRadius: 3),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              size: 25,
                                              color: familyCont.isFamilyPatient == false ? kGreen : kWhite,
                                            ),
                                            SizedBox(width: 12.w),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                customText(
                                                  text: "My self",
                                                  fontSize: 17.sp,
                                                ),
                                                Row(
                                                  children: [
                                                    customText(
                                                      text: "Age: ${familyCont.selfData?.age ?? 0}",
                                                      fontSize: 12.sp,
                                                      color: kDarkGrey1,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    SizedBox(width: 12.w),
                                                    customText(
                                                      text: "Gender: ${familyCont.selfData?.gender?.toUpperCase() ?? "MALE"}",
                                                      fontSize: 12.sp,
                                                      color: kDarkGrey1,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                  ],
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
                                    decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(15.r),
                                      boxShadow: [
                                        BoxShadow(color: kLightGrey, blurRadius: 3),
                                      ],
                                    ),
                                    child: DropdownButton<FamilyData>(
                                      onTap: () {
                                        familyCont.isFamilyPatient = true;
                                        familyCont.update();
                                      },
                                      underline: const SizedBox(),
                                      padding: EdgeInsets.zero,
                                      hint: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle_rounded,
                                            size: 25,
                                            color: familyCont.isFamilyPatient ? kGreen : kWhite,
                                          ),
                                          SizedBox(width: 12.w),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              customText(
                                                text: familyCont.selectedFamilyMember != null
                                                    ? familyCont.selectedFamilyMember?.name ?? "Other"
                                                    : "Other",
                                                fontSize: 17.sp,
                                              ),
                                              if (familyCont.selectedFamilyMember != null) ...[
                                                Row(
                                                  children: [
                                                    customText(
                                                      text: "Age: ${familyCont.selectedFamilyMember?.age ?? 0}",
                                                      fontSize: 12.sp,
                                                      color: kDarkGrey1,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    SizedBox(width: 15.w),
                                                    customText(
                                                      text: "Gender: ${familyCont.selectedFamilyMember?.gender ?? "MALE"}",
                                                      fontSize: 12.sp,
                                                      color: kDarkGrey1,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ],
                                          ),
                                        ],
                                      ),
                                      isExpanded: true,
                                      borderRadius: BorderRadius.circular(12),
                                      icon: Icon(
                                        Icons.expand_more,
                                        size: 33,
                                        color: kBlack,
                                      ),
                                      items: familyCont.familyDropDownList.map((FamilyData familyData) {
                                        return DropdownMenuItem(
                                          value: familyData,
                                          child: Row(
                                            children: [
                                              familyCont.selectedFamilyMember == familyData
                                                  ? Icon(
                                                      Icons.radio_button_checked_rounded,
                                                      color: kGreen,
                                                    )
                                                  : familyData.referenceId != "Empty"
                                                      ? Icon(
                                                          Icons.radio_button_off_rounded,
                                                          color: kGreen,
                                                        )
                                                      : SizedBox(width: 50.w),
                                              SizedBox(width: 15.w),
                                              customText(
                                                text: familyData.name ?? "",
                                                color: familyData.referenceId != "Empty" ? kBlack : kBlue,
                                                fontSize: familyData.referenceId != "Empty" ? 14.sp : 16.sp,
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (FamilyData? familyData) {
                                        if (familyData != null) {
                                          if (familyData.referenceId == "Empty") {
                                            Get.toNamed(Routes.addFamilyMemberScreen);
                                          } else {
                                            familyCont.selectedFamilyMember = familyData;
                                            controller.update();
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 25.h),
                                  CustomButton(
                                    buttonText: AppString.bookYourSlot,
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    onTap: () {
                                      Get.toNamed(Routes.bookingSlotScreen);
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 13.h, bottom: 5.h, left: 7.w),
                                    child: customText(text: "Book your slot:", fontSize: 14.sp, color: kBlack54),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.w),
                                    child: customText(
                                      text: "DD-MM-YYYY | HH:MM AM",
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                        bottomNavigationBar: commonBottomCart(
                          buttonText: AppString.purchase,
                          buttonOnTap: () {},
                        ),
                      );
                    });
              });
        });
  }
}
