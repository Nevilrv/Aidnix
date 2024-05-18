import 'dart:developer';
import 'dart:io';
import 'package:aidnix/models/res_add_document.dart';
import 'package:aidnix/models/res_home_api.dart';
import 'package:aidnix/models/res_home_filter_api.dart';
import 'package:aidnix/models/res_home_search_api.dart';
import 'package:aidnix/repository/home_repository.dart';
import 'package:aidnix/repository/user_repository.dart';
import 'package:aidnix/theme/app_layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  int currentNearYouBannerIndex = 0;
  int currentPathLabBannerIndex = 0;
  int currentReviewBannerIndex = 0;



  TextEditingController search = TextEditingController();

  HomeData? homeData;
  bool isSearchLoading = true;
  List<SearchHomeData>? searchHomeData;

  ImageData? imageData;
  bool isUploadPrescriptionLoading = false;
  String pickedImage = '';

  final ImagePicker picker = ImagePicker();

  bool isFilterLoading = false;
  List<HomeFilterData> filterData = [];
  int filterCategoryIndex = 0;
  List<int> filterInt = [];

  getList() {
    filterInt = [];
    update();
    filterData.forEach((element) {
      filterInt.add(-1);
      update();
    });
    log('filterInt.length===========>>>>${filterInt.length}');
  }

  Future<void> filePicker() async {
    FilePickerResult? image = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg'],
    );
    if (image != null) {
      pickedImage = image.files.single.path ?? "";
      log('pickedImage.path===========>>>>${pickedImage}');

      if (pickedImage != '') {
        await uploadPrescriptionDocumentApi();
      }
    } else {
      print('No file selected.');
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      pickedImage = pickedFile.path;
      log('pickedImage===========>>>>${pickedImage}');

      if (pickedImage != '') {
        await uploadPrescriptionDocumentApi();
      }
    } else {
      print('No image selected.');
    }
    update();
  }

  homeAPI() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        isLoading = true;
        update();

        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        log('position===========>>>>${position}');
        var response = await HomeRepository().homeAPI(latitude: position.latitude, longitude: position.longitude);
        // var response = await HomeRepository().homeAPI(latitude: 26.8505899, longitude: 75.7909157);
        update();
        print('Response home API Data :::::::::::::::::: $response');

        if (response != null) {
          homeData = response.data;
          update();
        }
        isLoading = false;
        update();
      }
    } catch (e) {
      log("EEEE$e");
    }
  }

  homeSearchAPI() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        isSearchLoading = true;
        update();

        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        log('position=========Home_Search_API==>>>>${position}');
        var response = await HomeRepository().homeSearchAPI(
            search: search.text, latitude: position.latitude, longitude: position.longitude, radius: 2000, offset: 0, limit: 5);
        // var response = await HomeRepository().homeSearchAPI(search: search.text, latitude: 26.9505899, longitude: 75.7909157, radius: 2000, offset: 0, limit: 5);
        update();
        print('Response home Search API Data :::::::::::::::::: $response');

        if (response != null) {
          searchHomeData = response.data;
          update();
        }
        isSearchLoading = false;
        update();
      }
    } catch (e) {
      log("EEEE_home_Search__$e");
    }
  }

  /// Upload Prescription Document  API

  uploadPrescriptionDocumentApi() async {
    isUploadPrescriptionLoading = true;
    update();

    Map<String, dynamic> body = {
      "name": "profile",
      "file_type": ".jpeg",
      "type": "PRESCRIPTION",
      "file": await dio.MultipartFile.fromFile(File(pickedImage).path, filename: "profile"),
    };

    var response = await UserRepo().addDocumentAPI(body: body);
    update();
    print('Response Upload Prescription Image Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        imageData = response.data;
        update();
        showSuccessSnackBar("Upload Prescription Successfully!");
        imageData = null;
        update();
        Get.back();
      }
    }
    isUploadPrescriptionLoading = false;
    update();
  }

  /// Home Filter API

  getHomeFilterApi() async {
    isFilterLoading = true;
    update();

    var response = await HomeRepository().homeFilterAPI();
    update();
    print('Response Home Filter Data :::::::::::::::::: $response');

    if (response != null) {
      filterData = response.data!;
      update();
    }
    isFilterLoading = false;
    update();
  }
}
