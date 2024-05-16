import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_home_api.dart';
import 'package:aidnix/models/res_home_search_api.dart';
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

  /// Home API  ***************************
  Future<ResHomeSearchApi?> homeSearchAPI(
      {required String search,
      required double latitude,
      required double longitude,
      required int radius,
      required int offset,
      required int limit}) async {
    print(
        'Request Home SEARCH API :::::::::::::::::: ,latitude = $latitude ,longitude = $longitude  ,radius = $radius ,offset = $offset ,limit = $limit');
    try {
      var response = await dio
          // .get("${AppUrls.subCategories}?query=blood&latitude=26.9505899&longitude=75.7909157&radius=2000&offset=0&limit=5");
          .get("${AppUrls.subCategories}?query=$search&latitude=$latitude&longitude=$longitude&radius=$radius&offset=$offset&limit=$limit");
      // var response = await dio.get("${AppUrls.subCategories}?query=Rbc&latitude=$latitude&longitude=$longitude&radius=$radius&offset=$offset&limit=$limit");
      print('Response Home SEARCH API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResHomeSearchApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Home SEARCH API :::::::::::::::::: $ex');

      return null;
    }
  }
}
