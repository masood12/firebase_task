import 'package:firebasetask/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(UIColors.primaryColor),
      ),
    );
  }
}
