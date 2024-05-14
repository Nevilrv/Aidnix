import 'dart:developer';

import 'package:aidnix/theme/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  List addressList = [
    "21, Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
    "21, Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
    "21, Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
  ];

  TextEditingController areaController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();


  var position;


  void getLocation() async {
    try {
      var locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied || locationPermission == LocationPermission.deniedForever) {
        showErrorSnackBar("Please enable location permission");
      } else {
        position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      }
      print('position=======1====>>>>${position.latitude}');
      print('position========2===>>>>${position.longitude}');
    } catch (e) {
      print("EEEEEEEEE____________$e");
    }
  }
}
