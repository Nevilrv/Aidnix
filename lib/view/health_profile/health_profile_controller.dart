import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthProfileController extends GetxController {
  String height = "";
  String weight = "";
  String activityLevel = "";
  String smoking = "";
  String diseases = "";

  TextEditingController noteController = TextEditingController();
  TextEditingController medicineAllergiesController = TextEditingController();
  TextEditingController otherAllergiesController = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
}
