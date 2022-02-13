import 'package:firebasetask/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

void snackBarError({String? msg, GlobalKey<ScaffoldState>? scaffoldState}) {
  scaffoldState!.currentState!.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            "$msg",
            style: StyleText.mediumWhite14,
            overflow: TextOverflow.ellipsis,
          )),
          const Icon(
            Icons.error,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}
