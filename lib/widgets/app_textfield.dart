import 'package:aidnix/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? style;
  final Widget? label;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filled;
  final Color? textColor;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? counter;
  final bool? readOnly;
  final double? borderRadius;
  final double? borderSize;
  final EdgeInsetsGeometry? contentPadding;

  final bool? isDense;
  final bool? isCollapsed;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.style,
    this.hintStyle,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.keyboardType,
    this.onTap,
    this.onChanged,
    this.maxLength,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.filled,
    this.textColor,
    this.fillColor,
    this.borderColor,
    this.counter,
    this.readOnly,
    this.borderRadius,
    this.borderSize,
    this.contentPadding,
    this.isDense,
    this.isCollapsed,
    this.decoration,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
      onChanged: onChanged,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      maxLength: maxLength,
      maxLines: maxLines,
      expands: false,
      readOnly: readOnly ?? false,
      inputFormatters: inputFormatters,
      autofocus: false,
      cursorColor: kPrimary,
      cursorWidth: 1.5,
      style: style ?? TextStyle(fontWeight: FontWeight.w400, color: textColor ?? kBlack, fontSize: 14.sp, fontFamily: "Poppins"),
      validator: validator,
      decoration: decoration ??
          InputDecoration(
            counter: counter ?? const SizedBox(),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            isDense: isDense ?? false,
            isCollapsed: isCollapsed ?? false,
            contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            label: label,
            labelText: labelText,
            labelStyle: labelStyle ?? TextStyle(fontWeight: FontWeight.w600, color: kBlack, fontSize: 12.sp, fontFamily: "Poppins"),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: false,
            hintText: hintText,
            hintStyle:
                hintStyle ?? TextStyle(fontWeight: FontWeight.w400, color: kGrey.withOpacity(0.7), fontSize: 14.sp, fontFamily: "Poppins"),
            filled: filled ?? false,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
            ),
          ),
    );
  }
}
