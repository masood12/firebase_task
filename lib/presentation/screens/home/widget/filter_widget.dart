import 'package:firebasetask/core/utils/colors.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  String? filterName;
  FilterWidget({Key? key, this.filterName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: UIColors.lightGray, borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(filterName!),
      ),
    );
  }
}
