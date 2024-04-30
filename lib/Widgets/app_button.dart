import 'package:aidnix/Constant/app_color.dart';
import 'package:aidnix/Utils/extension.dart';
import 'package:flutter/material.dart';


class AppFilledButton extends StatelessWidget {
  final Color? buttonColor;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? title;
  final Color? textColor;
  final Color? borderColor;
  final Function() onPressed;
  final Widget? child;
  const AppFilledButton({
    super.key,
    this.buttonColor,
    this.borderRadius,
    this.width,
    this.title,
    this.textColor,
    required this.onPressed,
    this.borderColor,
    this.height,
    this.fontSize,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(buttonColor ?? AppColors.primary),
        fixedSize:
            MaterialStatePropertyAll(Size(width ?? w, height ?? h * 0.062)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius!,
          ),
        ),
      ),
      child: child ??
          title!.mediumTextStyle(
              fontColor: textColor ?? AppColors.blackColor,
              fontSize: fontSize ?? 20),
    );
  }
}
