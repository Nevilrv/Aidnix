import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_get_all_labs.dart';
import 'package:aidnix/models/res_get_category_details.dart';
import 'package:aidnix/models/res_items_details.dart';
import 'package:aidnix/models/res_single_lab_details_api.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckUpRepository {
  APIService apiService = APIService();
  Dio dio = APIService().sendRequest;

  /// All Labs API  ***************************

  Future<ResGetAllLabs?> allLabsAPI({required double latitude, required double longitude}) async {
    print('Request All Labs API :::::::::::::::::: latitude = $latitude longitude = $longitude} ');
    try {
      var response = await dio.get("${AppUrls.labs}?latitude=$latitude&longitude=$longitude");
      print('Response All Labs API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetAllLabs.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error All Labs API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Lab Detail API

  Future<ResSingleLabDetailsApi?> labDetailsAPI({required String labId, required double latitude, required double longitude}) async {
    print('Request Home API :::::::::::::::::: latitude = $latitude longitude = $longitude} ');
    try {
      var response = await dio.get("${AppUrls.labs}/$labId?latitude=$latitude&longitude=$longitude");
      print('Response Home API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResSingleLabDetailsApi.fromJson(response.data);
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

  /// Lab Items Details API

  Future<ResGetItemsDetails?> labItemsDetailsAPI({required String labId, required double offset, required double limit}) async {
    print('Request Lab Items Details API :::::::::::::::::: offset = $offset limit = $limit} ');
    try {
      var response = await dio.get("${AppUrls.labItems}?lab-id=$labId&offset=$offset&limit=$limit");
      print('Response Lab Items Details API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetItemsDetails.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Lab Items Details API :::::::::::::::::: $ex');

      return null;
    }
  }

  Future<ResGetCategoryDetails?> categoryDetailsAPI({
    required String categoryId,
    required double latitude,
    required double longitude,
    required int radius,
    required int offset,
    required int limit,
  }) async {
    print('Request Home API :::::::::::::::::: latitude = $latitude longitude = $longitude} ');
    try {
      var response = await dio.get(
          "${AppUrls.labItems}?category-id=$categoryId&latitude=$latitude&longitude=$longitude&radius=$radius&offset=$offset&limit=$limit");
      print('Response Home API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetCategoryDetails.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Category Detail API :::::::::::::::::: $ex');

      return null;
    }
  }
}
