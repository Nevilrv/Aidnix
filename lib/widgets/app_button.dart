import 'package:aidnix/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? buttonColor;
  final Decoration? decoration;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final String buttonText;
  final TextStyle? textStyle;
  final void Function() onTap;
  final BoxBorder? border;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.buttonColor,
    this.decoration,
    this.borderRadius,
    this.child,
    required this.buttonText,
    this.textStyle,
    required this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: decoration ??
            BoxDecoration(
              color: buttonColor ?? kGreen,
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              border: border,
            ),
        child: child ??
            Text(
              buttonText ?? "",
              style: textStyle ?? TextStyle(fontWeight: FontWeight.w600, color: kBlack, fontSize: 14),
            ),
      ),
    );
  }
}
