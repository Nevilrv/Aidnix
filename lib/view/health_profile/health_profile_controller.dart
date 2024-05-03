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

  List activityList = [
    'Rarely',
    'Occasional',
    'Daily',
  ];

  List smokingList = [
    'Never',
    'Yes',
    'Past Smoker',
  ];

  List diseasesList = [
    'Alzheimer',
    'Asthma',
    'Cancer',
    'COPD',
    'Cystic Fibrosis',
    'Diabetes',
    'Epilepsy',
    'Gastric issues',
    'Heart Disease',
    'HIV/AIDS',
    'kidney Disease',
    'Mood Disorders',
    'Osteoporosis',
    'Parkinson',
    'Thyroid',
  ];

  List cancelReasonList = [
    'Missed the fasting requirements',
    'My preferred collection slot is not available',
    'Need to change sample collation address',
    'Order placed by mistake',
    'Need to add/remove tests',
    'Payment issue',
    'Founder better price elsewhere',
    'Need to apply coupon offer',
    'Reason not listed here',
  ];
}
