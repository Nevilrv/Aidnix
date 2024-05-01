import 'package:flutter/material.dart';

class AppAssets {
  static const imagePath = "assets/images/";
  static const iconsPath = "assets/icons/";

  ///
  static const logo = "${imagePath}logo.png";
  static const splashBG = "${imagePath}splash_screen.png";
  static const onboardingImage = "${imagePath}onboarding_image.png";
  static const checkupBG = "${imagePath}checkupBG.png";
  static const dummy = "${imagePath}dummy.png";
  static const dummyDoctor = "${imagePath}dummy_doctor.png";
  static const labImage = "${imagePath}lab.png";
  static const labProfile = "${imagePath}image_lab_profile.png";

  ///Icons
  static const streamLine = "${iconsPath}Icon_stream_line.svg";
  static const vector = "${iconsPath}icons_vector.svg";
  static const whatsapp = "${iconsPath}icon_whatsapp.svg";
  static const verify = "${iconsPath}icon_verify.svg";
  static const starIcons = "${iconsPath}icon_star.svg";
  static const microscope = "${iconsPath}icon_microscope-fill.svg";
  static const medical = "${iconsPath}icon_medical.svg";
  static const bloodTest = "${iconsPath}icon_blood_test.svg";
  static const location2 = "${iconsPath}icon_location_2.svg";
  static const vacation = "${iconsPath}icon_vacation.svg";
}

Widget assetImage(String image,
    {double? height, double? width, Color? color, double? scale}) {
  return Image.asset(image,
      height: height,
      width: width,
      color: color,
      scale: scale,
      fit: BoxFit.cover);
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
