import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/common_response.dart';
import 'package:aidnix/models/res_add_cart_details_api.dart';
import 'package:aidnix/models/res_delete_cart_data_api.dart';
import 'package:aidnix/models/res_get_cart_details_api.dart';
import 'package:aidnix/models/res_get_cart_summary_api.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartRepository {
  APIService apiService = APIService();
  Dio dio = APIService().sendRequest;

  /// Get Cart Details API  ***************************
  Future<ResCartDetailsGetApi?> getCartDetailsAPI({required String cartId}) async {
    print('Request Get Cart Details API :::::::::::::::::: cartId = $cartId ');
    try {
      var response = await dio.get("${AppUrls.cart}/$cartId");
      print('Response Get Cart Details API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResCartDetailsGetApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Cart Details API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Add Cart Details API  ***************************
  Future<ResCartDetailsAddApi?> addCartDetailsAPI({required Map<String, dynamic> body}) async {
    print('Request Add Cart Details API :::::::::::::::::: body = $body ');
    try {
      var response = await dio.post("${AppUrls.cart}", data: body);
      print('Response Add Cart Details API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResCartDetailsAddApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Add Cart Details API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Cart Summary Details API  ***************************
  Future<ResCartSummaryGetApi?> getCartSummaryDetailsAPI({required String cartId}) async {
    print('Request Get Cart Summary Details API :::::::::::::::::: cartId = $cartId ');
    try {
      var response = await dio.post("${AppUrls.cartSummary}/$cartId");
      print('Response Get Cart Summary Details API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResCartSummaryGetApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Cart Summary Details API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Delete Cart Items API  ***************************
  Future<CommonResponse?> deleteCartItemAPI({required String cartId, required String labId}) async {
    print('Request Delete Cart Items API :::::::::::::::::: cartId = $cartId ');
    try {
      var response = await dio.delete("${AppUrls.cart}/$cartId/items/$labId");
      print('Response Delete Cart Items API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Delete Cart Items API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Delete Cart API  ***************************
  Future<ResCartDataDeleteApi?> deleteCartAPI({required String cartId}) async {
    print('Request Delete Cart  API :::::::::::::::::: cartId = $cartId ');
    try {
      var response = await dio.delete("${AppUrls.cart}/$cartId");
      print('Response Delete Cart  API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResCartDataDeleteApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Delete Cart  API :::::::::::::::::: $ex');

      return null;
    }
  }
}
