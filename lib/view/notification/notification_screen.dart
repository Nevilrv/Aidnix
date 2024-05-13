import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Notifications"),
      body: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              children: [
                Row(
                  children: [
                    customText(
                      text: "Today, 15 Jan 2024",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFABABAB),
                    ),
                    SizedBox(width: 10.w),
                    const Expanded(
                      child: Divider(
                        height: 0,
                        color: Color(0xFFABABAB),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(color: Color(0xFF31C48D).withOpacity(0.1), blurRadius: 30),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleSmallText(
                                  text: "Your appointment with Dr Khalid is on this Friday",
                                  maxLines: 3,
                                ),
                                SizedBox(height: 10.h),
                                customText(
                                  text: "9:41 PM",
                                  color: Color(0xFF9399A7),
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
