import 'dart:developer';
import 'package:aidnix/models/res_add_address.dart';
import 'package:aidnix/models/res_get_address_detail.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_get_all_addresses_api.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddressRepo {
  APIService apiService = APIService();
  Dio dio = APIService().sendRequest;

  /// Get All Address API  ***************************

  Future<GetAllAddress?> getAllAddressAPI() async {
    try {
      var response = await dio.get(AppUrls.addresses);
      log('Response Get All Address API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return GetAllAddress.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex", backgroundColor: kRed, textColor: kWhite);
      log('Error Get All Address API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Address Detail API  ***************************

  Future<GetAddressDetail?> getAddressDetailAPI({required String referenceId}) async {
    try {
      var response = await dio.get("${AppUrls.addresses}/$referenceId");
      log('Response Get Address Detail API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return GetAddressDetail.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex", backgroundColor: kRed, textColor: kWhite);
      log('Error Get Address Detail API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Address Detail API  ***************************

  Future<ResAddAddress?> addAddressDetailAPI({required Map<String, dynamic> reqBody}) async {
    log('Request Add Address  API :::::::::::::::::: $reqBody');
    try {
      var response = await dio.post(AppUrls.addresses, data: reqBody);
      log('Response Add Address  API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResAddAddress.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex", backgroundColor: kRed, textColor: kWhite);
      log('Error Add Address API :::::::::::::::::: $ex');

      return null;
    }
  }
}
