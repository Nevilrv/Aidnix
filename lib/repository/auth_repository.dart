import 'dart:developer';

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
import 'package:shared_preferences/shared_preferences.dart';

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
      Fluttertoast.showToast(msg: ex.toString() ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
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

        await SharedPreference().setBool(SharedPreference.isLogin, true);
        await SharedPreference().setString(SharedPreference.externalId, response.data['data']['external_id']);
        await SharedPreference().setString(SharedPreference.token, response.data['data']['session_token']);

        Get.offAllNamed(Routes.dashboardScreen);
        return ResVerifyOtpApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: ex.toString() ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error VERIFY OTP API :::::::::::::::::: $ex');

      return null;
    }
  }
}
