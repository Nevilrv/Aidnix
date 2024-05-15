import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/auth/auth_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() => _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  AuthController authController = Get.put<AuthController>(AuthController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authController.isFrom = Get.arguments != null ? Get.arguments["isFrom"] : "";

      if (authController.isFrom.isNotEmpty) {
        if (authController.isFrom == "Terms") {
          authController.termsAndCondition();
        }

        if (authController.isFrom == "Privacy") {
          authController.privacyPolicy();
        }
        if (authController.isFrom == "AboutUs") {
          authController.aboutUs();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return controller.isLoading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: kPrimary),
                ),
              )
            : Scaffold(
                appBar: AppAppBar(titleText: controller.privacyData?.title ?? ""),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        regularText(
                          text: controller.privacyData?.pageDescription ?? "",
                          maxLines: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
