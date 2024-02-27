import 'package:flutter/material.dart';

class AppColor {
  static Color kPrimaryColor = const Color(0xFFfcb900);
  static Color kSecondaryColor = const Color.fromARGB(200, 252, 185, 0);
  static Color kGreyMosColor = const Color(0xFFD9D9D9);
  static Color kGreyMosLightColor = const Color(0xFFEFF3F5);
  static Color kBlackMosColor = const Color(0xFF0E0F0F);
  static Color kBlackTextColor = const Color(0xFF231f20);
  static Color kGreenMosColor = const Color(0xFF2BA118);
  static Color kRedMosColor = const Color(0xFFBD1730);
  static Color kGreyTextMosColor = const Color(0xFF686868);
  static Color kOrangeMosColor = const Color(0xFFF95A0B);
  static Color kOrangeMosWaitTranferColor = const Color(0xFFF76535);
  static Color kOrangeMosFollowColor = const Color(0xFFfd7e14);
  static Color kBlackColor = Colors.black;
  static Color kWhiteColor = Colors.white;
  static Color kGreyColor = Colors.grey;
  static Color kGreenColor = Colors.green;
  static Color kRedColor = Colors.red;
  static Color kTransparentColor = Colors.transparent;
  static Color kTransparentColorEdit = const Color.fromARGB(100, 22, 44, 33);
}

Color getBackgroundColor(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark
      ? AppColor.kBlackColor
      : AppColor.kWhiteColor;
}

Color getBackgroundColorMain(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark
      ? AppColor.kBlackMosColor
      : AppColor.kWhiteColor;
}
