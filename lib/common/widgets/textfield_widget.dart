import 'package:firebasetask/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final String? labelText;
  final double? labelFontSize;
  final Color? labelColor;
  final TextEditingController? controller;

  // final Function(String?)? onSaved; ////
  final bool? obscureText;
  final TextInputType? textInputType;
  final Color? fillColor;
  final Color? borderColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fborderColor;
  final int? maxLine;
  final int? minLine;
  final Widget? prefixIcon;
  final int? maxCharacters;
  final Function(String)? onChange;
  final bool? readOnly;
  final Function()? onTap;
  final Widget? suffix;
  final TextStyle? suffixStyle;
  final Widget? suffixIcon;
  final BorderRadius? eBorderRadius;
  final BorderRadius? fBorderRadius;

  const TextFormFieldWidget({
    this.validator,
    this.suffix,
    this.suffixStyle,
    this.textInputAction,
    this.textStyle,
    this.labelText,
    this.labelFontSize,
    this.labelColor,
    this.controller,
    // this.onSaved,
    this.obscureText,
    this.textInputType,
    this.fillColor,
    this.borderColor,
    this.hintText,
    this.hintStyle,
    this.fborderColor,
    this.maxLine,
    this.minLine,
    this.prefixIcon,
    this.labelTextStyle,
    this.onChange,
    this.maxCharacters,
    this.readOnly,
    this.onTap,
    this.suffixIcon,
    this.eBorderRadius,
    this.fBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChange,
      validator: validator!,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: textStyle,
      readOnly: readOnly ?? false,
      maxLength: maxCharacters,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: fillColor,
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle,
          labelText: labelText,
          labelStyle: labelTextStyle,
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
          suffixStyle: suffixStyle,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? UIColors.lightGray, width: 0.0),
            borderRadius: eBorderRadius ?? BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: fborderColor ?? UIColors.lightGray, width: 0.0),
              borderRadius: fBorderRadius ?? BorderRadius.circular(0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent, width: 0.0),
              borderRadius: fBorderRadius ?? BorderRadius.circular(0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent, width: 0.0),
              borderRadius: fBorderRadius ?? BorderRadius.circular(0))),
      controller: controller,
      // onSaved: onSaved,
    );
  }
}
