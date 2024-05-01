import 'package:aidnix/Theme/app_theme.dart';
import 'package:aidnix/Utils/custom_widget%20.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  final Color? buttonColor;
  final double? radius;
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
    this.radius,
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
        backgroundColor: MaterialStatePropertyAll(buttonColor ?? kGreen),
        fixedSize: MaterialStatePropertyAll(Size(width ?? w, height ?? h * 0.062)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 4),
          ),
        ),
      ),
      child: child ?? customText(textAlign: TextAlign.center, text: title!, color: kBlack, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}

///

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
