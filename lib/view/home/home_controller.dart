import 'dart:developer';
import 'package:aidnix/models/res_home_api.dart';
import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  int currentNearYouBannerIndex = 0;
  int currentPathLabBannerIndex = 0;
  int currentReviewBannerIndex = 0;

  int filterCategoryIndex = 0;
  int filterCategoryItemIndex = 0;

  TextEditingController search = TextEditingController();

  HomeData? homeData;
  bool isSearchLoading = true;
  List<SearchHomeData> searchHomeData = [];

  homeAPI() async {
    try {
      isLoading = true;
      update();
      AddressController addressController = Get.put<AddressController>(AddressController());

      if (addressController.latitude == 0 || addressController.longitude == 0) {
        await addressController.getCurrentLocation();
      }

      log('Home Page API ::::::::::::::: latitude: ${addressController.latitude} , longitude : ${addressController.longitude} ');
      // var response = await HomeRepository().homeAPI(latitude: addressController.latitude, longitude: addressController.longitude);
      var response = await HomeRepository().homeAPI(latitude: 26.8505899, longitude: 75.7909157);
      update();
      print('Response home API Data :::::::::::::::::: $response');

      if (response != null) {
        homeData = response.data;
        update();
      }
      isLoading = false;
      update();
    } catch (e) {
      log("EEEE$e");
    }
  }

  homeSearchAPI() async {
    try {
      isSearchLoading = true;
      update();
      AddressController addressController = Get.put<AddressController>(AddressController());

      log('Home Search API ::::::::::::::: latitude: ${addressController.latitude} , longitude : ${addressController.longitude} ');

      if (addressController.latitude == 0 || addressController.longitude == 0) {
        await addressController.getCurrentLocation();
      }

      var response = await HomeRepository().homeSearchAPI(
        search: search.text.trim(),
        latitude: addressController.latitude,
        longitude: addressController.longitude,
        radius: 2000,
        offset: 0,
        limit: 5,
      );
      // var response = await HomeRepository().homeSearchAPI(search: search.text, latitude: 26.9505899, longitude: 75.7909157, radius: 2000, offset: 0, limit: 5);
      update();
      print('Response home Search API Data :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          searchHomeData = response.data ?? [];
          update();
        }
      }
      isSearchLoading = false;
      update();
    } catch (e) {
      log("Error Home Page Search API ::::::::::::::: $e");
    }
  }
}
