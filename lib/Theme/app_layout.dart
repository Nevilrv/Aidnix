import 'package:aidnix/Constant/app_color.dart';
import 'package:aidnix/Utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAppSnackBar(
  String tittle,
) {
  return Get.showSnackbar(GetSnackBar(
      messageText: Text(
        tittle,
        style: const TextStyle(color: AppColors.whiteColor),
      ),
      borderRadius: 0,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shouldIconPulse: false,
      icon: Container(
        height: 25,
        width: 25,
        decoration: const BoxDecoration(
            color: AppColors.whiteColor, shape: BoxShape.circle),
        child: const Center(
          child: Icon(
            Icons.close_rounded,
            color: AppColors.blackColor,
          ),
        ),
      ),
      backgroundColor: AppColors.blackColor,
      duration: const Duration(seconds: 3)));
}

showBottomSnackBar(String tittle) {
  return Get.showSnackbar(GetSnackBar(
    messageText: tittle.semiBoldTextStyle(fontColor: AppColors.blackColor),
    borderRadius: 15,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shouldIconPulse: false,
    icon: const Icon(
      Icons.error_outline,
      color: AppColors.whiteColor,
    ),
    backgroundColor: AppColors.blackColor,
    duration: const Duration(seconds: 3),
  ));
}

showErrorSnackBar(String tittle) {
  return Get.showSnackbar(GetSnackBar(
    messageText: tittle.semiBoldTextStyle(fontColor: AppColors.whiteColor),
    borderRadius: 15,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shouldIconPulse: false,
    icon: const Icon(
      Icons.error_outline,
      color: AppColors.whiteColor,
    ),
    backgroundColor: AppColors.redColor,
    duration: const Duration(seconds: 3),
  ));
}

showSuccessSnackBar(String tittle) {
  return Get.showSnackbar(
    GetSnackBar(
      messageText: tittle.semiBoldTextStyle(fontColor: AppColors.blackColor),
      borderRadius: 15,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shouldIconPulse: false,
      icon: const Icon(Icons.error_outline, color: AppColors.blackColor),
      backgroundColor: AppColors.primary,
      duration: const Duration(seconds: 3),
    ),
  );
}
