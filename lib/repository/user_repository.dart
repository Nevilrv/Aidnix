import 'package:aidnix/models/common_response.dart';
import 'package:aidnix/models/res_create_booking.dart';
import 'package:aidnix/models/res_edit_health_document.dart';
import 'package:aidnix/models/res_get_booking_detail.dart';
import 'package:aidnix/models/res_get_bookings.dart';
import 'package:aidnix/models/res_get_general_setting.dart';
import 'package:aidnix/models/res_get_health_profile.dart';
import 'package:aidnix/models/res_get_single_family_member_api.dart';
import 'package:aidnix/models/res_health_docs.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/api_service/api_constant.dart';
import 'package:aidnix/api_service/api_service.dart';
import 'package:aidnix/models/res_add_family_member.dart';
import 'package:aidnix/models/res_add_document.dart';
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
      print('Error Get Family Member API :::::::::::::::::: $ex');
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);

      return null;
    }
  }

  /// Get Single Family Member API ******************************
  Future<ResGetSingleFamilyMemberApi?> getSingleFamilyMemberAPI({required String familyMemberId}) async {
    try {
      var response = await dio.get("${AppUrls.familyMember}/$familyMemberId");
      print('Response Get Single Family Member API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetSingleFamilyMemberApi.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      print('Error Get Single Family Member API :::::::::::::::::: $ex');
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);

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

  /// Add Document API ******************************
  Future<ResAddDocument?> addDocumentAPI({required Map<String, dynamic> body}) async {
    try {
      print('Request Add Document API :::::::::::::::::: $body ');

      var response = await apiService.multiPartDio.post(
        AppUrls.uploadDocument,
        data: FormData.fromMap(body),
      );
      print('Response Add Document API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResAddDocument.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Add Document API :::::::::::::::::: $ex');

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

  /// Update General Setting API ******************************
  Future<CommonResponse?> updateGeneralSettingAPI({required Map<String, dynamic> reqBody}) async {
    try {
      var response = await dio.patch(AppUrls.profileSetting, data: reqBody);
      print('Response Upadte General Setting API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Update General Setting API :::::::::::::::::: $ex');

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

  /// Filter Health Docs API ******************************

  Future<ResHealthDocs?> getFilterHealthDocsAPI(
      {required String docType, required int offset, required int limit, required String user, required String date}) async {
    try {
      var response = await dio.get("${AppUrls.healthDocs}?type=$docType&offset=$offset&limit=$limit&patient=$user&date=$date");
      print('Response Get Filter Health Docs API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResHealthDocs.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Filter Health Docs API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Edit Health Docs API ******************************

  Future<ResEditHealthDocument?> editHealthDocsAPI({required String docId, required Map<String, dynamic> reqBody}) async {
    print('Request Edit Health Docs API :::::::::::::::::: $docId');
    try {
      var response = await dio.put("${AppUrls.healthDocs}/$docId", data: reqBody);
      print('Response Edit Health Docs API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResEditHealthDocument.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Edit Health Docs API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Delete Health Docs API ******************************

  Future<CommonResponse?> deleteHealthDocsAPI({required String docId}) async {
    print('Request Delete Health Docs API :::::::::::::::::: $docId');
    try {
      var response = await dio.delete("${AppUrls.healthDocs}/$docId");
      print('Response Delete Health Docs API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Delete Health Docs API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Create Bookings Detail API ******************************

  Future<ResCreateBooking?> createBookingAPI({required Map<String, dynamic> reqBody}) async {
    print('Request Create Booking API :::::::::::::::::: $reqBody');

    try {
      var response = await dio.post(AppUrls.bookings, data: reqBody);
      print('Response Create Booking API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResCreateBooking.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      print('Error Create Bookings API :::::::::::::::::: $ex');
      Fluttertoast.showToast(msg: "${ex ?? "Failed, Something Wrong!"}", backgroundColor: kRed, textColor: kWhite);

      return null;
    }
  }

  ///  Payment Bookings  API ******************************

  Future<CommonResponse?> paymentBookingAPI({required String createBookingId, required Map<String, dynamic> reqBody}) async {
    print('Request Payment Booking API :::::::::::::::::: $reqBody');

    try {
      var response = await dio.patch("${AppUrls.bookings}/$createBookingId", data: reqBody);
      print('Response Payment Booking API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      print('Error Payment Bookings API :::::::::::::::::: $ex');
      Fluttertoast.showToast(msg: "${ex ?? "Failed, Something Wrong!"}", backgroundColor: kRed, textColor: kWhite);

      return null;
    }
  }

  /// Get Bookings Detail API ******************************

  Future<ResGetBookingDetails?> getBookingDetailAPI({required String refId}) async {
    try {
      var response = await dio.get("${AppUrls.bookings}/$refId");
      print('Response Get Booking Detail API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetBookingDetails.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      print('Error Get Bookings Detail API :::::::::::::::::: $ex');
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);

      return null;
    }
  }

  /// Get Bookings History API ******************************

  Future<ResGetBookingHistory?> getBookingHistoryAPI({required int offset, required int limit}) async {
    try {
      var response = await dio.get("${AppUrls.bookings}?offset=$offset&limit=$limit");
      print('Response Get Booking History API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetBookingHistory.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Bookings History API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Get Filter Bookings History API ******************************

  Future<ResGetBookingHistory?> getFilterBookingHistoryAPI({required int offset, required int limit, required String status}) async {
    try {
      var response = await dio.get("${AppUrls.bookings}?offset=$offset&limit=$limit&status=$status");
      print('Response Get Filter Booking History API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return ResGetBookingHistory.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);
      print('Error Get Filter  Bookings History API :::::::::::::::::: $ex');

      return null;
    }
  }

  /// Reschedule Bookings API ******************************

  Future<CommonResponse?> rescheduleBookingAPI({required String refId, required Map<String, dynamic> reqBody}) async {
    try {
      var response = await dio.put("${AppUrls.bookings}/$refId", data: reqBody);
      print('Response Reschedule Booking API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      print('Error Reschedule Bookings API :::::::::::::::::: $ex');
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);

      return null;
    }
  }

  /// Cancel Bookings API ******************************

  Future<CommonResponse?> cancelBookingAPI({required String refId}) async {
    try {
      var response = await dio.delete("${AppUrls.bookings}/$refId");
      print('Response Cancel Booking API :::::::::::::::::: ${response.data}');

      if (response.data["status"] == true) {
        return CommonResponse.fromJson(response.data);
      } else {
        Fluttertoast.showToast(msg: response.data['message'], backgroundColor: kRed, textColor: kWhite);
        return null;
      }
    } on DioException catch (ex) {
      print('Error Cancel Bookings API :::::::::::::::::: $ex');
      Fluttertoast.showToast(msg: "$ex" ?? "Failed, Something Wrong!", backgroundColor: kRed, textColor: kWhite);

      return null;
    }
  }
}
