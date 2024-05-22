import 'dart:io';
import 'package:aidnix/models/res_add_family_member.dart';
import 'package:aidnix/models/res_add_document.dart';
import 'package:aidnix/models/res_get_family_member.dart';
import 'package:aidnix/repository/user_repository.dart';
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

  bool isFamilyPatient = false;
  FamilyData? selfData;
  FamilyData? selectedFamilyMember;

  bool isLoading = false;
  bool isAddDataLoading = false;
  String pickedImage = "";

  List<FamilyData> familyData = [];
  List<FamilyData> familyDropDownList = [];
  AddFamilyData? addFamilyData;
  ImageData? addFamilyDataImage;

  getFamilyMemberApi() async {
    isLoading = true;
    update();

    var response = await UserRepo().getFamilyMemberAPI();
    update();
    print('Response home API Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        familyData = response.data ?? [];

        selfData = response.data?.where((element) => element.relation == "SELF").first;
        familyDropDownList = response.data?.where((element) => element.relation != "SELF").toList() ?? [];

        update();

        familyDropDownList.add(
          FamilyData(
            name: "Add Family Member",
            referenceId: "Empty",
            phoneNumber: "",
            age: 0,
            gender: "",
            profilePic: null,
            relation: "",
            note: "",
          ),
        );

        update();
      }
    }
    isLoading = false;
    update();
  }

  addFamilyMemberApi({required Map<String, dynamic> body}) async {
    isAddDataLoading = true;
    update();

    var response = await UserRepo().addFamilyMemberAPI(body: body);
    update();
    print('Response home API Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        addFamilyData = response.data;
        update();

        if (addFamilyData != null) {
          if (pickedImage.isNotEmpty) {
            await addDocumentApi();
          } else {
            await getFamilyMemberApi();
            Get.back();
          }
        }
      }

      if (response.code == 200) {}
    }
    isAddDataLoading = false;
    update();
  }

  addDocumentApi() async {
    isAddDataLoading = true;
    update();

    Map<String, dynamic> body = {
      "'name": "profile",
      "file_type": ".jpeg",
      "type": "PROFILE_IMAGE",
      "family_member_id": addFamilyData?.id ?? '',
      "file": await dio.MultipartFile.fromFile(File(pickedImage).path, filename: "profile"),
    };

    var response = await UserRepo().addDocumentAPI(body: body);
    update();
    print('Response Add Document Data :::::::::::::::::: $response');

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
