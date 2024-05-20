import 'dart:developer';

import 'package:aidnix/models/res_home_filter_api.dart';
import 'package:aidnix/models/res_get_category_details.dart';
import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/repository/checkup_repository.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class   CheckUpController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isSearchLoading = false;
  bool isLoading = false;
  List<SearchHomeData> searchData = [];
  String categoryId = "";
  List<CategoryDetail> categoryDetailList = [];

  bool isFilterLoading = false;
  List<HomeFilterData> filterData = [];
  int filterCategoryIndex = 0;
  List<int> filterInt = [];

  getList() {
    filterInt = [];
    update();
    filterData.forEach((element) {
      filterInt.add(-1);
      update();
    });
    log('filterInt.length===========>>>>${filterInt.length}');
  }

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
      print('Response home Search API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          searchData = response.data ?? [];
          update();
        }
      }
      isSearchLoading = false;
      update();
    } catch (e) {
      log("EEEE_home_Search__$e");
    }
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

  categoryDetailAPI() async {
    isLoading = true;
    update();

    AddressController addressController = Get.put(AddressController());

    var response = await CheckUpRepository().categoryDetailsAPI(
      categoryId: categoryId,
      latitude: addressController.latitude,
      longitude: addressController.longitude,
      radius: 2000,
      offset: 0,
      limit: 5,
    );
    update();
    print('Response Category Detail API Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        categoryDetailList = response.data ?? [];
        update();
      }
    }
    isLoading = false;
    update();
  }
}
