import 'package:aidnix/models/common_response.dart';
import 'package:aidnix/models/res_get_general_setting.dart';
import 'package:aidnix/models/res_get_health_profile.dart';
import 'package:aidnix/models/res_health_docs.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_add_family_member.dart';
import 'package:aidnix/models/res_add_family_member_image.dart';
import 'package:aidnix/models/res_get_family_member.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserRepo {
  APIService apiService = APIService();
  Dio dio = APIService().sendRequest;

  /// Get Family Member API ******************************
  Future<ResGetFamilyMemberApi?> getFamilyMemberAPI() async {
    try {
      var response = await dio.get(AppUrls.familyMember);
      print('Response Get Family Member API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetFamilyMemberApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Family Member API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Add Family Member API ******************************
  Future<ResAddFamilyMemberApi?> addFamilyMemberAPI({required Map<String, dynamic> body}) async {
    try {
      print('Request Add Family Member API :::::::::::::::::: $body ');

      var response = await dio.post(
        AppUrls.familyMember,
        data: body,
      );
      print('Response Add Family Member API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResAddFamilyMemberApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Add Family Member API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Add Family Member Image API ******************************
  Future<ResAddFamilyMemberImageApi?> addFamilyMemberImageAPI({required Map<String, dynamic> body}) async {
    try {
      print('Request Add Family Member Image API :::::::::::::::::: $body ');

      var response = await apiService.multiPartDio.post(
        AppUrls.familyMemberImage,
        data: FormData.fromMap(body),
      );
      print('Response Add Family Member Image API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResAddFamilyMemberImageApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Add Family Member Image API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get General Setting API ******************************
  Future<ResGetGeneralSetting?> getGeneralSettingAPI() async {
    try {
      var response = await dio.get(AppUrls.profileSetting);
      print('Response Get General Setting API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetGeneralSetting.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get General Setting API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Health Profile API ******************************
  Future<ResGetHealthProfile?> getHealthProfileAPI() async {
    try {
      var response = await dio.get(AppUrls.healthProfile);
      print('Response Get Health Profile API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetHealthProfile.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Health Profile API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Create Health Profile API ******************************

  Future<CommonResponse?> createHealthProfileAPI({required Map<String, dynamic> reqBody}) async {
    try {
      var response = await dio.post(AppUrls.healthProfile, data: reqBody);
      print('Response Create Health Profile API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Create Health Profile API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Health Docs API ******************************

  Future<ResHealthDocs?> getHealthDocsAPI({required String docType, required int offset, required int limit}) async {
    try {
      var response = await dio.get("${AppUrls.healthDocs}?type=$docType&offset=$offset&limit=$limit");
      print('Response Get Health Docs API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResHealthDocs.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Health Docs API :::::::::::::::::: $ex');

      return null;
    }
  }
}
