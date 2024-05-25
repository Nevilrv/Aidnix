import 'dart:developer';
import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  bool isLoading = false;

  TextEditingController searchController = TextEditingController();

  List<SearchHomeData> testList = [];

  testAPI() async {
    try {
      isLoading = true;

      update();
      AddressController addressController = Get.put<AddressController>(AddressController());

      log('Test Search API ::::::::::::::: latitude: ${addressController.latitude} , longitude : ${addressController.longitude} ');

      if (addressController.latitude == 0 || addressController.longitude == 0) {
        await addressController.getCurrentLocation();
      }

      var response = await HomeRepository().homeSearchAPI(
        search: searchController.text.trim().isNotEmpty ? searchController.text.trim() : "blood",
        latitude: addressController.latitude,
        longitude: addressController.longitude,
        radius: 2000,
        offset: 0,
        limit: 5,
      );
      // var response = await HomeRepository().homeSearchAPI(search: search.text, latitude: 26.9505899, longitude: 75.7909157, radius: 2000, offset: 0, limit: 5);
      update();
      print('Response Test Search API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          testList = response.data ?? [];
          update();
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      log("Error Test Search API ::::::::::::::: $e");
    }
  }
}
