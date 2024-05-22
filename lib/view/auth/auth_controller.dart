import 'dart:developer';
import 'dart:io';
import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/models/res_login_api.dart';
import 'package:aidnix/models/res_terms_and_conditions.dart';
import 'package:aidnix/repository/auth_repository.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/utils/shared_prefs.dart';
import 'package:aidnix/widgets/number_select_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simnumber/sim_number.dart';
import 'package:simnumber/siminfo.dart';
import 'dart:async';

class AuthController extends GetxController {
  bool isLoading = false;
  String isFrom = "";

  ///LOGIN SCREEN
  ResLoginApi resLoginApi = ResLoginApi();
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  int numberSelect = 0;
  SimInfo simInfo = SimInfo([]);

  Future<void> simDataInit() async {
    SimNumber.listenPhonePermission((isPermissionGranted) async {
      print("isPermissionGranted : $isPermissionGranted");
      if (isPermissionGranted) {
        initPlatformState();
      } else {
        await Permission.phone.request();
      }
    });
  }

  Future<void> initPlatformState() async {
    try {
      simInfo = await SimNumber.getSimData();
      update();
      log('simInfo.cards.length===========>>>>${simInfo.cards.length}');

      if (simInfo.cards.isNotEmpty) {
        if (simInfo.cards.length > 1) {
          Get.dialog(
            const Dialog(child: NumberSelectDialog()),
            useSafeArea: true,
            barrierColor: kBlack26.withOpacity(0.5),
          );
          simInfo.cards.forEach((element) {
            log('element.slotIndex==========1=>>>>${element.slotIndex}');
            log('element.slotIndex==========2=>>>>${element.carrierName}');
            log('element.slotIndex==========3=>>>>${element.displayName}');
            log('element.slotIndex==========4=>>>>${element.phoneNumber}');
            log('element.slotIndex==========5=>>>>${element.countryIso}');
          });
        } else {
          simInfo.cards.forEach((element) {
            log('element.slotIndex==========11=>>>>${element.slotIndex}');
            log('element.slotIndex==========22=>>>>${element.carrierName}'); //
            log('element.slotIndex==========33=>>>>${element.displayName}');
            log('element.slotIndex==========44=>>>>${element.phoneNumber}');
            log('element.slotIndex==========55=>>>>${element.countryIso}');
          });
        }
      } else {
        log("SIM_CARD_EMPTY");
      }
    } on PlatformException {
      print("simInfo  : " "2");
    }
  }

  List<Map<String, dynamic>> onBoardList = [
    {
      "image": AppAssets.onboardingImage,
      "text": "Accurate Testing, Unbeatable Prices",
      "detailText": "Book your medical tests from Certified Labs, Exclusively on Our Platform in Your City!"
    },
    {
      "image": AppAssets.onboardingImage,
      "text": "Experience Unmatched price and Convenience ",
      "detailText": "Book with Us for the Most Accurate Results, Lowest Prices, and Exclusive Discounts!"
    },
    {
      "image": AppAssets.onboardingImage,
      "text": "Experience Unmatched price and Convenience ",
      "detailText": "Book with Us for the Most Accurate Results, Lowest Prices, and Exclusive Discounts!"
    }
  ];

  bool check = false;
  String otpToken = "";

  PrivacyData? privacyData;

  checkValue(bool value) {
    check = value;
    update();
  }

  PageController pageController = PageController();
  int selected = 0;
  changeTabs(index) {
    selected = index;
    update();
  }

  nextPage() {
    if (selected == 2) {
      if (check) {
        Get.offAllNamed(Routes.loginScreen);
      }
    } else {
      selected++;
      pageController.animateToPage(
        selected,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    }
    update();
  }

  /// Login

  Future<void> loginAPI({bool resendOtp = false}) async {
    var devInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AndroidDeviceInfo? androidDevData;
    IosDeviceInfo? iosDevData;
    if (Platform.isIOS) {
      iosDevData = await devInfo.iosInfo;
      print("Ios Device Info ::::::::: ${iosDevData.systemVersion}");
    } else {
      androidDevData = await devInfo.androidInfo;
      print("Android Device Info ::::::::: ${androidDevData.display}");
    }
    // log('simData==========>>>>>${jsonEncode(simData)}');

    // print("Package Info version ::::::::: ${packageInfo.version}");
    // print("Package Info buildNumber ::::::::: ${packageInfo.buildNumber}");

    var body = {
      "mobile": numberController.text.trim().toString(),
      "auth_type": "OTP",
      "delivery_type": "TEXT",
      "retry": resendOtp,
      "X-App-Version-Code": packageInfo.buildNumber,
      "X-Device-Id": androidDevData?.id,
      "X-Platform": Platform.isIOS ? "IOS" : "ANDROID",
      "X-OS-Version": androidDevData?.version.release,
    };

    log("Request Login API Data ::::::::::: $body");

    var response = await AuthRepository().loginAPI(body: body);
    log("Response Login API Data ::::::::::: $response");
  }

  /// OTP_VERIFY

  Future<void> otpVerify(String otp, String otpToken) async {
    var devInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AndroidDeviceInfo? androidDevData;
    IosDeviceInfo? iosDevData;
    if (Platform.isIOS) {
      iosDevData = await devInfo.iosInfo;
      print("Ios Device Info ::::::::: ${iosDevData.systemVersion}");
    } else {
      androidDevData = await devInfo.androidInfo;
    }

    // print("Package Info version ::::::::: ${packageInfo.version}");
    // print("Package Info buildNumber ::::::::: ${packageInfo.buildNumber}");

    var body = {
      "mobile": numberController.text.trim().toString(),
      "otp_token": otpToken,
      "otp": otp, // '1234',
      "device_details": {
        "id": androidDevData?.id.toString(),
        "notification_token": "${preferences.getString(SharedPreference.fcmToken)}",
        "brand": androidDevData?.manufacturer.toString(),
        "carrier": simInfo.cards[numberSelect].carrierName ?? '',
        "device_name": androidDevData?.brand.toString(),
        "gms_version": "20.45.16 (040408-344294571)",
        "manufacturer": androidDevData?.manufacturer.toString(),
        "network_type": "4G",
        "os": Platform.isIOS ? "IOS" : "ANDROID",
        "osVersion": androidDevData?.version.release.toString(),
        "screen_height": Get.height.toString(),
        "screen_width": Get.width.toString(),
        "screen_dpi": "xxhdpi",
        "simData":
            "SIM_STATE_READY SIM Country ISO = ${simInfo.cards[numberSelect].countryIso ?? 'in'}, SIM Operator = 405867, SIM Operator Name = ${simInfo.cards[numberSelect].carrierName ?? ''}",
        "rooted_device": false,
        "rooted_device_dustom": false,
        "gmails": "",
        "emails": "",
        "installer": "com.android.vending",
        "allow_mock_locations": false
      }
    };

    print("Request Verify OTP API Data ::::::::::: $body");
    var response = await AuthRepository().verifyOtpAPI(body: body);

    log("response Verify OTP :::::::::::::::: ${response}");
  }

  /// Log Out

  Future<void> logOut() async {
    var response = await AuthRepository().logOutAPI();
    update();
    log('Response Logout API :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        preferences.clear();
        Get.offAllNamed(Routes.loginScreen);
      }
    }
  }

  /// Terms And Conditions

  Future<void> termsAndCondition() async {
    isLoading = true;
    update();
    var response = await AuthRepository().getTermsAndConditionsAPI();
    update();
    log('Response Terms And Conditions Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        privacyData = response.data;
        update();
      }
    }

    isLoading = false;
    update();
  }

  /// Privacy Policy

  Future<void> privacyPolicy() async {
    isLoading = true;
    update();
    var response = await AuthRepository().getPrivacyPolicyAPI();
    update();
    log('Response Privacy Policy Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        privacyData = response.data;
        update();
      }
    }

    isLoading = false;
    update();
  }

  /// About Us

  Future<void> aboutUs() async {
    isLoading = true;
    update();
    var response = await AuthRepository().getAboutUsAPI();
    update();
    log('Response AboutUs Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        privacyData = response.data;
        update();
      }
    }

    isLoading = false;
    update();
  }
}
