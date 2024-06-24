import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  //Yellow
  static const Color yellowFF225229 = Color.fromRGBO(255, 229, 91, 1.0);

  //Grey
  static const Color greyFF801E8E01 = Color(0x801E8E01);
  static const Color greyFF4B585E = Color(0xFF4B585E);
  static const Color greyFFE4E4E4 = Color(0xFFE4E4E4);
  static const Color greyFFEEEEEE = Color(0xFFEEEEEE);
  static const Color greyFF7D8589 = Color(0xFF7D8589);
  static const Color greyFF5C6164 = Color(0xFF5C6164);
  static const Color greyFFEAE2D8 = Color(0xFFEAE2D8);
  static const Color greyFFD2D8D7 = Color(0xFFD2D8D7);
  static const Color greyFF9AA9A6 = Color(0xFF9AA9A6);
  static const Color greyFFB8C2C0 = Color(0xFFB8C2C0);
  static const Color greyFF607571 = Color(0xFF607571);
  static const Color greyFFEAEDEC = Color(0xFFEAEDEC);
  static const Color greyFFC8C8C8 = Color(0xFFC8C8C8);

  //Green
  static const Color greenFF26946F = Color(0xFF26946F);
  static const Color greenFF20B858 = Color(0xFF20B858);
  static const Color greenFF54D9AC = Color(0xFF54D9AC);
  static const Color greenFF11612E = Color(0xFF11612E);
  static const Color greenFF018E01 = Color(0xFF018E01);
  static const Color greenFF2DB184 = Color(0xFF2DB184);
  static const Color greenFF208E69 = Color(0xFF208E69);
  static const Color greenFFA9E9D3 = Color(0xFFA9E9D3);
  static const Color greenFF57B98F = Color(0xFF57B98F);
  static const Color greenFF2B9873 = Color(0xFF2B9873);
  static const Color greenFF24A076 = Color(0xFF24A076);
  static const Color greenFF228463 = Color(0xFF228463);

  //Red
  static const Color redFFF20606 = Color(0xfff20606);
  static const Color redFFF45757 = Color(0xFFF45757);
  static const Color redFFDB4139 = Color(0xFFDB4139);
  static const Color redFFEDA09C = Color(0xFFEDA09C);
  static const Color redFFFBECEB = Color(0xFFFBECEB);
  static const Color redFF4B2F02 = Color(0xFF4B2F02);

  //Blue
  static const Color blueFF007AFF = Color(0xFF007AFF);
  static const Color blueFFB4E5FD = Color(0xFFB4E5FD);
  static const Color blueFF003F5F = Color(0xFF003F5F);
  static const Color blueFFF5FBFF = Color(0xFFF5FBFF);
  static const Color blueFF007EBD = Color(0xFF007EBD);

  //Brown
  static const Color brownFFD2BFAE = Color(0xFFD2BFAE);
  static const Color brownFFFFF9F2 = Color(0xFFFFF9F2);
  static const Color brownFF54412F = Color(0xFF54412F);
  static const Color brownFF6F563E = Color(0xFF6F563E);
  static const Color brownFFF1E8DA = Color(0xFFF1E8DA);

  //Yellow
  static const Color yellowFFFAA61A = Color(0xFFFAA61A);
  static const Color yellowFFFEF0D9 = Color(0xFFFEF0D9);
  static const Color yellowFF4B2F02 = Color(0xFF4B2F02);

  //Orange
  static const Color orangeFFED870E = Color(0xFFED870E);
  static const Color orangeFFFF9972 = Color(0xFFFF9972);

  //Purple
  static const Color purpleFF95507E = Color(0xFF95507E);
  static const Color purpleFF903571 = Color(0xFF903571);
}

extension CustomColorSchemeX on ColorScheme {
  Color get yellowFF225229 => AppColors.yellowFF225229;
  Color get greenFF57B98F => AppColors.greenFF57B98F;
  Color get brown6F563E => AppColors.brownFF6F563E;
  Color get greenFF228463 => AppColors.greenFF228463;
  Color get greenFF2DB184 => AppColors.greenFF2DB184;
  Color get greenFF018E01 => AppColors.greenFF018E01;
  Color get purpleFF903571 => AppColors.purpleFF903571;
  Color get greenFF2B9873 => AppColors.greenFF2B9873;
  Color get greenFF20B858 => AppColors.greenFF20B858;

  Color get greenFF208E69 => AppColors.greenFF208E69;
  Color get primaryWhite => AppColors.white;
  Color get transparent => AppColors.transparent;

  Color get primaryBlack => AppColors.black;
  Color get brownFFD2BFAE => AppColors.brownFFD2BFAE;
  Color get greyFFB8C2C0 => AppColors.greyFFB8C2C0;
  Color get greyFFEAE2D8 => AppColors.greyFFEAE2D8;
  Color get yellowFFFAA61A => AppColors.yellowFFFAA61A;
  Color get greyFF5C6164 => AppColors.greyFF5C6164;
  Color get greyFFE4E4E4 => AppColors.greyFFE4E4E4;
  Color get redFFFFF20606 => AppColors.redFFF20606;
  Color get redFFF45757 => AppColors.redFFF45757;
  Color get redFFDB4139 => AppColors.redFFDB4139;
  Color get grey4B585E => AppColors.greyFFE4E4E4;
  Color get greyFF7D8589 => AppColors.greyFF7D8589;
  Color get purpleFF95507E => AppColors.purpleFF95507E;
  Color get greenFFA9E9D3 => AppColors.greenFFA9E9D3;
  Color get green26946F => AppColors.greenFF26946F;
  Color get orangeFF99725 => AppColors.orangeFFFF9972;
  Color get greyFFD2D8D7 => AppColors.greyFFD2D8D7;
  Color get greyFF9AA9A6 => AppColors.greyFF9AA9A6;
  Color get greyFFC8C8C8 => AppColors.greyFFC8C8C8;
  Color get greenFF24A076 => AppColors.greenFF24A076;
  Color get orangeFFED870E => AppColors.orangeFFED870E;
  Color get blueFF007EBD => AppColors.blueFF007EBD;
  Color get brownFFF1E8DA => AppColors.brownFFF1E8DA;
  Color get greyFFEAEDEC => AppColors.greyFFEAEDEC;
  Color? get smallBoxColor12 =>
      brightness == Brightness.light ? Colors.blue : Colors.grey[400];
}

class AppFontFamily {
  static const String dmSans = 'DMSans';
  static const String dmSansThin = 'DMSansThin';
  static const String dmSansRegular = 'DMSansRegular';
  static const String bellfort = 'Bellfort';
  static const String blogScript = 'BlogScript';
  static const String roboto = 'Roboto';
}
