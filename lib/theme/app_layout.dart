// import 'package:aidnix/Utils/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'app_theme.dart';
//
// showAppSnackBar(
//   String tittle,
// ) {
//   return Get.showSnackbar(GetSnackBar(
//       messageText: Text(
//         tittle,
//         style: TextStyle(color: whiteColor),
//       ),
//       borderRadius: 0,
//       snackPosition: SnackPosition.TOP,
//       margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//       shouldIconPulse: false,
//       icon: Container(
//         height: 25,
//         width: 25,
//         decoration: BoxDecoration(color: whiteColor, shape: BoxShape.circle),
//         child: Center(
//           child: Icon(
//             Icons.close_rounded,
//             color: kBlack,
//           ),
//         ),
//       ),
//       backgroundColor: kBlack,
//       duration: const Duration(seconds: 3)));
// }
//
// showBottomSnackBar(String tittle) {
//   return Get.showSnackbar(GetSnackBar(
//     messageText: tittle.semiBoldTextStyle(fontColor: kBlack),
//     borderRadius: 15,
//     snackPosition: SnackPosition.BOTTOM,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     shouldIconPulse: false,
//     icon: Icon(
//       Icons.error_outline,
//       color: whiteColor,
//     ),
//     backgroundColor: kBlack,
//     duration: const Duration(seconds: 3),
//   ));
// }
//
// showErrorSnackBar(String tittle) {
//   return Get.showSnackbar(GetSnackBar(
//     messageText: tittle.semiBoldTextStyle(fontColor: whiteColor),
//     borderRadius: 15,
//     snackPosition: SnackPosition.BOTTOM,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     shouldIconPulse: false,
//     icon: Icon(
//       Icons.error_outline,
//       color: whiteColor,
//     ),
//     backgroundColor: redColor,
//     duration: const Duration(seconds: 3),
//   ));
// }
//
// showSuccessSnackBar(String tittle) {
//   return Get.showSnackbar(
//     GetSnackBar(
//       messageText: tittle.semiBoldTextStyle(fontColor: kBlack),
//       borderRadius: 15,
//       snackPosition: SnackPosition.BOTTOM,
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       shouldIconPulse: false,
//       icon: Icon(Icons.error_outline, color: kBlack),
//       backgroundColor: primary,
//       duration: const Duration(seconds: 3),
//     ),
//   );
// }
