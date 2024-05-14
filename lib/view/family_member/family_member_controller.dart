import 'dart:io';

import 'package:aidnix/models/res_add_family_member.dart';
import 'package:aidnix/models/res_add_family_member_image.dart';
import 'package:aidnix/models/res_get_family_member.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class FamilyMemberController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addNoteController = TextEditingController();

  String selectGender = "";
  String selectRelation = "";

  List genderList = ["MALE", "FEMALE", "OTHERS"];
  List relationList = [
    "SELF",
    "BROTHER",
    "SISTER",
    "FATHER",
    "MOTHER",
    "DAUGHTER",
    "SON",
    "HUSBAND",
    "WIFE",
    "OTHER",
  ];
  // List<Map<String, dynamic>> familyDetail = [
  //   {
  //     "name": "Kapil Darsan",
  //     "relation": "Husband",
  //     "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"
  //   },
  //   {
  //     "name": "Kanak Sharma",
  //     "relation": "Sister",
  //     "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"
  //   },
  //   {
  //     "name": "Konika Sharma",
  //     "relation": "Daughter",
  //     "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"
  //   },
  //   {
  //     "name": "Kartik Sharma",
  //     "relation": "Son",
  //     "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
  //   }
  // ];
  bool isLoading = false;
  bool isAddDataLoading = false;
  String? pickedImage;

  List<FamilyData>? familyData;
  AddFamilyData? addFamilyData;
  ImageData? addFamilyDataImage;

  getFamilyMemberApi() async {
    isLoading = true;
    update();

    var response = await HomeRepository().getFamilyMemberAPI();
    update();
    print('Response home API Data :::::::::::::::::: $response');

    if (response != null) {
      familyData = response.data;
      update();
    }
    isLoading = false;
    update();
  }

  addFamilyMemberApi({required Map<String, dynamic> body}) async {
    isAddDataLoading = true;
    update();

    var response = await HomeRepository().addFamilyMemberAPI(body: body);
    update();
    print('Response home API Data :::::::::::::::::: $response');

    if (response != null) {
      addFamilyData = response.data;
      update();

      if (response.code == 200) {
        if (pickedImage != '') {
          addFamilyMemberImageApi();
        } else {
          Get.back();
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await getFamilyMemberApi();
          });
        }
      }
    }
    isAddDataLoading = false;
    update();
  }

  addFamilyMemberImageApi() async {
    isAddDataLoading = true;
    update();

    Map<String, dynamic> body = {
      "'name": "profile",
      "file_type": ".jpeg",
      "type": "PROFILE_IMAGE",
      "family_member_id": addFamilyData?.id ?? '',
      "file": await dio.MultipartFile.fromFile(File(pickedImage!).path, filename: "profile"),
    };

    var response = await HomeRepository().addFamilyMemberImageAPI(body: body);
    update();
    print('Response home API Data :::::::::::::::::: $response');

    if (response != null) {
      addFamilyDataImage = response.data;
      update();

      if (response.code == 200) {
        Get.back();
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await getFamilyMemberApi();
        });
      }
    }
    isAddDataLoading = false;
    update();
  }
}
