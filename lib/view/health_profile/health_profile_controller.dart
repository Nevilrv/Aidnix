import 'dart:developer';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/models/res_get_health_profile.dart';
import 'package:aidnix/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HealthProfileController extends GetxController {
  bool isLoading = false;

  String height = "";
  int feet = 0;
  int inches = 0;
  String weight = "";
  String activityLevel = "";
  String smoking = "";
  String diseases = "";
  String birthDate = "";

  HealthData? healthData;

  TextEditingController otherChronicController = TextEditingController();
  TextEditingController medicineAllergiesController = TextEditingController();
  TextEditingController otherAllergiesController = TextEditingController();

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

  Future<void> getHealthProfile() async {
    isLoading = true;
    update();

    var response = await UserRepo().getHealthProfileAPI();
    update();
    log('Response Get All Address Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        healthData = response.data;
        update();
      }
    }

    isLoading = false;
    update();
  }

  Future<void> createHealthProfile() async {
    if (height.isNotEmpty) {
      if (weight.isNotEmpty) {
        if (birthDate.isNotEmpty) {
          if (activityLevel.isNotEmpty) {
            if (smoking.isNotEmpty) {
              if (diseases.isNotEmpty) {
                isLoading = true;
                update();

                var body = {
                  "height": height,
                  "weight": weight,
                  "dob": birthDate,
                  "activity_level": activityLevel,
                  "smoking": smoking,
                  "chronic_diseases": diseases,
                  "other_chronic": otherChronicController.text.trim(),
                  "medicine_allergies": medicineAllergiesController.text.trim(),
                  "other_allergies": otherAllergiesController.text.trim()
                };
                var response = await UserRepo().createHealthProfileAPI(reqBody: body);
                update();
                log('Response Create Health Profile Data :::::::::::::::::: $response');

                if (response != null) {
                  if (response.data != null) {
                    await getHealthProfile();

                    update();
                  }
                }

                isLoading = false;
                update();
              } else {
                Fluttertoast.showToast(msg: "Please select chronic diseases", backgroundColor: kRed, textColor: kWhite);
              }
            } else {
              Fluttertoast.showToast(msg: "Please select smoking", backgroundColor: kRed, textColor: kWhite);
            }
          } else {
            Fluttertoast.showToast(msg: "Please select activity level", backgroundColor: kRed, textColor: kWhite);
          }
        } else {
          Fluttertoast.showToast(msg: "Please select your birth date", backgroundColor: kRed, textColor: kWhite);
        }
      } else {
        Fluttertoast.showToast(msg: "Please select your weight", backgroundColor: kRed, textColor: kWhite);
      }
    } else {
      Fluttertoast.showToast(msg: "Please select your height", backgroundColor: kRed, textColor: kWhite);
    }
  }
}
