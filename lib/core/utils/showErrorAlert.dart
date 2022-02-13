import 'package:firebasetask/core/utils/adaptive_alert_dialog.dart';
import 'package:flutter/material.dart';

class ShowErrorAlert {
  static showAdaptiveDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AdaptiveAlertDialog(message: message);
        });
  }
}
