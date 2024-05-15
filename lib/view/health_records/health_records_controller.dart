import 'dart:developer';
import 'dart:io';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/repository/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class HealthRecordsController extends GetxController {
  TabController? tabController;

  int selectTabIndex = 0;

  bool isLoading = false;

  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController docNameController = TextEditingController();
  TextEditingController drNameController = TextEditingController();

  List<String> typeOfRecordsList = [
    "Report",
    "Prescription",
    "Invoice",
    "Others",
  ];

  String mySelf = "";
  String typeOfRecord = "";

  List<String> userList = [
    'My Self',
    'Family Member',
  ];

  PlatformFile? healthDocument;

  /// Get Health Document

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

  /// Get Filter Health Document

  Future<void> getFilterHealthDocs() async {
    if (mySelf.isNotEmpty) {
      isLoading = true;
      update();

      var response = await UserRepo().getFilterHealthDocsAPI(
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
        user: mySelf == "My Self" ? "SELF" : "",
        date: dateController.text.trim(),
      );
      update();
      log('Response Get Filter Health Docs :::::::::::::::::: $response');

      if (response != null) {
        if (response.data != null) {
          // healthData = response.data;
          update();
          Get.back();
        }
      }

      isLoading = false;
      update();
    } else {
      Fluttertoast.showToast(msg: "Please select user", backgroundColor: kRed, textColor: kWhite);
    }
  }

  /// Upload  Document

  Future<void> uploadHealthDocument() async {
    if (healthDocument != null) {
      if (mySelf.isNotEmpty) {
        if (typeOfRecord.isNotEmpty) {
          isLoading = true;
          update();

          Map<String, dynamic> body = {
            "name": "profile",
            "file_type": ".jpeg",
            "type": typeOfRecord.toUpperCase(),
            if (mySelf != "My Self") "family_member_id": "",
            "file": await dio.MultipartFile.fromFile(File(healthDocument?.path ?? "").path, filename: "profile"),
          };

          var response = await UserRepo().addDocumentAPI(body: body);
          update();
          log('Response Upload Health Document Data :::::::::::::::::: $response');

          if (response != null) {
            if (response.data != null) {
              healthDocument = null;
              mySelf = "";
              typeOfRecord = "";
              update();
              Get.back();
            }
          }
          isLoading = false;
          update();
        } else {
          Fluttertoast.showToast(msg: "Please select type of record", backgroundColor: kRed, textColor: kWhite);
        }
      } else {
        Fluttertoast.showToast(msg: "Please select user", backgroundColor: kRed, textColor: kWhite);
      }
    } else {
      Fluttertoast.showToast(msg: "Please upload health document", backgroundColor: kRed, textColor: kWhite);
    }
  }

  /// Edit Health Document

  Future<void> editHealthDocs({required String docId}) async {
    if (docNameController.text.trim().isNotEmpty) {
      if (mySelf.isNotEmpty) {
        if (typeOfRecord.isNotEmpty) {
          isLoading = true;
          update();

          var reqBody = {
            "name": docNameController.text.trim(),
            "type": typeOfRecord.toUpperCase(),
            if (mySelf != "My Self") "family_member_id": "ef969de5-92e4-4691-bc8d-f84c7b1ce99b",
          };

          var response = await UserRepo().editHealthDocsAPI(docId: docId, reqBody: reqBody);
          update();
          log('Response Edit Health Docs :::::::::::::::::: $response');

          if (response != null) {
            if (response.data != null) {
              // healthData = response.data;
              update();

              getHealthDocs();

              Get.back();
            }
          }

          isLoading = false;
          update();
        } else {
          Fluttertoast.showToast(msg: "Please select type of record", backgroundColor: kRed, textColor: kWhite);
        }
      } else {
        Fluttertoast.showToast(msg: "Please select user", backgroundColor: kRed, textColor: kWhite);
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter document name", backgroundColor: kRed, textColor: kWhite);
    }
  }

  /// Delete Health Document

  Future<void> deleteHealthDocs({required String docId}) async {
    isLoading = true;
    update();

    var response = await UserRepo().deleteHealthDocsAPI(docId: docId);
    update();
    log('Response Delete Health Docs :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        // healthData = response.data;
        update();
        getHealthDocs();

        Get.back();
      }
    }

    isLoading = false;
    update();
  }
}
