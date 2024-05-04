import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  ///LOGIN SCREEN
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  List<Map<String, dynamic>> onBoardList = [
    {
      "image": AppAssets.onboardingImage,
      "text": "Accurate Testing, Unbeatable Prices",
      "detailText":
          "Book your medical tests from Certified Labs, Exclusively on Our Platform in Your City!"
    },
    {
      "image": AppAssets.onboardingImage,
      "text": "Experience Unmatched price and Convenience ",
      "detailText":
          "Book with Us for the Most Accurate Results, Lowest Prices, and Exclusive Discounts!"
    },
    {
      "image": AppAssets.onboardingImage,
      "text": "Experience Unmatched price and Convenience ",
      "detailText":
          "Book with Us for the Most Accurate Results, Lowest Prices, and Exclusive Discounts!"
    }
  ];

  bool check = false;

  checkValue(value) {
    check = value!;
    update();
  }

  PageController pageController = PageController();
  int selected = 0;
  changeTabs(index) {
    selected = index;
    update();
  }

  nextPage() {
    if (selected == 2) {
      Get.offAllNamed(Routes.loginScreen);
    } else {
      selected++;
      pageController.animateToPage(
        selected,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    }
    update();
  }
}
