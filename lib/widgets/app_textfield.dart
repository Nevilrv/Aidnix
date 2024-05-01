import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCommonTextField extends StatelessWidget {
  final String labelText;

  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  const AppCommonTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.onChanged,
    this.textInputType,
    this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: validator,
      controller: controller,
      cursorColor: kBlack,
      onChanged: onChanged,
      keyboardType: textInputType,
      textInputAction: TextInputAction.search,
      style: TextStyle(
        fontSize: 15,
        color: kBlack,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 16,
          color: kGrey,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: kLightGrey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: kLightGrey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: kLightGrey)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: kLightGrey)),
      ),
    );
  }
}

///----------

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
      style: style ??
          TextStyle(
              fontWeight: FontWeight.w400,
              color: textColor ?? kBlack,
              fontSize: 14.sp,
              fontFamily: "Poppins"),
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
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            label: label,
            labelText: labelText,
            labelStyle: labelStyle ??
                TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kBlack,
                    fontSize: 12.sp,
                    fontFamily: "Poppins"),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: false,
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kGrey.withOpacity(0.7),
                    fontSize: 14.sp,
                    fontFamily: "Poppins"),
            filled: filled ?? false,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? kLightGrey, width: borderSize ?? 1.w),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            ),
          ),
    );
  }
}
