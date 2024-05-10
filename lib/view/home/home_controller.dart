import 'package:aidnix/repository/home_repository.dart';
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

  List homeList = [];

  homeAPI() async {
    isLoading = true;
    update();

    var response = await HomeRepository().homeAPI(latitude: 26.8505899, longitude: 75.7909157);
    update();
    print('Response home API Data :::::::::::::::::: $response');

    if (response != null) {
      homeList = response.data ?? [];

      update();
    }

    isLoading = false;
    update();
  }
}
