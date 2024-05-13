import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarCodeScreen extends StatelessWidget {
  const BarCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleBoldText(text: "Show this bar code at lab center"),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: kLightGrey)),
                child: Image.asset(
                  AppAssets.qrCodeImage,
                  scale: 1.1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
