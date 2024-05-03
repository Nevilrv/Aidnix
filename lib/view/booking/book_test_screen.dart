import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_assets.dart';

class BookTestScreen extends StatefulWidget {
  const BookTestScreen({Key? key}) : super(key: key);

  @override
  State<BookTestScreen> createState() => _BookTestScreenState();
}

class _BookTestScreenState extends State<BookTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: assetImage(
                AppAssets.bookTestSuccess,
              ),
            ),
            SizedBox(height: 5.h),
            customText(text: "SUCSESSFUL\nYOUR TEST IS BOOK", fontSize: 24.sp, color: kBlack, height: 2, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
