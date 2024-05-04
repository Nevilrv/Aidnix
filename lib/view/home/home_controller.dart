import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentNearYouBannerIndex = 0;
  int currentPathLabBannerIndex = 0;
  int currentReviewBannerIndex = 0;

  int filterCategoryIndex = 0;
  int filterCategoryItemIndex = 0;

  TextEditingController search = TextEditingController();
}
