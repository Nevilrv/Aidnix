import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/view/checkup/checkup_screen.dart';
import 'package:aidnix/view/home/home_screen.dart';
import 'package:aidnix/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  int selected = 0;

  List<Map<String, String>> bottomItems = [
    {
      "title": "Home",
      "icon": AppAssets.iconHome,
    },
    {
      "title": "Test",
      "icon": AppAssets.microscopeIcon,
    },
    {
      "title": "Check Ups",
      "icon": AppAssets.iconClipboard,
    },
    {
      "title": "Profile",
      "icon": AppAssets.iconProfile,
    },
  ];

  List<Widget> screenList = [
    HomeScreen(),
    Container(),
    CheckupScreen(),
    ProfileScreen(),
  ];
}
