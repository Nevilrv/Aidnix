import 'package:aidnix/Constant/app_color.dart';
import 'package:aidnix/Utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      cursorColor: AppColors.blackColor,
      onChanged: onChanged,
      keyboardType: textInputType,
      textInputAction: TextInputAction.search,
      style: textStyleBlackH15W500,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: textStyleGreyH16W400,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.redColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
                BorderSide(color: AppColors.greyColor.withOpacity(0.6))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.greyColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.redColor)),
      ),
    );
  }
}

/// AppSearch Bar
class AppSearchBar extends StatelessWidget {
  final String hintText;
  final bool? readOnly;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const AppSearchBar({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.readOnly = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        readOnly: readOnly!,
        controller: controller,
        cursorColor: AppColors.blackColor,
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        style: textStyleBlackH15W500,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            bottom: 10,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: textStyleGreyH16W400,
          prefixIcon: prefixIcon ??
              const Icon(CupertinoIcons.search,
                  color: AppColors.black45, size: 22),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
