import 'package:firebasetask/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? btnText;
  final EdgeInsetsGeometry? padding;
  final Function()? btnClick;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;
  final Color? btnColor;
  final Color? borderColor;

  const ButtonWidget({
    this.btnText,
    this.btnClick,
    this.elevation,
    this.textStyle,
    this.borderRadius,
    this.padding,
    this.btnColor = UIColors.primaryColor,
    this.borderColor = UIColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: padding,
          elevation: elevation ?? 0,
          primary: btnColor,
          // background
          onPrimary: UIColors.lightGray,
          // foreground
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor!),
            borderRadius: borderRadius ?? BorderRadius.circular(0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            btnText ?? "",
            style: textStyle,
          ),
        ],
      ),
      onPressed: btnClick!,
    );
  }
}
