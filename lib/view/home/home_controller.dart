import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int selected = 0;

  TextEditingController search = TextEditingController();

  List<Map<String, String>> bottomItems = [
    {
      "title": "Home",
      "icon": "assets/icons/icon_home.svg",
    },
    {
      "title": "Test",
      "icon": "assets/icons/icon_microscope-fill.svg",
    },
    {
      "title": "Check Ups",
      "icon": "assets/icons/iocn_clipboard.svg",
    },
    {
      "title": "Profile",
      "icon": "assets/icons/icon_profile.svg",
    },
  ];

  int currentNearYouBannerIndex = 0;
  int currentPathLabBannerIndex = 0;
  int currentReviewBannerIndex = 0;

  int filterCategoryIndex = 0;
  int filterCategoryItemIndex = 0;
}
