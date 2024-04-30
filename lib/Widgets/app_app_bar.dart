import 'package:aidnix/Constant/app_color.dart';
import 'package:aidnix/Utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar commonAppBar(
    {required final String title,
    final Widget? backIcon,
    final Widget? actionsIcon,
    final double? titleSpacing,
    final bool? centerTitle,
    required final bool automaticallyImplyLeading,
    final bool? actions}) {
  return AppBar(
    centerTitle: centerTitle,
    titleSpacing: titleSpacing,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: backIcon,
    actions: [
      actionsIcon ?? const SizedBox(),
      actions == true
          ? const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(CupertinoIcons.search),
            )
          : const SizedBox()
    ],
    shadowColor: Colors.transparent,
    backgroundColor: AppColors.primary,
    title: title.semiBoldTextStyle(fontSize: 19),
  );
}
