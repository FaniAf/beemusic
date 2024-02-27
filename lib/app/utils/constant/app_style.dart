import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:beemusic/app/utils/constant/app_color.dart';

class ThemeUtils {
  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

class AppStyle {
  //primary
  static TextStyle primaryTextRegulerStyle = GoogleFonts.inter(
    color: AppColor.kPrimaryColor,
  );
  static TextStyle primaryTextRegulerStyle18 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 18);
  static TextStyle primaryTextRegulerStyle20 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 20);
  static TextStyle primaryTextRegulerStyle22 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 22);
  static TextStyle primaryTextRegulerStyle24 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 24);
  static TextStyle primaryTextRegulerStyle26 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 26);
  static TextStyle primaryTextRegulerStyle28 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 28);
  static TextStyle primaryTextRegulerStyle30 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 30);
  static TextStyle primaryTextRegulerStyle32 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 32);
  static TextStyle primaryTextRegulerStyle34 =
      GoogleFonts.inter(color: AppColor.kPrimaryColor, fontSize: 34);
  //light
  static TextStyle primaryTextLightStyle = GoogleFonts.inter(
    color: AppColor.kPrimaryColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle primaryTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 18);
  static TextStyle primaryTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 20);
  static TextStyle primaryTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 22);
  static TextStyle primaryTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 24);
  static TextStyle primaryTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 26);
  static TextStyle primaryTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 28);
  static TextStyle primaryTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 30);
  static TextStyle primaryTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 32);
  static TextStyle primaryTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w200, fontSize: 34);
  //medium

  static TextStyle primaryTextMediumStyle10 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 10);
  static TextStyle primaryTextMediumStyle12 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 12);
  static TextStyle primaryTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kPrimaryColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle primaryTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 18);
  static TextStyle primaryTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 20);
  static TextStyle primaryTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 22);
  static TextStyle primaryTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 24);
  static TextStyle primaryTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 26);
  static TextStyle primaryTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 28);
  static TextStyle primaryTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 30);
  static TextStyle primaryTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 32);
  static TextStyle primaryTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 34);
  //semibold
  static TextStyle primaryTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kPrimaryColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle primaryTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 18);
  static TextStyle primaryTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle primaryTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 22);
  static TextStyle primaryTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 24);
  static TextStyle primaryTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 26);
  static TextStyle primaryTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 28);
  static TextStyle primaryTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 30);
  static TextStyle primaryTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 32);
  static TextStyle primaryTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 34);
  //bold

  static TextStyle primaryTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kPrimaryColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle primaryTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle primaryTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle primaryTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 22);
  static TextStyle primaryTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 24);
  static TextStyle primaryTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 26);
  static TextStyle primaryTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 28);
  static TextStyle primaryTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 30);
  static TextStyle primaryTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 32);
  static TextStyle primaryTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 34);

  //white
  static TextStyle whiteTextRegulerStyle =
      GoogleFonts.inter(color: AppColor.kWhiteColor);

  static TextStyle whiteTextRegulerStyle10 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 10);
  static TextStyle whiteTextRegulerStyle12 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 12);

  static TextStyle whiteTextRegulerStyle14 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 14);
  static TextStyle whiteTextRegulerStyle18 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 18);
  static TextStyle whiteTextRegulerStyle20 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 20);
  static TextStyle whiteTextRegulerStyle22 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 22);
  static TextStyle whiteTextRegulerStyle24 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 24);
  static TextStyle whiteTextRegulerStyle26 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 26);
  static TextStyle whiteTextRegulerStyle28 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 28);
  static TextStyle whiteTextRegulerStyle30 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 30);
  static TextStyle whiteTextRegulerStyle32 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 32);
  static TextStyle whiteTextRegulerStyle34 =
      GoogleFonts.inter(color: AppColor.kWhiteColor, fontSize: 34);
  //light
  static TextStyle whiteTextLightStyle12 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 12);
  static TextStyle whiteTextLightStyle14 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 14);
  static TextStyle whiteTextLightStyle = GoogleFonts.inter(
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle whiteTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 18);
  static TextStyle whiteTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 20);
  static TextStyle whiteTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 22);
  static TextStyle whiteTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 24);
  static TextStyle whiteTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 26);
  static TextStyle whiteTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 28);
  static TextStyle whiteTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 30);
  static TextStyle whiteTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 32);
  static TextStyle whiteTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w200, fontSize: 34);
  //medium
  static TextStyle whiteTextMediumStyle10 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 10);
  static TextStyle whiteTextMediumStyle12 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 12);
  static TextStyle whiteTextMediumStyle14 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14);
  static TextStyle whiteTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle whiteTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 18);
  static TextStyle whiteTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 20);
  static TextStyle whiteTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 22);
  static TextStyle whiteTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 24);
  static TextStyle whiteTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 26);
  static TextStyle whiteTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 28);
  static TextStyle whiteTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 30);
  static TextStyle whiteTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 32);
  static TextStyle whiteTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500, fontSize: 34);
  //semibold
  static TextStyle whiteTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle whiteTextSemiBoldStyle10 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 10);
  static TextStyle whiteTextSemiBoldStyle12 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 12);
  static TextStyle whiteTextSemiBoldStyle14 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 14);
  static TextStyle whiteTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 18);
  static TextStyle whiteTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle whiteTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 22);
  static TextStyle whiteTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 24);
  static TextStyle whiteTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 26);
  static TextStyle whiteTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 28);
  static TextStyle whiteTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 30);
  static TextStyle whiteTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 32);
  static TextStyle whiteTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.w600, fontSize: 34);
  //bold

  static TextStyle whiteTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle whiteTextBoldStyle10 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 10);
  static TextStyle whiteTextBoldStyle12 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 12);
  static TextStyle whiteTextBoldStyle14 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 14);

  static TextStyle whiteTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle whiteTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle whiteTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 22);
  static TextStyle whiteTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 24);
  static TextStyle whiteTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 26);
  static TextStyle whiteTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 28);
  static TextStyle whiteTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 30);
  static TextStyle whiteTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 32);
  static TextStyle whiteTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 34);

  //black
  static TextStyle blackTextRegulerStyle = GoogleFonts.inter(
    color: AppColor.kBlackColor,
  );
  static TextStyle blackTextRegulerStyle10 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 10);
  static TextStyle blackTextRegulerStyle12 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 12);
  static TextStyle blackTextRegulerStyle14 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 14);
  static TextStyle blackTextRegulerStyle18 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 18);
  static TextStyle blackTextRegulerStyle20 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 20);
  static TextStyle blackTextRegulerStyle22 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 22);
  static TextStyle blackTextRegulerStyle24 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 24);
  static TextStyle blackTextRegulerStyle26 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 26);
  static TextStyle blackTextRegulerStyle28 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 28);
  static TextStyle blackTextRegulerStyle30 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 30);
  static TextStyle blackTextRegulerStyle32 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 32);
  static TextStyle blackTextRegulerStyle34 =
      GoogleFonts.inter(color: AppColor.kBlackColor, fontSize: 34);
  //light
  static TextStyle blackTextLightStyle14 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 14);
  static TextStyle blackTextLightStyle = GoogleFonts.inter(
    color: AppColor.kBlackColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle blackTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 18);
  static TextStyle blackTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 20);
  static TextStyle blackTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 22);
  static TextStyle blackTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 24);
  static TextStyle blackTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 26);
  static TextStyle blackTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 28);
  static TextStyle blackTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 30);
  static TextStyle blackTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 32);
  static TextStyle blackTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w200, fontSize: 34);
  //medium
  static TextStyle blackTextMediumStyle10 = GoogleFonts.inter(
    color: AppColor.kBlackColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kBlackColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 18);
  static TextStyle blackTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 20);
  static TextStyle blackTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 22);
  static TextStyle blackTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 24);
  static TextStyle blackTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 26);
  static TextStyle blackTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 28);
  static TextStyle blackTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 30);
  static TextStyle blackTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 32);
  static TextStyle blackTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w500, fontSize: 34);
  //semibold
  static TextStyle blackTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kBlackColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle blackTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 18);
  static TextStyle blackTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle blackTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 22);
  static TextStyle blackTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 24);
  static TextStyle blackTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 26);
  static TextStyle blackTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 28);
  static TextStyle blackTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 30);
  static TextStyle blackTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 32);
  static TextStyle blackTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.w600, fontSize: 34);
  //bold

  static TextStyle blackTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kBlackColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle blackTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle blackTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle blackTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 22);
  static TextStyle blackTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 24);
  static TextStyle blackTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 26);
  static TextStyle blackTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 28);
  static TextStyle blackTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 30);
  static TextStyle blackTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 32);
  static TextStyle blackTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackColor, fontWeight: FontWeight.bold, fontSize: 34);

//greyColor
  static TextStyle greyTextRegulerStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor,
  );
  static TextStyle greyTextRegulerStyle10 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 10);
  static TextStyle greyTextRegulerStyle12 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 12);
  static TextStyle greyTextRegulerStyle14 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 14);
  static TextStyle greyTextRegulerStyle18 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 18);
  static TextStyle greyTextRegulerStyle20 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 20);
  static TextStyle greyTextRegulerStyle22 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 22);
  static TextStyle greyTextRegulerStyle24 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 24);
  static TextStyle greyTextRegulerStyle26 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 26);
  static TextStyle greyTextRegulerStyle28 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 28);
  static TextStyle greyTextRegulerStyle30 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 30);
  static TextStyle greyTextRegulerStyle32 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 32);
  static TextStyle greyTextRegulerStyle34 =
      GoogleFonts.inter(color: AppColor.kGreyColor, fontSize: 34);
  //light
  static TextStyle greyTextLightStyle14 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 14);
  static TextStyle greyTextLightStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle greyTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 18);
  static TextStyle greyTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 20);
  static TextStyle greyTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 22);
  static TextStyle greyTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 24);
  static TextStyle greyTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 26);
  static TextStyle greyTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 28);
  static TextStyle greyTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 30);
  static TextStyle greyTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 32);
  static TextStyle greyTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w200, fontSize: 34);
  //medium
  static TextStyle greyTextMediumStyle10 = GoogleFonts.inter(
    color: AppColor.kGreyColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greyTextMediumStyleItalic10 = GoogleFonts.inter(
    color: AppColor.kGreyColor,
    fontSize: 10,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greyTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greyTextMediumStyle12 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 12);
  static TextStyle greyTextMediumStyle14 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 14);
  static TextStyle greyTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 18);
  static TextStyle greyTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 20);
  static TextStyle greyTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 22);
  static TextStyle greyTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 24);
  static TextStyle greyTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 26);
  static TextStyle greyTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 28);
  static TextStyle greyTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 30);
  static TextStyle greyTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 32);
  static TextStyle greyTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w500, fontSize: 34);
  //semibold
  static TextStyle greyTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle greyTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 18);
  static TextStyle greyTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle greyTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 22);
  static TextStyle greyTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 24);
  static TextStyle greyTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 26);
  static TextStyle greyTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 28);
  static TextStyle greyTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 30);
  static TextStyle greyTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 32);
  static TextStyle greyTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.w600, fontSize: 34);
  //bold

  static TextStyle greyTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle greyTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle greyTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle greyTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 22);
  static TextStyle greyTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 24);
  static TextStyle greyTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 26);
  static TextStyle greyTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 28);
  static TextStyle greyTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 30);
  static TextStyle greyTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 32);
  static TextStyle greyTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor, fontWeight: FontWeight.bold, fontSize: 34);

//greyColor with Opacity 0.5
  static TextStyle greyTextWithOpacity50RegulerStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor.withOpacity(0.5),
  );
  static TextStyle greyTextWithOpacity50RegulerStyle10 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 10);
  static TextStyle greyTextWithOpacity50RegulerStyle12 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 12);
  static TextStyle greyTextWithOpacity50RegulerStyle14 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 14);
  static TextStyle greyTextWithOpacity50RegulerStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 18);
  static TextStyle greyTextWithOpacity50RegulerStyle16 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 18);
  static TextStyle greyTextWithOpacity50RegulerStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 20);
  static TextStyle greyTextWithOpacity50RegulerStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 22);
  static TextStyle greyTextWithOpacity50RegulerStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 24);
  static TextStyle greyTextWithOpacity50RegulerStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 26);
  static TextStyle greyTextWithOpacity50RegulerStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 28);
  static TextStyle greyTextWithOpacity50RegulerStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 30);
  static TextStyle greyTextWithOpacity50RegulerStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 32);
  static TextStyle greyTextWithOpacity50RegulerStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5), fontSize: 34);
  //light
  static TextStyle greyTextWithOpacity50LightStyle14 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 14);
  static TextStyle greyTextWithOpacity50LightStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor.withOpacity(0.5),
    fontWeight: FontWeight.w200,
  );
  static TextStyle greyTextWithOpacity50LightStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 18);
  static TextStyle greyTextWithOpacity50LightStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 20);
  static TextStyle greyTextWithOpacity50LightStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 22);
  static TextStyle greyTextWithOpacity50LightStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 24);
  static TextStyle greyTextWithOpacity50LightStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 26);
  static TextStyle greyTextWithOpacity50LightStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 28);
  static TextStyle greyTextWithOpacity50LightStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 30);
  static TextStyle greyTextWithOpacity50LightStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 32);
  static TextStyle greyTextWithOpacity50LightStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w200,
      fontSize: 34);
  //medium
  static TextStyle greyTextWithOpacity50MediumStyle10 = GoogleFonts.inter(
    color: AppColor.kGreyColor.withOpacity(0.5),
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greyTextWithOpacity50MediumStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor.withOpacity(0.5),
    fontWeight: FontWeight.w500,
  );
  static TextStyle greyTextWithOpacity50MediumStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 18);
  static TextStyle greyTextWithOpacity50MediumStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 20);
  static TextStyle greyTextWithOpacity50MediumStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 22);
  static TextStyle greyTextWithOpacity50MediumStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 24);
  static TextStyle greyTextWithOpacity50MediumStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 26);
  static TextStyle greyTextWithOpacity50MediumStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 28);
  static TextStyle greyTextWithOpacity50MediumStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 30);
  static TextStyle greyTextWithOpacity50MediumStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 32);
  static TextStyle greyTextWithOpacity50MediumStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 34);
  //semibold
  static TextStyle greyTextWithOpacity50SemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor.withOpacity(0.5),
    fontWeight: FontWeight.w600,
  );
  static TextStyle greyTextWithOpacity50SemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 18);
  static TextStyle greyTextWithOpacity50SemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 20);
  static TextStyle greyTextWithOpacity50SemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 22);
  static TextStyle greyTextWithOpacity50SemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 24);
  static TextStyle greyTextWithOpacity50SemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 26);
  static TextStyle greyTextWithOpacity50SemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 28);
  static TextStyle greyTextWithOpacity50SemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 30);
  static TextStyle greyTextWithOpacity50SemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 32);
  static TextStyle greyTextWithOpacity50SemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 34);
  //bold

  static TextStyle greyTextWithOpacity50BoldStyle = GoogleFonts.inter(
    color: AppColor.kGreyColor.withOpacity(0.5),
    fontWeight: FontWeight.bold,
  );
  static TextStyle greyTextWithOpacity50BoldStyle18 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 18);
  static TextStyle greyTextWithOpacity50BoldStyle20 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 20);
  static TextStyle greyTextWithOpacity50BoldStyle22 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 22);
  static TextStyle greyTextWithOpacity50BoldStyle24 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 24);
  static TextStyle greyTextWithOpacity50BoldStyle26 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 26);
  static TextStyle greyTextWithOpacity50BoldStyle28 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 28);
  static TextStyle greyTextWithOpacity50BoldStyle30 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 30);
  static TextStyle greyTextWithOpacity50BoldStyle32 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 32);
  static TextStyle greyTextWithOpacity50BoldStyle34 = GoogleFonts.inter(
      color: AppColor.kGreyColor.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 34);

  //orange
  static TextStyle orangeTextRegulerStyle = GoogleFonts.inter(
    color: AppColor.kOrangeMosWaitTranferColor,
  );

  static TextStyle orangeTextRegulerStyle12 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 12);

  static TextStyle orangeTextRegulerStyle14 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 14);
  static TextStyle orangeTextRegulerStyle18 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 18);
  static TextStyle orangeTextRegulerStyle20 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 20);
  static TextStyle orangeTextRegulerStyle22 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 22);
  static TextStyle orangeTextRegulerStyle24 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 24);
  static TextStyle orangeTextRegulerStyle26 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 26);
  static TextStyle orangeTextRegulerStyle28 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 28);
  static TextStyle orangeTextRegulerStyle30 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 30);
  static TextStyle orangeTextRegulerStyle32 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 32);
  static TextStyle orangeTextRegulerStyle34 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor, fontSize: 34);
  //light
  static TextStyle orangeTextLightStyle14 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 14);
  static TextStyle orangeTextLightStyle = GoogleFonts.inter(
    color: AppColor.kOrangeMosWaitTranferColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle orangeTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 18);
  static TextStyle orangeTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 20);
  static TextStyle orangeTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 22);
  static TextStyle orangeTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 24);
  static TextStyle orangeTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 26);
  static TextStyle orangeTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 28);
  static TextStyle orangeTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 30);
  static TextStyle orangeTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 32);
  static TextStyle orangeTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w200,
      fontSize: 34);
  //medium
  static TextStyle orangeTextMediumStyle10 = GoogleFonts.inter(
    color: AppColor.kOrangeMosWaitTranferColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle orangeTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kOrangeMosWaitTranferColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle orangeTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 18);
  static TextStyle orangeTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 20);
  static TextStyle orangeTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 22);
  static TextStyle orangeTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 24);
  static TextStyle orangeTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 26);
  static TextStyle orangeTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 28);
  static TextStyle orangeTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 30);
  static TextStyle orangeTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 32);
  static TextStyle orangeTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w500,
      fontSize: 34);
  //semibold
  static TextStyle orangeTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kOrangeMosWaitTranferColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle orangeTextSemiBoldStyle12 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 12);
  static TextStyle orangeTextSemiBoldStyle14 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 14);
  static TextStyle orangeTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 18);
  static TextStyle orangeTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 20);
  static TextStyle orangeTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 22);
  static TextStyle orangeTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 24);
  static TextStyle orangeTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 26);
  static TextStyle orangeTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 28);
  static TextStyle orangeTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 30);
  static TextStyle orangeTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 32);
  static TextStyle orangeTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.w600,
      fontSize: 34);
  //bold

  static TextStyle orangeTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kOrangeMosWaitTranferColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle orangeTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 18);
  static TextStyle orangeTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 20);
  static TextStyle orangeTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 22);
  static TextStyle orangeTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 24);
  static TextStyle orangeTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 26);
  static TextStyle orangeTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 28);
  static TextStyle orangeTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 30);
  static TextStyle orangeTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 32);
  static TextStyle orangeTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kOrangeMosWaitTranferColor,
      fontWeight: FontWeight.bold,
      fontSize: 34);

//redColor
  static TextStyle redTextRegulerStyle = GoogleFonts.inter(
    color: AppColor.kRedMosColor,
  );

  static TextStyle redTextRegulerStyle12 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 12);

  static TextStyle redTextRegulerStyle14 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 14);
  static TextStyle redTextRegulerStyle18 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 18);
  static TextStyle redTextRegulerStyle20 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 20);
  static TextStyle redTextRegulerStyle22 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 22);
  static TextStyle redTextRegulerStyle24 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 24);
  static TextStyle redTextRegulerStyle26 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 26);
  static TextStyle redTextRegulerStyle28 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 28);
  static TextStyle redTextRegulerStyle30 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 30);
  static TextStyle redTextRegulerStyle32 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 32);
  static TextStyle redTextRegulerStyle34 =
      GoogleFonts.inter(color: AppColor.kRedMosColor, fontSize: 34);
  //light
  static TextStyle redTextLightStyle14 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 14);
  static TextStyle redTextLightStyle = GoogleFonts.inter(
    color: AppColor.kRedMosColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle redTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 18);
  static TextStyle redTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 20);
  static TextStyle redTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 22);
  static TextStyle redTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 24);
  static TextStyle redTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 26);
  static TextStyle redTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 28);
  static TextStyle redTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 30);
  static TextStyle redTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 32);
  static TextStyle redTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w200, fontSize: 34);
  //medium
  static TextStyle redTextMediumStyle10 = GoogleFonts.inter(
    color: AppColor.kRedMosColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle redTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kRedMosColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle redTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 18);
  static TextStyle redTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 20);
  static TextStyle redTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 22);
  static TextStyle redTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 24);
  static TextStyle redTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 26);
  static TextStyle redTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 28);
  static TextStyle redTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 30);
  static TextStyle redTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 32);
  static TextStyle redTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w500, fontSize: 34);
  //semibold
  static TextStyle redTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kRedMosColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle redTextSemiBoldStyle12 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 12);
  static TextStyle redTextSemiBoldStyle14 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 14);
  static TextStyle redTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 18);
  static TextStyle redTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle redTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 22);
  static TextStyle redTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 24);
  static TextStyle redTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 26);
  static TextStyle redTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 28);
  static TextStyle redTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 30);
  static TextStyle redTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 32);
  static TextStyle redTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.w600, fontSize: 34);
  //bold

  static TextStyle redTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kRedMosColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle redTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle redTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle redTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 22);
  static TextStyle redTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 24);
  static TextStyle redTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 26);
  static TextStyle redTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 28);
  static TextStyle redTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 30);
  static TextStyle redTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 32);
  static TextStyle redTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kRedMosColor, fontWeight: FontWeight.bold, fontSize: 34);

//green
  static TextStyle greenTextRegulerStyle = GoogleFonts.inter(
    color: AppColor.kGreenMosColor,
  );
  static TextStyle greenTextRegulerStyle12 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 12);
  static TextStyle greenTextRegulerStyle14 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 14);
  static TextStyle greenTextRegulerStyle18 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 18);
  static TextStyle greenTextRegulerStyle20 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 20);
  static TextStyle greenTextRegulerStyle22 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 22);
  static TextStyle greenTextRegulerStyle24 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 24);
  static TextStyle greenTextRegulerStyle26 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 26);
  static TextStyle greenTextRegulerStyle28 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 28);
  static TextStyle greenTextRegulerStyle30 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 30);
  static TextStyle greenTextRegulerStyle32 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 32);
  static TextStyle greenTextRegulerStyle34 =
      GoogleFonts.inter(color: AppColor.kGreenMosColor, fontSize: 34);
  //light
  static TextStyle greenTextLightStyle14 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 14);
  static TextStyle greenTextLightStyle = GoogleFonts.inter(
    color: AppColor.kGreenMosColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle greenTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 18);
  static TextStyle greenTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 20);
  static TextStyle greenTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 22);
  static TextStyle greenTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 24);
  static TextStyle greenTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 26);
  static TextStyle greenTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 28);
  static TextStyle greenTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 30);
  static TextStyle greenTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 32);
  static TextStyle greenTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w200,
      fontSize: 34);
  //medium
  static TextStyle greenTextMediumStyle10 = GoogleFonts.inter(
    color: AppColor.kGreenMosColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greenTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kGreenMosColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greenTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 18);
  static TextStyle greenTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 20);
  static TextStyle greenTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 22);
  static TextStyle greenTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 24);
  static TextStyle greenTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 26);
  static TextStyle greenTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 28);
  static TextStyle greenTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 30);
  static TextStyle greenTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 32);
  static TextStyle greenTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w500,
      fontSize: 34);
  //semibold
  static TextStyle greenTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kGreenMosColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle greenTextSemiBoldStyle12 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 12);
  static TextStyle greenTextSemiBoldStyle14 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 14);
  static TextStyle greenTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 18);
  static TextStyle greenTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 20);
  static TextStyle greenTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 22);
  static TextStyle greenTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 24);
  static TextStyle greenTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 26);
  static TextStyle greenTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 28);
  static TextStyle greenTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 30);
  static TextStyle greenTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 32);
  static TextStyle greenTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.w600,
      fontSize: 34);
  //bold

  static TextStyle greenTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kGreenMosColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle greenTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 18);
  static TextStyle greenTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 20);
  static TextStyle greenTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 22);
  static TextStyle greenTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 24);
  static TextStyle greenTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 26);
  static TextStyle greenTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 28);
  static TextStyle greenTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 30);
  static TextStyle greenTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 32);
  static TextStyle greenTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kGreenMosColor,
      fontWeight: FontWeight.bold,
      fontSize: 34);

  //black
  static TextStyle blackMosTextRegulerStyle = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
  );
  static TextStyle blackMosTextRegulerStyle10 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 10);
  static TextStyle blackMosTextRegulerStyle12 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 12);
  static TextStyle blackMosTextRegulerStyle14 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 14);
  static TextStyle blackMosTextRegulerStyle18 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 18);
  static TextStyle blackMosTextRegulerStyle20 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 20);
  static TextStyle blackMosTextRegulerStyle22 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 22);
  static TextStyle blackMosTextRegulerStyle24 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 24);
  static TextStyle blackMosTextRegulerStyle26 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 26);
  static TextStyle blackMosTextRegulerStyle28 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 28);
  static TextStyle blackMosTextRegulerStyle30 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 30);
  static TextStyle blackMosTextRegulerStyle32 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 32);
  static TextStyle blackMosTextRegulerStyle34 =
      GoogleFonts.inter(color: AppColor.kBlackTextColor, fontSize: 34);
  //light
  static TextStyle blackMosTextLightStyle14 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 14);
  static TextStyle blackMosTextLightStyle = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle blackMosTextLightStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 18);
  static TextStyle blackMosTextLightStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 20);
  static TextStyle blackMosTextLightStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 22);
  static TextStyle blackMosTextLightStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 24);
  static TextStyle blackMosTextLightStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 26);
  static TextStyle blackMosTextLightStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 28);
  static TextStyle blackMosTextLightStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 30);
  static TextStyle blackMosTextLightStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 32);
  static TextStyle blackMosTextLightStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w200,
      fontSize: 34);
  //medium
  static TextStyle blackMosTextMediumStyle10 = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackMosTextMediumItalicStyle10 = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontSize: 10,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackMosTextMediumStyle12 = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackMosTextMediumStyle14 = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackMosTextMediumStyle = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackMosTextMediumStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 18);
  static TextStyle blackMosTextMediumStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 20);
  static TextStyle blackMosTextMediumStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 22);
  static TextStyle blackMosTextMediumStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 24);
  static TextStyle blackMosTextMediumStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 26);
  static TextStyle blackMosTextMediumStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 28);
  static TextStyle blackMosTextMediumStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 30);
  static TextStyle blackMosTextMediumStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 32);
  static TextStyle blackMosTextMediumStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 34);
  //semibold
  static TextStyle blackMosTextSemiBoldStyle = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle blackMosTextSemiBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 18);
  static TextStyle blackMosTextSemiBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 20);
  static TextStyle blackMosTextSemiBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 22);
  static TextStyle blackMosTextSemiBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 24);
  static TextStyle blackMosTextSemiBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 26);
  static TextStyle blackMosTextSemiBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 28);
  static TextStyle blackMosTextSemiBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 30);
  static TextStyle blackMosTextSemiBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 32);
  static TextStyle blackMosTextSemiBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 34);
  //bold
  static TextStyle blackMosTextBoldStyle12 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 12);
  static TextStyle blackMosTextBoldStyle14 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 14);
  static TextStyle blackMosTextBoldStyle = GoogleFonts.inter(
    color: AppColor.kBlackTextColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle blackMosTextBoldStyle18 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 18);
  static TextStyle blackMosTextBoldStyle20 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 20);
  static TextStyle blackMosTextBoldStyle22 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 22);
  static TextStyle blackMosTextBoldStyle24 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 24);
  static TextStyle blackMosTextBoldStyle26 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 26);
  static TextStyle blackMosTextBoldStyle28 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 28);
  static TextStyle blackMosTextBoldStyle30 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 30);
  static TextStyle blackMosTextBoldStyle32 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 32);
  static TextStyle blackMosTextBoldStyle34 = GoogleFonts.inter(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 34);

  static TextStyle whiteTextBoldStyleCairo22 = GoogleFonts.cairo(
      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 22);
  static TextStyle blackMosTextBoldStyleCairo22 = GoogleFonts.cairo(
      color: AppColor.kBlackTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 22);
}
