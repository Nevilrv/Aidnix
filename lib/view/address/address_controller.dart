import 'dart:developer';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/models/res_get_all_addresses_api.dart';
import 'package:aidnix/repository/address_repository.dart';
import 'package:aidnix/theme/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  bool isLoading = false;

  List<Address> addressList = [];

  String addressType = "Home";

  TextEditingController areaController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  Position? position;

  void getLocation() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      }
      print('position=======1====>>>> ${position?.latitude}');
      print('position========2===>>>> ${position?.longitude}');
    } catch (e) {
      print("EEEEEEEEE____________$e");
    }
  }

  Future<void> getAllAddress() async {
    isLoading = true;
    update();

    var response = await AddressRepo().getAllAddressAPI();
    update();
    log('Response Get All Address Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        addressList = response.data ?? [];
        update();
      }
    }

    isLoading = false;
    update();
  }

  Future<void> addAddress() async {
    if (areaController.text.trim().isNotEmpty) {
      if (houseNoController.text.trim().isNotEmpty) {
        if (cityController.text.trim().isNotEmpty) {
          if (stateController.text.trim().isNotEmpty) {
            if (pinCodeController.text.trim().isNotEmpty) {
              isLoading = true;
              update();

              var body = {
                "line_1": houseNoController.text.trim(),
                "line_2": areaController.text.trim(),
                "pincode": int.tryParse(pinCodeController.text.trim()),
                "city": cityController.text.trim(),
                "state": stateController.text.trim(),
                "country": "INDIA",
                "type": addressType
              };

              var response = await AddressRepo().addAddressDetailAPI(reqBody: body);
              update();
              log('Response Add Address Data :::::::::::::::::: $response');

              if (response != null) {
                await getAllAddress();
                update();

                Get.back();
              }

              isLoading = false;
              update();
            } else {
              Fluttertoast.showToast(msg: "Please enter your area pincode", backgroundColor: kRed, textColor: kWhite);
            }
          } else {
            Fluttertoast.showToast(msg: "Please enter your state", backgroundColor: kRed, textColor: kWhite);
          }
        } else {
          Fluttertoast.showToast(msg: "Please enter your city", backgroundColor: kRed, textColor: kWhite);
        }
      } else {
        Fluttertoast.showToast(msg: "Please enter your house no", backgroundColor: kRed, textColor: kWhite);
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter your location area", backgroundColor: kRed, textColor: kWhite);
    }
  }
}
