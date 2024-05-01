// import 'package:aidnix/Theme/app_theme.dart';
// import 'package:aidnix/Utils/extension.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// AppBar commonAppBar(
//     {required final String title,
//     final Widget? backIcon,
//     final Widget? actionsIcon,
//     final double? titleSpacing,
//     final bool? centerTitle,
//     required final bool automaticallyImplyLeading,
//     final bool? actions}) {
//   return AppBar(
//     centerTitle: centerTitle,
//     titleSpacing: titleSpacing,
//     automaticallyImplyLeading: automaticallyImplyLeading,
//     leading: backIcon,
//     actions: [
//       actionsIcon ?? const SizedBox(),
//       actions == true
//           ? const Padding(
//               padding: EdgeInsets.only(right: 25),
//               child: Icon(CupertinoIcons.search),
//             )
//           : const SizedBox()
//     ],
//     shadowColor: Colors.transparent,
//     backgroundColor: primary,
//     title: title.semiBoldTextStyle(fontSize: 19),
//   );
// }
