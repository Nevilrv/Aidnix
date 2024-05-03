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

  List<Widget> screenList = [
    HomeScreen(),
    Container(),
    CheckupScreen(),
    ProfileScreen(),
  ];
}
