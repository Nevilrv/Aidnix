import 'package:aidnix/view/health_records/health_records_controller.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HealthRecordsScreen extends StatelessWidget {
  const HealthRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        titleText: "Health Records",
      ),
      body: GetBuilder<HealthRecordsController>(
          init: HealthRecordsController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  customSearchBar(context: context, searchController: controller.searchController),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 5),
                          color: Colors.red,
                          height: 50,
                          width: 50,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
