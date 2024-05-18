import 'dart:developer';
import 'package:aidnix/models/res_home_api.dart';
import 'package:aidnix/models/res_home_filter_api.dart';
import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/models/res_items_details.dart';
import 'package:aidnix/models/res_single_lab_details_api.dart';
import 'package:aidnix/repository/checkup_repository.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  LabDetail? labData;
  bool isSearchLoading = false;
  List<SearchHomeData> searchData = [];
  List<NearbyLab> allLabsList = [];
  List<LabItems> labItems = [];

  String labId = "";

  bool isFilterLoading = false;
  List<HomeFilterData> filterData = [];
  int filterCategoryIndex = 0;
  List<int> filterInt = [];

  /// All Labs

  allLabsAPI() async {
    isLoading = true;
    update();

    AddressController addressController = Get.put(AddressController());

    // var response = await CheckUpRepository().allLabsAPI(latitude: addressController.latitude, longitude: addressController.longitude);
    var response = await CheckUpRepository().allLabsAPI(latitude: 26.9505899, longitude: 75.7909157);
    update();
    print('Response All Labs  API Data :::::::::::::::::: $response');

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
      // var response = await CheckUpRepository().labDetailsAPI(labId: "d4e744df-de3c-4e7d-ba1d-aee88905c874", latitude: 26.9505899, longitude: 75.7909157);
      update();
      print('Response lab Details API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          labData = response.data;
          update();
        }
      }
      isLoading = false;
      update();
    } catch (e) {
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
      print('Response Lab Items Details API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          labItems = response.data ?? [];
          update();
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      log("Error Lab Items Detail :::::::::::: $e");
    }
  }

  /// Search Data

  searchAPI() async {
    try {
      isSearchLoading = true;
      update();

      AddressController addressController = Get.put(AddressController());

      var response = await HomeRepository().homeSearchAPI(
        search: searchController.text,
        latitude: addressController.latitude,
        longitude: addressController.longitude,
        radius: 2000,
        offset: 0,
        limit: 5,
      );
      // var response = await HomeRepository().homeSearchAPI(search: searchController.text, latitude: 26.9505899, longitude: 75.7909157, radius: 2000, offset: 0, limit: 5);
      update();
      print('Response lab Details Search API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          searchData = response.data ?? [];
          update();
        }
      }
      isSearchLoading = false;
      update();
    } catch (e) {
      log("EEEE_Search__$e");
    }
  }

  getList() {
    filterInt = [];
    update();
    filterData.forEach((element) {
      filterInt.add(-1);
      update();
    });
    log('filterInt.length===========>>>>${filterInt.length}');
  }

  ///   Filter API
  getFilterApi() async {
    isFilterLoading = true;
    update();

    var response = await HomeRepository().homeFilterAPI();
    update();
    print('Response  Filter Data :::::::::::::::::: $response');

    if (response != null) {
      filterData = response.data!;
      update();
    }
    isFilterLoading = false;
    update();
  }
}
