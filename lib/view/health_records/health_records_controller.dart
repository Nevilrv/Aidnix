import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthRecordsController extends GetxController {
  int selectTabIndex = 0;

  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController drNameController = TextEditingController();

  List tabList = [
    "Reports",
    "Prescriptions",
    "Invoice",
    "Others",
  ];

  String mySelf = "";
  String typeOfRecord = "";

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
}
