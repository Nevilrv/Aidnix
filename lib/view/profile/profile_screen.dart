import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/profile/profile_controller.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put<ProfileController>(ProfileController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileController.getGeneralSetting();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: 15.h),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {},
                  //         child: Image.asset(AppAssets.backArrow, scale: 3),
                  //       ),
                  //       headingText(text: "My Profile"),
                  //       const SizedBox(),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  // controller.profileData?.profilePic?.id ??
                                  "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: kWhite,
                              radius: 17.r,
                              child: CircleAvatar(
                                radius: 15.r,
                                backgroundColor: kGreen,
                                child: Image.asset(
                                  AppAssets.editIcon,
                                  scale: 3.5,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  customText(
                    text: "Ahsan Hasan",
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.callIcon,
                        scale: 3,
                        color: kGreen,
                      ),
                      SizedBox(width: 10.w),
                      regularText(
                        text: "+91 1234567890",
                        color: kDarkGrey1,
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        height: 20.h,
                        child: VerticalDivider(width: 0),
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        AppAssets.mailIcon,
                        scale: 4,
                        color: kGreen,
                      ),
                      SizedBox(width: 10.w),
                      regularText(
                        text: controller.profileData?.email ?? "email@mail.com",
                        color: kDarkGrey1,
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  profileRow(
                    tabName: "General Setting",
                    tabIcon: AppAssets.personIcon,
                    onTap: () {
                      Get.toNamed(Routes.generalSettingScreen);
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Health profile",
                    tabIcon: AppAssets.notificationIcon,
                    onTap: () {
                      Get.toNamed(Routes.healthProfileScreen);
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Health records",
                    tabIcon: AppAssets.healthRecord,
                    onTap: () {
                      Get.toNamed(Routes.healthRecordsScreen);
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Addresses",
                    tabIcon: AppAssets.addressLock,
                    onTap: () {
                      Get.toNamed(Routes.addressListScreen);
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Family member ",
                    tabIcon: AppAssets.familyMember,
                    onTap: () {
                      Get.toNamed(Routes.familyMemberScreen);
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Bookings",
                    tabIcon: AppAssets.familyMember,
                    onTap: () {
                      Get.toNamed(Routes.bookingScreen);
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Privacy policy ",
                    tabIcon: AppAssets.privacyPolicy,
                    onTap: () {
                      Get.toNamed(
                        Routes.termsAndConditionsScreen,
                        arguments: {"isFrom": "Privacy"},
                      );
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Terms & Conditions",
                    tabIcon: AppAssets.healthRecord,
                    onTap: () {
                      Get.toNamed(
                        Routes.termsAndConditionsScreen,
                        arguments: {"isFrom": "Terms"},
                      );
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Chat with us ",
                    tabIcon: AppAssets.chatWithUs,
                    onTap: () {
                      Get.toNamed(
                        Routes.termsAndConditionsScreen,
                        arguments: {"isFrom": "AboutUs"},
                      );
                    },
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    height: 0,
                    color: kGrey.withOpacity(0.5),
                  ),
                  SizedBox(height: 15.h),
                  profileRow(
                    tabName: "Log out",
                    tabIcon: AppAssets.logout,
                    onTap: () {
                      customShowDialog(
                        context: context,
                        child: LogoutDialog(),
                      );
                    },
                  ),
                  SizedBox(height: 100.h),
                  titleSmallText(
                    text: "AIDNIX | App version 2.3.6",
                    color: kGrey,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        });
  }

  Widget profileRow({
    required String tabName,
    required String tabIcon,
    void Function()? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(tabIcon, scale: 4),
            SizedBox(width: 15.w),
            titleSmallText(
              text: tabName,
              color: const Color(0xFF454545),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_rounded, size: 20.h, color: kDarkGrey1),
          ],
        ),
      ),
    );
  }
}
