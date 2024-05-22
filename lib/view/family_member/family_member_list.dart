import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/view/family_member/family_member_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FamilyMemberListScreen extends StatefulWidget {
  const FamilyMemberListScreen({Key? key}) : super(key: key);

  @override
  State<FamilyMemberListScreen> createState() => _FamilyMemberListScreenState();
}

class _FamilyMemberListScreenState extends State<FamilyMemberListScreen> {
  FamilyMemberController familyMemberController = Get.put(FamilyMemberController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      familyMemberController.getFamilyMemberApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Family member"),
      body: GetBuilder<FamilyMemberController>(
        init: FamilyMemberController(),
        builder: (controller) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(color: kGreen),
                )
              : controller.familyData.isEmpty
                  ? const Center(
                      child: Text("No Data Found!"),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.familyData.length,
                      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: kGrey.withOpacity(0.1),
                                blurRadius: 30,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 35.r,
                                backgroundColor: kWhite,
                                backgroundImage: const NetworkImage(
                                  "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(text: controller.familyData[index].name ?? '', fontSize: 20.sp),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppAssets.relationLink,
                                          scale: 4,
                                        ),
                                        SizedBox(width: 5.w),
                                        regularText(text: controller.familyData[index].relation ?? '', color: kGrey),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              const Icon(
                                Icons.more_vert_rounded,
                                color: Color(0xFF717171),
                              ),
                            ],
                          ),
                        );
                      },
                    );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kGreen,
        onPressed: () {
          Get.toNamed(Routes.addFamilyMemberScreen);
        },
        child: Icon(
          Icons.add,
          color: kWhite,
        ),
      ),
    );
  }
}
