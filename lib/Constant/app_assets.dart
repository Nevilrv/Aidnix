import 'package:flutter/material.dart';

class AppAssets {
  static const imagePath = "assets/images/";

  static const google = "${imagePath}google.png";
}

Widget assetImage(String image,
    {double? height, double? width, Color? color, double? scale}) {
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
