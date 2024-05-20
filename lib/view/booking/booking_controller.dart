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

  List cancelReasonList = [
    'Missed the fasting requirements',
    'My preferred collection slot is not available',
    'Need to change sample collation address',
    'Order placed by mistake',
    'Need to add/remove tests',
    'Payment issue',
    'Founder better price elsewhere',
    'Need to apply coupon offer',
    'Reason not listed here',
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

  ///-------------- Booking Slot Screen------------------------

  int? morningTime;
  int? afternoonTime;
  int? eveningTime;
  int selectDey = 0;
  int selectReason = 0;

  void selectDeyValue(index) {
    selectDey = index;
    update();
  }

  void selectMorningValue(index) {
    morningTime = index;
    update();
  }

  void selectAfternoonValue(index) {
    afternoonTime = index;
    update();
  }

  void selectEveningValue(index) {
    eveningTime = index;
    update();
  }

  List<Map<String, dynamic>> timeShortData = [
    {'date': '09', 'dey': "Today"},
    {'date': '10', 'dey': "Tomorrow"},
    {'date': '11', 'dey': "Sunday"},
    {'date': '12', 'dey': "Monday"},
  ];
  List<Map<String, dynamic>> confirmSlotList = [
    {"name": "Missed the fasting requirements", "value": 1},
    {"name": "My preferred collection slot is not available ", "value": 2},
    {"name": "Need to change sample collation address  ", "value": 3},
    {"name": "Order placed by mistake", "value": 4},
    {"name": "Need to add/remove tests", "value": 5},
    {"name": "Payment issue", "value": 6},
    {"name": "Founder better price elsewhere", "value": 7},
    {"name": "Need to apply coupon offer", "value": 8},
    {"name": "Reason not listed here", "value": 9},
  ];

  List morningList = ["6:45 AM", "7:45 AM", "9:30 AM", "10:15 AM", "11:15 AM", "12:00 AM"];

  List afternoonList = ["12:35 PM", "1:15 PM", "2:15 PM", "03:00 PM", "4:15 PM", "5:00 PM", "12:35 PM", "1:15 PM", "2:15 PM"];

  List eveningList = ["12:35 PM", "1:15 PM", "2:15 PM", "03:00 PM"];

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
