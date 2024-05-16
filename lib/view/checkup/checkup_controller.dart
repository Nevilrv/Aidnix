import 'dart:developer';

import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/theme/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CheckUpController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isSearchLoading = false;
  List<SearchHomeData>? searchData;

  searchAPI() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        isSearchLoading = true;
        update();

        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        log('position=========Home_Search_API==>>>>${position}');
        var response = await HomeRepository().homeSearchAPI(
            search: searchController.text, latitude: position.latitude, longitude: position.longitude, radius: 2000, offset: 0, limit: 5);
        // var response = await HomeRepository().homeSearchAPI(search: searchController.text, latitude: 26.9505899, longitude: 75.7909157, radius: 2000, offset: 0, limit: 5);
        update();
        print('Response home Search API Data :::::::::::::::::: $response');

        if (response != null) {
          searchData = response.data;
          update();
        }
        isSearchLoading = false;
        update();
      }
    } catch (e) {
      log("EEEE_home_Search__$e");
    }
  }
}
