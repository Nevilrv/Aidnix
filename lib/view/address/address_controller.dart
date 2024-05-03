import 'package:flutter/material.dart';
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
}
