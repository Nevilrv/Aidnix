import 'package:flutter/material.dart';

class AppAssets {
  static const imagePath = "assets/images/";
  static const iconPath = "assets/icons/";

  static const google = "${imagePath}google.png";
  static const homeFirstLabTest = "${imagePath}homeFirstLabTest.png";
  static const homeBookPrescription = "${imagePath}homeBookPrescription.png";
  static const whatsAppLogo = "${imagePath}whatsAppLogo.png";
  static const callIcon = "${imagePath}callIcon.png";
  static const bloodTestIcon = "${imagePath}bloodTestIcon.png";
  static const homePathLab = "${imagePath}homePathLab.png";
  static const homePathLabTwo = "${imagePath}homePathLab_two.png";
  static const noDataFoundImage = "${imagePath}noDataFoundImage.png";
  static const fileImage = "${imagePath}fileImage.png";
  static const camera = "${imagePath}camera.png";
  static const addressLock = "${imagePath}address_lock.png";
  static const familyMember = "${imagePath}family_member.png";
  static const privacyPolicy = "${imagePath}privacy_policy.png";
  static const chatWithUs = "${imagePath}chat_with_us.png";
  static const logout = "${imagePath}logout.png";

  static const backArrow = "${iconPath}back_arrow.png";
  static const editIcon = "${iconPath}edit_icon.png";
  static const mailIcon = "${iconPath}mail_icon.png";
  static const personIcon = "${iconPath}person_icon.png";
  static const notificationIcon = "${iconPath}notification_icon.png";
  static const healthRecord = "${iconPath}health_record.png";
}

Widget assetImage(String image, {double? height, double? width, Color? color, double? scale}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    color: color,
    scale: scale,
    fit: BoxFit.cover,
  );
}

// Widget cachedNetworkImage(
//     {required String url, required double height, double? width, BoxFit? fit}) {
//   if (url.isEmpty) {
//     return Image.network(AppAssets.profile,
//         height: height, width: width, fit: fit ?? BoxFit.cover);
//   } else {
//     return CachedNetworkImage(
//       imageUrl: url,
//       fit: BoxFit.fill,
//       height: height,
//       width: width,
//       placeholder: (context, url) => Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.grey.shade100,
//         child: Container(
//           height: height,
//           decoration: const BoxDecoration(color: Colors.white),
//         ),
//       ),
//       errorWidget: (context, url, error) {
//         return Image.network(AppAssets.profile);
//       },
//     );
//   }
// }
//
// Widget cachedNetworkImageProfile(
//     {required String url, required double height, double? width}) {
//   if (url.isEmpty) {
//     return Image.asset(
//       AppAssets.profile,
//       height: height,
//       width: width,
//       fit: BoxFit.cover,
//     );
//   } else {
//     return CachedNetworkImage(
//       imageUrl: url,
//       fit: BoxFit.fill,
//       height: height,
//       width: width,
//       placeholder: (context, url) => Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.grey.shade100,
//         child: Container(
//           height: height,
//           decoration: const BoxDecoration(color: Colors.white),
//         ),
//       ),
//       errorWidget: (context, url, error) {
//         return Image.asset(
//           AppAssets.profile,
//           color: AppColors.greyColor,
//         );
//       },
//     );
//   }
// }
