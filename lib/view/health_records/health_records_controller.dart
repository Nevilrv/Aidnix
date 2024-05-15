import 'dart:developer';

import 'package:aidnix/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthRecordsController extends GetxController {
  TabController? tabController;

  int selectTabIndex = 0;

  bool isLoading = false;

  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController drNameController = TextEditingController();

  List tabList = [
    "Reports",
    "Prescriptions",
    "Invoice",
    "Others",
  ];

  String mySelf = "";
  String typeOfRecord = "";

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future<void> getHealthDocs() async {
    isLoading = true;
    update();

    var response = await UserRepo().getHealthDocsAPI(
      docType: tabController?.index == 0
          ? "REPORT"
          : tabController?.index == 1
              ? "PRESCRIPTION"
              : tabController?.index == 2
                  ? "INVOICE"
                  : tabController?.index == 3
                      ? "OTHERS"
                      : "REPORT",
      offset: 0,
      limit: 10,
    );
    update();
    log('Response Get Health Docs :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        // healthData = response.data;
        update();
      }
    }

    isLoading = false;
    update();
  }
}
