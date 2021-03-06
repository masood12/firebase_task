import 'package:firebasetask/core/utils/app_text_styles.dart';
import 'package:firebasetask/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebasetask/core/utils/sizes.dart';

class FilterWidget extends StatelessWidget {
  String? filterName;
  final Function()? onFilterPressed;
  FilterWidget({Key? key, this.filterName,this.onFilterPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterPressed,
      child: Container(

        height: 32.flexibleHeight,
        decoration: BoxDecoration(
          border: Border.all(color: UIColors.primaryColor),
            color: UIColors.white, borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(filterName!,style: StyleText.mediumDarkGray14,),
        ),
      ),
    );
  }
}
