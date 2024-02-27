import 'package:beemusic/app/utils/constant/app_style.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppStyle.whiteTextMediumStyle,
      ),
    ),
  );
}
