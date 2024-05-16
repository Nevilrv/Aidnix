import 'dart:developer';
import 'package:aidnix/models/res_home_api.dart';
import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/theme/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  List<SearchHomeData>? searchHomeData;

  homeAPI() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        isLoading = true;
        update();

        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        log('position===========>>>>${position}');
        var response = await HomeRepository().homeAPI(latitude: position.latitude, longitude: position.longitude);
        // var response = await HomeRepository().homeAPI(latitude: 26.8505899, longitude: 75.7909157);
        update();
        print('Response home API Data :::::::::::::::::: $response');

        if (response != null) {
          homeData = response.data;
          update();
        }
        isLoading = false;
        update();
      }
    } catch (e) {
      log("EEEE$e");
    }
  }

  homeSearchAPI() async {
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
            search: search.text, latitude: position.latitude, longitude: position.longitude, radius: 2000, offset: 0, limit: 5);
        // var response = await HomeRepository().homeSearchAPI(search: search.text, latitude: 26.9505899, longitude: 75.7909157, radius: 2000, offset: 0, limit: 5);
        update();
        print('Response home Search API Data :::::::::::::::::: $response');

        if (response != null) {
          searchHomeData = response.data;
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
