import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/constant/app_color.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? leadingIcon;
  final Widget? titleIcon;
  final List<Widget>? action;
  final double? appBarHeight;
  final Color? appBarColor;
  final ShapeBorder? shapeBorder;
  final PreferredSizeWidget? bottom;
  final double? toolBarHeight;
  final double? leadingWidth;
  final double? elevation;

  /// you can add more fields that meet your needs

  const AppAppBar({
    super.key,
    this.titleText,
    this.action,
    this.leadingIcon,
    this.titleIcon,
    this.appBarHeight,
    this.appBarColor,
    this.shapeBorder,
    this.bottom,
    this.toolBarHeight,
    this.leadingWidth,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor ?? kWhite,
      elevation: elevation ?? 0,
      titleSpacing: 0,
      leadingWidth: leadingWidth ?? 50.w,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: leadingIcon ??
            Row(
              children: [
                SizedBox(width: 20.w),
                Image.asset(AppAssets.backArrow, scale: 4),
              ],
            ),
      ),
      title: titleIcon ??
          Text(
            titleText ?? "",
            style: TextStyle(
              color: kBlack,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
      actions: action,
      shape: shapeBorder,
      toolbarHeight: toolBarHeight,
      iconTheme: IconThemeData(color: kBlack),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 60);
}

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
