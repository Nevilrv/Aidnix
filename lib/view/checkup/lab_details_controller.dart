import 'dart:developer';
import 'package:aidnix/models/res_home_filter_api.dart';
import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/repository/checkup_repository.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/theme/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../models/res_single_lab_details_api.dart';

class LabDetailsController extends GetxController {
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  Data? labData;
  bool isSearchLoading = false;
  List<SearchHomeData>? searchData;

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

  labDetailsAPI() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        isLoading = true;
        update();

        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        log('position=========lab Details_API==>>>>${position}');
        var response = await CheckUpRepository()
            .labDetailsAPI(labId: "d4e744df-de3c-4e7d-ba1d-aee88905c874", latitude: position.latitude, longitude: position.longitude);
        // var response = await CheckUpRepository().labDetailsAPI(labId: "d4e744df-de3c-4e7d-ba1d-aee88905c874", latitude: 26.9505899, longitude: 75.7909157);
        update();
        print('Response lab Details API Data :::::::::::::::::: $response');

        if (response != null) {
          labData = response.data;
          update();
        }
        isLoading = false;
        update();
      }
    } catch (e) {
      log("EEEE_lab_Details__$e");
    }
  }

  /// Search Data

  searchAPI() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        isSearchLoading = true;
        update();

        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        log('position=========lab Details_Search_API==>>>>${position}');
        var response = await HomeRepository().homeSearchAPI(
            search: searchController.text, latitude: position.latitude, longitude: position.longitude, radius: 2000, offset: 0, limit: 5);
        // var response = await HomeRepository().homeSearchAPI(search: searchController.text, latitude: 26.9505899, longitude: 75.7909157, radius: 2000, offset: 0, limit: 5);
        update();
        print('Response lab Details Search API Data :::::::::::::::::: $response');

        if (response != null) {
          searchData = response.data;
          update();
        }
        isSearchLoading = false;
        update();
      }
    } catch (e) {
      log("EEEE_Search__$e");
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
}
