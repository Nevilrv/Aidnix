import 'dart:developer';
import 'dart:io';
import 'package:aidnix/models/res_add_document.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/models/res_get_general_setting.dart';
import 'package:aidnix/repository/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  bool isLoading = false;
  bool isAddEmail = false;
  bool isAddGender = false;

  ProfileData? profileData;

  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String selectGender = "";
  List genderList = ["MALE", "FEMALE", "OTHERS"];

  PlatformFile? profileImage;
  ImageData? imageData;

  /// Get General Setting

  Future<void> getGeneralSetting() async {
    isLoading = true;
    update();
    var response = await UserRepo().getGeneralSettingAPI();
    update();
    log('Response Get General Setting Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        profileData = response.data;
        update();
      }
    }

    isLoading = false;
    update();
  }

  /// Add Profile Image

  addProfileImageApi() async {
    isLoading = true;
    update();

    Map<String, dynamic> body = {
      "name": "profile",
      "file_type": ".jpeg",
      "type": "PROFILE_IMAGE",
      "file": await dio.MultipartFile.fromFile(File(profileImage?.path ?? "").path, filename: "profile"),
    };

    var response = await UserRepo().addDocumentAPI(body: body);
    update();
    print('Response Document Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        imageData = response.data;
        update();
        profileImage = null;
        update();
      }
    }
    isLoading = false;
    update();
  }

  /// Update General Setting
  Future<void> updateGeneralSetting() async {
    if (emailController.text.trim().isNotEmpty) {
      if (selectGender.isNotEmpty) {
        isLoading = true;
        update();

        var reqBody = {
          "email": emailController.text.trim(),
          "gender": selectGender,
        };

        var response = await UserRepo().updateGeneralSettingAPI(reqBody: reqBody);
        update();
        log('Response Update General Setting Data :::::::::::::::::: $response');

        isLoading = false;
        update();

        if (profileImage != null) {
          await addProfileImageApi();
        }

        if (response != null) {
          if (response.data != null) {
            await getGeneralSetting();

            isAddGender = false;
            isAddEmail = false;
            emailController.clear();
            selectGender = "";
          }
        }
      } else {
        Fluttertoast.showToast(msg: "Please select gender", backgroundColor: kRed, textColor: kWhite);
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter your email", backgroundColor: kRed, textColor: kWhite);
    }
  }
}
