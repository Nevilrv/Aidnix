// import 'package:aidnix/theme/app_theme.dart';
// import 'package:aidnix/widgets/custom_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// showAppSnackBar(
//   String tittle,
// ) {
//   return Get.showSnackbar(GetSnackBar(
//       messageText: Text(
//         tittle,
//         style: TextStyle(color: kWhite),
//       ),
//       borderRadius: 0,
//       snackPosition: SnackPosition.TOP,
//       margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//       shouldIconPulse: false,
//       icon: Container(
//         height: 25.h,
//         width: 25.w,
//         decoration: BoxDecoration(color: kWhite, shape: BoxShape.circle),
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
//     messageText: regularSemiBoldText(text: tittle),
//     borderRadius: 15,
//     snackPosition: SnackPosition.BOTTOM,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     shouldIconPulse: false,
//     icon: Icon(
//       Icons.error_outline,
//       color: kWhite,
//     ),
//     backgroundColor: kBlack,
//     duration: const Duration(seconds: 3),
//   ));
// }
//
// showErrorSnackBar(String tittle) {
//   return Get.showSnackbar(GetSnackBar(
//     messageText: regularSemiBoldText(text: tittle, color: kWhite),
//     borderRadius: 15,
//     snackPosition: SnackPosition.BOTTOM,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     shouldIconPulse: false,
//     icon: Icon(
//       Icons.error_outline,
//       color: kWhite,
//     ),
//     backgroundColor: kRed,
//     duration: const Duration(seconds: 3),
//   ));
// }
//
// showSuccessSnackBar(String tittle) {
//   return Get.showSnackbar(
//     GetSnackBar(
//       messageText: regularSemiBoldText(text: tittle),
//       borderRadius: 15,
//       snackPosition: SnackPosition.BOTTOM,
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       shouldIconPulse: false,
//       icon: Icon(Icons.error_outline, color: kBlack),
//       backgroundColor: kPrimary,
//       duration: const Duration(seconds: 3),
//     ),
//   );
// }
