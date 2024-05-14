import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_add_family_member.dart';
import 'package:aidnix/models/res_add_family_member_image.dart';
import 'package:aidnix/models/res_get_family_member.dart';
import 'package:aidnix/models/res_home_api.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeRepository {
  APIService apiService = APIService();
  Dio dio = APIService().sendRequest;

  /// Home API  ***************************
  Future<ResHomeApi?> homeAPI({required double latitude, required double longitude}) async {
    print('Request Home API :::::::::::::::::: latitude = $latitude longitude = $longitude} ');
    try {
      var response = await dio.get("${AppUrls.home}?latitude=$latitude&longitude=$longitude");
      print('Response Home API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResHomeApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Home API :::::::::::::::::: $ex');

      return null;
    }
  }

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

  // Future<CommonResponse?> demoAPI({required Map<String, dynamic> body}) async {
  //   print('Request Login API :::::::::::::::::: $body ');
  //   try {
  //     var response = await dio.get("${AppUrls.home}?latitude=$latitude", data: body);
  //     print('Response Login API :::::::::::::::::: ${response.data}');
  //
  //     if (response.data["status"] == true) {
  //       return CommonResponse.fromJson(response.data);
  //     } else {
  //       Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
  //       return null;
  //     }
  //   } on DioException catch (ex) {
  //     // Fluttertoast.showToast(msg: "Failed, Something Wrong!", backgroundColor: redColor, textColor: whiteColor);
  //
  //     Fluttertoast.showToast(msg: ex.toString() ?? "Error", backgroundColor: kRed, textColor: kWhite);
  //     print('Error Login API :::::::::::::::::: $ex');
  //
  //     return null;
  //   }
  // }
}
