import 'dart:developer';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/models/res_get_booking_detail.dart';
import 'package:aidnix/models/res_get_bookings.dart';
import 'package:aidnix/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  bool isLoading = false;
  TabController? tabController;
  int currentStep = 0;
  String refId = "";

  List<Map<String, dynamic>> bookedTest = [
    {
      "Icon": AppAssets.bloodTestSmallIcon,
      "title": "Blood Test",
    },
    {
      "Icon": AppAssets.urineTest,
      "title": "Urine Test",
    },
    {
      "Icon": AppAssets.heartTest,
      "title": "Heart Test",
    },
    {
      "Icon": AppAssets.heartTest,
      "title": "Heart Test",
    },
  ];

  int selectTabIndex = 0;

  List bookingStatusList = [
    "All",
    "Upcoming",
    "Completed",
    "Cancelled",
  ];

  List<Booking> bookingList = [];

  BookingData? bookingData;

  TextEditingController rescheduleDateController = TextEditingController();
  TextEditingController rescheduleTimeController = TextEditingController();

  /// Get Booking Detail

  Future<void> getBookingDetail() async {
    isLoading = true;
    update();

    var response = await UserRepo().getBookingDetailAPI(refId: refId);
    update();
    log('Response Get Booking Detail :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        bookingData = response.data;
        update();
      }
    }

    isLoading = false;
    update();
  }

  /// Get Booking History

  Future<void> getBookingHistory() async {
    isLoading = true;
    update();

    var response = await UserRepo().getBookingHistoryAPI(offset: 0, limit: 10);
    update();
    log('Response Get Booking :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        bookingList = response.data ?? [];
        update();
      }
    }

    isLoading = false;
    update();
  }

  /// Get Filter Booking  History

  Future<void> getFilterBookingHistory() async {
    isLoading = true;
    update();

    var response = await UserRepo().getFilterBookingHistoryAPI(
      status: tabController?.index == 1
          ? "UPCOMING"
          : tabController?.index == 2
              ? "COMPLETED"
              : tabController?.index == 3
                  ? "CANCELLED"
                  : "UPCOMING",
      offset: 0,
      limit: 10,
    );
    update();
    log('Response Get Filter Booking :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        bookingList = response.data ?? [];
        update();
      }
    }

    isLoading = false;
    update();
  }

  /// Reschedule Booking

  Future<void> rescheduleBooking() async {
    isLoading = true;
    update();

    var body = {
      "scheduled_at": "${rescheduleDateController.text.trim()} ${rescheduleTimeController.text.trim()}",
    };

    var response = await UserRepo().rescheduleBookingAPI(refId: refId, reqBody: body);
    update();
    log('Response Reschedule Booking Detail :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        update();
        Get.back();
      }
    }

    isLoading = false;
    update();
  }

  /// Cancel Booking

  Future<void> cancelBooking() async {
    isLoading = true;
    update();

    var response = await UserRepo().cancelBookingAPI(refId: refId);
    update();
    log('Response Cancel Booking Detail :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        update();
        Get.back();
      }
    }

    isLoading = false;
    update();
  }
}
