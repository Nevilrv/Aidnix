import 'dart:developer';
import 'package:aidnix/models/res_home_api.dart';
import 'package:aidnix/models/res_items_details.dart';
import 'package:aidnix/models/res_single_lab_details_api.dart';
import 'package:aidnix/repository/checkup_repository.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  LabDetail? labData;
  List<NearbyLab> allLabsList = [];
  List<LabItems> labItems = [];
  String labId = "";

  /// All Labs

  allLabsAPI() async {
    isLoading = true;
    update();

    AddressController addressController = Get.put(AddressController());

    var response = await CheckUpRepository().allLabsAPI(latitude: addressController.latitude, longitude: addressController.longitude);
    update();
    log('Response All Labs  API Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        allLabsList = response.data ?? [];
        update();
      }
    }
    isLoading = false;
    update();
  }

  /// Lab Details API

  labDetailsAPI() async {
    try {
      isLoading = true;
      update();

      AddressController addressController = Get.put(AddressController());

      var response = await CheckUpRepository()
          .labDetailsAPI(labId: labId, latitude: addressController.latitude, longitude: addressController.longitude);

      update();
      log('Response lab Details API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          labData = response.data;
          update();
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      log("EEEE_lab_Details__$e");
    }
  }

  /// Lab Items Details API

  labItemsDetailsAPI() async {
    try {
      isLoading = true;
      update();

      var response = await CheckUpRepository().labItemsDetailsAPI(labId: labId, offset: 0, limit: 4);
      update();
      log('Response Lab Items Details API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          labItems = response.data ?? [];
          update();
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      log("Error Lab Items Detail :::::::::::: $e");
    }
  }

  /// Search Data

  searchLabItemsDetailsAPI() async {
    try {
      isLoading = true;
      update();

      var response =
          await CheckUpRepository().searchLabItemsDetailsAPI(labId: labId, search: searchController.text.trim(), offset: 0, limit: 4);
      update();
      log('Response Search Lab Items Details API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          labItems = response.data ?? [];
          update();
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      log("Error Search Lab Items Detail :::::::::::: $e");
    }
  }
}
