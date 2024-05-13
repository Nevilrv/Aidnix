import 'package:aidnix/Widgets/app_button.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_string.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authScreenController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authScreenController.simDataInit();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240.h,
                width: 430.w,
                color: kGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 41.h, bottom: 22.h),
                      child: assetImage(AppAssets.logo, height: 105.h, width: 108.w),
                    ),
                    customText(text: AppString.welcomeToAidNix, color: kWhite, fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 97.h, bottom: 5.h),
                child: customText(text: AppString.enterYourPhone, color: kBlack, fontSize: 24.sp, fontWeight: FontWeight.w600),
              ),
              customText(
                  text: AppString.enterYourDetails,
                  color: kBlack,
                  fontSize: 14.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w).copyWith(top: 32.h, bottom: 60.h),
                child: Form(
                  key: formKey,
                  child: CustomTextField(
                    prefixIcon: const CountryCodePicker(
                      padding: EdgeInsets.zero,
                      initialSelection: 'IN',
                      favorite: ['+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      showFlag: false,
                    ),
                    controller: controller.numberController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    labelText: "",
                    validator: (value) {
                      if (controller.numberController.text.isEmpty) {
                        return AppString.pleaseEnterValid;
                      } else if (value?.length != 10) {
                        return AppString.pleaseEnterValid;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              CustomButton(
                buttonText: "",
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Center(
                  child: regularSemiBoldText(text: AppString.sendOtp),
                ),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await controller.loginAPI();
                    // Get.toNamed(Routes.otpScreen);
                  }
                },
              ),
            ],
          ),
        );
      },
    ));
  }
}
