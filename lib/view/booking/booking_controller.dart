import 'dart:developer';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/models/res_get_bookings.dart';
import 'package:aidnix/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  bool isLoading = false;
  TabController? tabController;
  int currentStep = 0;

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

  List<Booking> bookingList = [];

  List bookingStatusList = [
    "All",
    "Upcoming",
    "Completed",
    "Cancelled",
  ];

  /// Get Booking

  Future<void> getBooking() async {
    isLoading = true;
    update();

    var response = await UserRepo().getBookingAPI(offset: 0, limit: 10);
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

  /// Get Filter Booking

  Future<void> getFilterBooking() async {
    isLoading = true;
    update();

    var response = await UserRepo().getFilterBookingAPI(
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
}
