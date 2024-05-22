import 'dart:developer';
import 'package:aidnix/models/common_response.dart';
import 'package:aidnix/models/res_terms_and_conditions.dart';
import 'package:aidnix/models/res_verify_otp_api.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_login_api.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:aidnix/utils/shared_prefs.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthRepository {
  APIService apiService = APIService();
  Dio dio = APIService().sendRequest;

  /// LOGIN API ************************************

  Future<ResLoginApi?> loginAPI({required Map<String, dynamic> body}) async {
    print('Request LOGIN API :::::::::::::::::: $body ');
    try {
      var response = await dio.post(AppUrls.BASE_URL + AppUrls.login, data: body);
      print('Response LOGIN API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        var result = ResLoginApi.fromJson(response.data);
        log('response.data==========11111=>>>>${response.data["data"]["otp_token"]}');

        Get.toNamed(
          Routes.otpScreen,
          arguments: {
            "otp_token": response.data["data"]["otp_token"] ?? '',
          },
        );
        return result;
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error LOGIN API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// LOGIN VERIFY OTP API ************************************

  Future<ResVerifyOtpApi?> verifyOtpAPI({required Map<String, dynamic> body}) async {
    print('Request VERIFY OTP API :::::::::::::::::: $body ');
    try {
      var response = await dio.post(AppUrls.BASE_URL + AppUrls.verifyOtp, data: body);
      print('Response VERIFY OTP API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        await preferences.setString(SharedPreference.externalId, response.data['data']['external_id']);
        await preferences.setString(SharedPreference.token, response.data['data']['session_token']);

        Get.offAllNamed(Routes.dashboardScreen);
        return ResVerifyOtpApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error VERIFY OTP API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Terms And Conditions API ******************************
  Future<ResTermsAndConditions?> getTermsAndConditionsAPI() async {
    try {
      var response = await dio.get(AppUrls.termsAndConditions);
      print('Response Get Terms and Conditions API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResTermsAndConditions.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Terms And Conditions API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Privacy Policy API ******************************
  Future<ResTermsAndConditions?> getPrivacyPolicyAPI() async {
    try {
      var response = await dio.get(AppUrls.privacyPolicy);
      print('Response Get Privacy Policy API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResTermsAndConditions.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Privacy Policy API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get About Us API ******************************
  Future<ResTermsAndConditions?> getAboutUsAPI() async {
    try {
      var response = await dio.get(AppUrls.aboutUs);
      print('Response Get About Us API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResTermsAndConditions.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get About Us API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get About Us API ******************************
  Future<CommonResponse?> logOutAPI() async {
    try {
      var response = await dio.patch(AppUrls.logout);
      print('Response Log Out API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Log Out API :::::::::::::::::: $ex');

      return null;
    }
  }
}
