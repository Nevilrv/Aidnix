import 'package:flutter/material.dart';

class AppAssets {
  static const imagePath = "assets/images/";
  static const iconPath = "assets/icons/";

  static const google = "${imagePath}google.png";
  static const homeFirstLabTest = "${imagePath}homeFirstLabTest.png";
  static const homeBookPrescription = "${imagePath}homeBookPrescription.png";
  static const whatsAppLogo = "${imagePath}whatsAppLogo.png";
  static const callIcon = "${imagePath}callIcon.png";
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
  static const pdfIcon = "${imagePath}pdfIcon.png";
  static const fileIcon = "${imagePath}fileIcon.png";
  static const homeIcon = "${imagePath}home_icon.png";
  static const locationOutline = "${imagePath}location_outline.png";
  static const bookTestSuccess = "${imagePath}bookTestSuccess.png";
  static const qrCodeImage = "${imagePath}qr_code_image.png";
  static const qrCodeGreenImage = "${imagePath}qr_code_green.png";
  static const clock = "${imagePath}clock.png";
  static const bloodTestIcon = "${imagePath}bloodTestIcon.png";
  static const bloodTestSmallIcon = "${imagePath}blood_test_small_icon.png";
  static const urineTest = "${imagePath}urine_test.png";
  static const heartTest = "${imagePath}heart_test.png";
  static const stepperCircle = "${imagePath}stepper_circle.png";
  static const relationLink = "${imagePath}relation_link.png";
  static const badRequest = "${imagePath}bad_request.png";
  static const editIconGreen = "${imagePath}edit_icon_green.png";
  static const deleteIconRed = "${imagePath}delete_icon_red.png";

  static const iconVerify = "${iconPath}icon_verify.svg";
  static const arrowDown = "${iconPath}arrow_down.png";

  static const backArrow = "${iconPath}back_arrow.png";
  static const editIcon = "${iconPath}edit_icon.png";
  static const mailIcon = "${iconPath}mail_icon.png";
  static const personIcon = "${iconPath}person_icon.png";
  static const notificationIcon = "${iconPath}notification_icon.png";
  static const healthRecord = "${imagePath}health_record.png";

  ///
  static const logo = "${imagePath}logo.png";
  static const splashBG = "${imagePath}splash_screen.png";
  static const onboardingImage = "${imagePath}onboarding_image.png";
  static const checkupBG = "${imagePath}checkupBG.png";
  static const dummy = "${imagePath}dummy.png";
  static const dummyDoctor = "${imagePath}dummy_doctor.png";
  static const labImage = "${imagePath}lab.png";

  ///Icons
  static const streamLine = "${iconPath}Icon_stream_line.svg";
  static const vector = "${iconPath}icons_vector.svg";
  static const whatsapp = "${iconPath}icon_whatsapp.svg";
  static const starIcons = "${iconPath}icon_star.svg";
  static const microscope = "${iconPath}icon_microscope-fill.svg";
  static const medical = "${iconPath}icon_medical.svg";
  static const bloodTest = "${iconPath}icon_blood_test.svg";
  static const location2 = "${iconPath}icon_location_2.svg";
  static const vacation = "${iconPath}icon_vacation.svg";
  static const labProfile = "${iconPath}image_lab_profile.png";
  static const microscopeIcon = "${iconPath}icon_microscope-fill.svg";
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
