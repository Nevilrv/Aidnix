import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_single_lab_details_api.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckUpRepository {
  APIService apiService = APIService();
  Dio dio = APIService().sendRequest;

  /// Lab Details API  ***************************
  Future<ResSingleLabDetailsApi?> labDetailsAPI({required String labId, required double latitude, required double longitude}) async {
    print('Request Home API :::::::::::::::::: latitude = $latitude longitude = $longitude} ');
    try {
      var response = await dio.get("${AppUrls.labDetails}/$labId?latitude=$latitude&longitude=$longitude");
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
}
