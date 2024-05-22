import 'dart:developer';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/models/res_create_booking.dart';
import 'package:aidnix/models/res_get_booking_detail.dart';
import 'package:aidnix/models/res_get_bookings.dart';
import 'package:aidnix/repository/user_repository.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:aidnix/view/cart/cart_controller.dart';
import 'package:aidnix/view/family_member/family_member_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  bool isLoading = false;
  TabController? tabController;
  int currentStep = 0;
  String refId = "";
  String selectedPaymentMethod = "PASC";

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

  String selectCancelReason = "";
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
  CreateBookingData? createBookingData;

  TextEditingController rescheduleDateController = TextEditingController();
  TextEditingController rescheduleTimeController = TextEditingController();

  ///-------------- Booking Slot Screen------------------------

  String selectedDate = "";
  String selectedTime = "";

  List morningList = ["6:45 AM", "7:45 AM", "9:30 AM", "10:15 AM", "11:15 AM", "12:00 AM"];

  List afternoonList = ["12:35 PM", "1:15 PM", "2:15 PM", "3:00 PM", "4:15 PM", "5:00 PM", "5:15 PM", "5:30 PM", "6:00 PM"];

  List eveningList = ["6:15 PM", "7:00 PM", "7:45 PM", "8:45 PM", "9:00 PM", "9:30 PM"];

  /// Create Booking

  Future<void> createBooking() async {
    CartController cartController = Get.put<CartController>(CartController());
    AddressController addressController = Get.put<AddressController>(AddressController());
    FamilyMemberController familyMemberController = Get.put<FamilyMemberController>(FamilyMemberController());

    if (cartController.cartId.isNotEmpty) {
      if (addressController.primaryAddress != null) {
        if (selectedDate.isNotEmpty) {
          if (selectedTime.isNotEmpty) {
            if (familyMemberController.isFamilyPatient == true) {
              if (familyMemberController.selectedFamilyMember != null) {
                isLoading = true;
                update();

                var reqCreateBooking = {
                  "cart_id": cartController.cartId,
                  "address_id": addressController.primaryAddress?.referenceId ?? "",
                  "family_member_id": familyMemberController.selectedFamilyMember != null
                      ? familyMemberController.selectedFamilyMember?.referenceId ?? ""
                      : "",
                  "scheduled_at": "$selectedDate $selectedTime",
                };

                // var body = {
                //   "cart_id": "e1eafcbd-ca54-4cce-818b-0a3e808428f9",
                //   "address_id": "2fddf29e-160c-4b93-ad98-f46b3a241562",
                //   "family_member_id": "7d9237e3-fe94-4408-8aec-75432da54425",
                //   "scheduled_at": "22-05-2024 03:04 PM"
                // };

                var response = await UserRepo().createBookingAPI(reqBody: reqCreateBooking);
                update();
                log('Response Create Booking :::::::::::::::::: ${response?.toJson()}');

                if (response != null) {
                  if (response.data != null) {
                    createBookingData = response.data;
                    update();

                    isLoading = false;
                    update();

                    await paymentBookingAPI();
                  }
                }
              } else {
                Fluttertoast.showToast(msg: "Please select patient", backgroundColor: kRed, textColor: kWhite);
              }
            } else {
              isLoading = true;
              update();

              var reqCreateBooking = {
                "cart_id": cartController.cartId,
                "address_id": addressController.primaryAddress?.referenceId ?? "",
                "family_member_id": familyMemberController.selfData != null ? familyMemberController.selfData?.referenceId ?? "" : "",
                "scheduled_at": "$selectedDate $selectedTime",
              };

              log("Request Create Booking Data :::::::::: $reqCreateBooking");

              var response = await UserRepo().createBookingAPI(reqBody: reqCreateBooking);
              update();
              log('Response Create Booking :::::::::::::::::: ${response?.toJson()}');

              if (response != null) {
                if (response.data != null) {
                  createBookingData = response.data;
                  update();

                  isLoading = false;
                  update();

                  await paymentBookingAPI();
                }
              }
            }
          } else {
            Fluttertoast.showToast(msg: "Please select schedule time", backgroundColor: kRed, textColor: kWhite);
          }
        } else {
          Fluttertoast.showToast(msg: "Please select schedule date", backgroundColor: kRed, textColor: kWhite);
        }
      } else {
        Fluttertoast.showToast(msg: "Please select address", backgroundColor: kRed, textColor: kWhite);
      }
    } else {
      Fluttertoast.showToast(msg: "Please select valid cart", backgroundColor: kRed, textColor: kWhite);
    }
  }

  /// Payment Booking Detail

  Future<void> paymentBookingAPI() async {
    isLoading = true;
    update();

    var reqPayment = {
      "payment_method": selectedPaymentMethod,
      "payable_amount": createBookingData?.totalPrice ?? 0,
    };

    var response = await UserRepo().paymentBookingAPI(createBookingId: createBookingData?.referenceId ?? "", reqBody: reqPayment);
    update();
    log('Response Payment Booking :::::::::::::::::: ${response?.toJson()}');

    if (response != null) {
      if (response.data != null) {
        log('Response Payment Booking Data :::::::::::::::::: ${response.data}');
        update();
      }
    }

    isLoading = false;
    update();
  }

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
