import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/app_interceptor.dart';
import 'package:aidnix/utils/shared_prefs.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIService {
  Dio dio = Dio();
  Dio multiPartDio = Dio();

  APIService() {
    print("API TOKEN ::::::::::::: Bearer ${preferences.getString(SharedPreference.token)}");

    dio.options = BaseOptions(
      baseUrl: AppUrls.BASE_URL,
      connectTimeout: AppUrls.responseTimeOut,
      receiveTimeout: AppUrls.responseTimeOut,
      sendTimeout: AppUrls.responseTimeOut,
      responseType: ResponseType.json,
      headers: preferences.getString(SharedPreference.token) != null && preferences.getString(SharedPreference.token).toString() != ""
          ? {"Authorization": "Bearer ${preferences.getString(SharedPreference.token)}"}
          : {},
    );
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(AppInterceptors(dio));

    multiPartDio.options = BaseOptions(
      baseUrl: AppUrls.BASE_URL,
      connectTimeout: AppUrls.responseTimeOut,
      receiveTimeout: AppUrls.responseTimeOut,
      sendTimeout: AppUrls.responseTimeOut,
      responseType: ResponseType.json,
      headers: preferences.getString(SharedPreference.token) != null && preferences.getString(SharedPreference.token).toString() != ""
          ? {
              "Authorization": "Bearer ${preferences.getString(SharedPreference.token)}",
              'Content-Type': 'multipart/form-data',
              'Accept': '*/*',
              'Accept-Encoding': 'gzip, deflate, br',
            }
          : {},
    );

    multiPartDio.interceptors.add(PrettyDioLogger());
    multiPartDio.interceptors.add(AppInterceptors(multiPartDio));
  }

  Dio get sendRequest => dio;

  Dio get sendMultipartRequest => multiPartDio;
}
