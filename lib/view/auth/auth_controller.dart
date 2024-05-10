import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/models/res_login_api.dart';
import 'package:aidnix/repository/auth_repository.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/utils/shared_prefs.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sim_data_plus/sim_data.dart';

class AuthController extends GetxController {
  ///LOGIN SCREEN
  ResLoginApi resLoginApi = ResLoginApi();
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  List<Map<String, dynamic>> onBoardList = [
    {
      "image": AppAssets.onboardingImage,
      "text": "Accurate Testing, Unbeatable Prices",
      "detailText":
          "Book your medical tests from Certified Labs, Exclusively on Our Platform in Your City!"
    },
    {
      "image": AppAssets.onboardingImage,
      "text": "Experience Unmatched price and Convenience ",
      "detailText":
          "Book with Us for the Most Accurate Results, Lowest Prices, and Exclusive Discounts!"
    },
    {
      "image": AppAssets.onboardingImage,
      "text": "Experience Unmatched price and Convenience ",
      "detailText":
          "Book with Us for the Most Accurate Results, Lowest Prices, and Exclusive Discounts!"
    }
  ];

  bool check = false;
  String otpToken = "";

  checkValue(value) {
    check = value!;
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
      Get.offAllNamed(Routes.loginScreen);
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

  @override
  void onInit() {
    super.onInit();
  }

  loginAPI({bool resendOtp = false}) async {
    var devInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SimData simData = await SimDataPlugin.getSimData();
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

    print("Request Login API Data ::::::::::: ${body}");

    var response = await AuthRepository().loginAPI(body: body);
  }

  /// OTP_VERIFY

  otpVerify(String otp, String otpToken) async {
    var devInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SimData simData = await SimDataPlugin.getSimData();
    AndroidDeviceInfo? androidDevData;
    IosDeviceInfo? iosDevData;
    if (Platform.isIOS) {
      iosDevData = await devInfo.iosInfo;
      print("Ios Device Info ::::::::: ${iosDevData.systemVersion}");
    } else {
      androidDevData = await devInfo.androidInfo;

      print("Android Device Info ::::::::1: ${androidDevData.display}");
      print("Android Device Info ::::::::2: ${androidDevData.version.release}");
      print("Android Device Info ::::::::3: ${androidDevData.id}");
      print("Android Device Info ::::::::4: ${androidDevData.brand}");
      print("Android Device Info ::::::::5: ${androidDevData.manufacturer}");
      print("Android Device Info ::::::::6: ${androidDevData.type}");
      print("Android Device Info ::::::::7: ${androidDevData.version.release}");
      print("Android Device Info ::::::::7: ${androidDevData.version.baseOS}");
      print(
          "Android Device Info ::::::::7: ${androidDevData.version.codename}");
      print(
          "Android Device Info ::::::::7: ${androidDevData.version.incremental}");
      print(
          "Android Device Info ::::::::7: ${androidDevData.version.previewSdkInt}");
      print("Android Device Info ::::::::7: ${androidDevData.version.release}");
      print("Android Device Info ::::::::8: ${androidDevData.board}");
      print("Android Device Info ::::::::9: ${androidDevData.bootloader}");
      print("Android Device Info ::::::::10: ${androidDevData.device}");
      print("Android Device Info ::::::::11: ${androidDevData.displayMetrics}");
      print("Android Device Info ::::::::12: ${androidDevData.fingerprint}");
      print("Android Device Info ::::::::13: ${androidDevData.hardware}");
      print("Android Device Info ::::::::14: ${androidDevData.host}");
      print(
          "Android Device Info ::::::::15: ${androidDevData.isPhysicalDevice}");
      print("Android Device Info ::::::::16: ${androidDevData.model}");
      print("Android Device Info ::::::::17: ${androidDevData.model}");
      print("Android Device Info ::::::::18: ${androidDevData.product}");
      print("Android Device Info ::::::::19: ${androidDevData.serialNumber}");
      print("Android Device Info ::::::::20: ${androidDevData.systemFeatures}");
      print(
          "Android Device Info ::::::::21: ${androidDevData.supported32BitAbis}");
      print(
          "Android Device Info ::::::::22: ${androidDevData.supported64BitAbis}");
      print("Android Device Info ::::::::23: ${androidDevData.tags}");
      print("Android Device Info ::::::::24: ${androidDevData.supportedAbis}");
      print("Android Device Info ::::::::25: ${androidDevData.data}");
      print(
          "Android Device Info ::::::::26: ${androidDevData.data['displayMetrics']['xDpi']}");
      print(
          "Android Device Info ::::::::27: ${androidDevData.data['displayMetrics']}");
      print("Android Device Info ::::::::28: ${androidDevData.data}");
    }

    print("Package Info version ::::::::: ${packageInfo.version}");
    print("Package Info buildNumber ::::::::: ${packageInfo.buildNumber}");

    var body = {
      "mobile": numberController.text.trim().toString(),
      "otp_token": otpToken,
      "otp": otp, // '1234',
      "device_details": {
        "id": androidDevData?.id.toString(),
        "notification_token":
            "${preferences.getString(SharedPreference.fcmToken)}",
        "brand": androidDevData?.manufacturer.toString(),
        "carrier": "Jio 4G",
        "device_name": androidDevData?.brand.toString(),
        "gms_version": "20.45.16 (040408-344294571)",
        "manufacturer": androidDevData?.manufacturer.toString(),
        "network_type": "4G",
        "os": Platform.isIOS ? "IOS" : "ANDROID",
        "osVersion": androidDevData?.version.release.toString(),
        "screen_height": Get.height.toString(),
        "screen_width": Get.width.toString(),
        "screen_dpi": "xxhdpi", //
        "simData":
            "SIM_STATE_READY SIM Country ISO = in, SIM Operator = 405867, SIM Operator Name = Jio 4G",
        "rooted_device": false,
        "rooted_device_dustom": false,
        "gmails": "",
        "emails": "",
        "installer": "com.android.vending",
        "allow_mock_locations": false
      }
    };

    print("Request Login API Data ::::::::::: ${body}");
    // var response = await AuthRepository().verifyOtpAPI(body: body);

    /// RESPONSE-----------------
    //       status: true,
    //       code: 200,
    //       data: {
    //           external_id: "3f2a422f-d8c5-4e95-a42d-d7d1fb086d68",
    //           session_token: "7f63d1af-2607-4833-bcd4-e7e0758fbf5d",
    //           is_new_user: false,
    //           first_name: "",
    //           last_name: "",
    //           email: "",
    //           profile_pic: "",
    //           notification_token: ""
    //      }
    //       message: "SUCCESS_OK",
    //       extra: null
    //  }
  }
}
