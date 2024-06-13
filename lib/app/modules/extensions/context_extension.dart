import 'package:comparotto/app/modules/extensions/app_theme.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;
}

extension CustomTextThemeX on TextTheme {
  TextStyle get _mediumText => const TextStyle(fontSize: 18.0);
  TextStyle get _smallText => const TextStyle(fontSize: 13.0);
  TextStyle get _small14Text => const TextStyle(fontSize: 14.0);
  TextStyle get _large24Text => const TextStyle(fontSize: 24.0);
  TextStyle get _largeText => const TextStyle(fontSize: 30.0);

  TextStyle get mediumWhiteTextStyle => _mediumText.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      );
  TextStyle get mediumGreenTextStyle => _mediumText.copyWith(
        color: AppColors.greenFF018E01,
        fontWeight: FontWeight.w500,
      );
  TextStyle get small14WhiteTextStyle => _small14Text.copyWith(
      color: AppColors.black.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get small18BlackTextStyle => smallBlackTextStyle.copyWith(
      fontFamily: AppFontFamily.dmSansRegular,
      color: AppColors.black,
      fontSize: 18,
      fontWeight: FontWeight.normal);
  TextStyle get small24BlackTextStyle => _large24Text.copyWith(
      fontFamily: AppFontFamily.dmSansRegular,
      color: AppColors.black,
      fontSize: 18,
      fontWeight: FontWeight.normal);
  TextStyle get small14TextStyle => _small14Text.copyWith(
      color: AppColors.white,
      fontWeight: FontWeight.w700,
      fontFamily: AppFontFamily.dmSans);
  TextStyle get large24WhiteTextStyle => _large24Text.copyWith(
      color: AppColors.white,
      fontWeight: FontWeight.w700,
      fontFamily: AppFontFamily.dmSans);
  TextStyle get largeWhiteTextStyle => _largeText.copyWith(
      color: AppColors.white,
      fontWeight: FontWeight.w700,
      fontFamily: AppFontFamily.dmSans);
  TextStyle get mediumGreyTextStyle => _mediumText.copyWith(
      color: AppColors.greyFF4B585E,
      fontWeight: FontWeight.w400,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get smallGreyRegularTextStyle => _smallText.copyWith(
      color: AppColors.greyFF4B585E,
      fontWeight: FontWeight.w400,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get largeGreenTextStyle => _largeText.copyWith(
        height: 0,
        fontSize: 30,
        fontFamily: AppFontFamily.dmSansRegular,
        color: const Color(0xFF036A33),
        fontWeight: FontWeight.w600,
      );
  TextStyle get mediumGreenDmSansRegularTextStyle =>
      large24WhiteTextStyle.copyWith(
        height: 0,
        fontFamily: AppFontFamily.dmSansRegular,
        color: const Color(0xFF036A33),
        fontWeight: FontWeight.w600,
      );
  TextStyle get largeOrangeTextStyle => _largeText.copyWith(
      color: const Color.fromARGB(255, 235, 99, 0),
      height: 0,
      fontWeight: FontWeight.w700,
      fontFamily: AppFontFamily.dmSans);
  TextStyle get smallGreenTextStyle => _smallText.copyWith(
      color: AppColors.greenFF018E01,
      height: 0,
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get smallGreyTextStyle => _smallText.copyWith(
        color: const Color.fromARGB(255, 151, 157, 159),
        height: 0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFontFamily.dmSansRegular,
      );
  TextStyle get small14GreyTextStyle => _small14Text.copyWith(
      color: const Color.fromARGB(255, 112, 112, 112),
      height: 0,
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.dmSans);
  TextStyle get mediumBlackTextStyle => _mediumText.copyWith(
      color: AppColors.black,
      height: 0,
      fontWeight: FontWeight.w300,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get smallBlackTextStyle => _smallText.copyWith(
        color: AppColors.black,
        height: 0,
        fontFamily: AppFontFamily.dmSans,
        fontWeight: FontWeight.w500,
      );
  TextStyle get smallBlackRegularTextStyle => _smallText.copyWith(
        color: AppColors.black,
        height: 0,
        fontFamily: AppFontFamily.dmSansRegular,
        fontWeight: FontWeight.w500,
      );
  TextStyle get smallWhiteTextStyle => _smallText.copyWith(
        color: AppColors.white,
        fontFamily: AppFontFamily.dmSans,
        height: 0,
        fontWeight: FontWeight.w500,
      );
  TextStyle get mediumRedTextStyle => _mediumText.copyWith(
        color: Colors.red,
        fontFamily: AppFontFamily.dmSans,
        height: 0,
        fontWeight: FontWeight.w500,
      );
}

extension StringExt on String {
  String get numbersOnly => replaceAll(RegExp(r'[^0-9]'), '');
  String get convertPoint => replaceAll('.', ',');

  String get formattedTaxVat {
    final taxVatRegex = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');
    return numbersOnly.replaceFirstMapped(taxVatRegex,
        (match) => '${match[1]}.${match[2]}.${match[3]}-${match[4]}');
  }

  String get formattedCellphone {
    final cellphoneRegex = RegExp(r'^(\d{2})(\d{1})(\d{4})(\d{4})$');
    return replaceFirstMapped(cellphoneRegex,
        (match) => '(${match[1]}) ${match[2]} ${match[3]}-${match[4]}');
  }

  String get formattedCep {
    final cellphoneRegex = RegExp(r'^(\d{2})(\d{5})(\d{4})$');
    return numbersOnly.replaceFirstMapped(
        cellphoneRegex, (match) => '(${match[1]}) ${match[2]}-${match[3]}');
  }

  String get formattedCEP {
    final cepRegex = RegExp(r'^(\d{5})(\d{3})$');
    return replaceAllMapped(cepRegex, (match) => '${match[1]}-${match[2]}');
  }

  String get firstWord {
    return split(' ').firstWhere((word) => word.isNotEmpty, orElse: () => '');
  }

  bool equals(String x) => this == x;

  bool contaisUpperCase() => contains(RegExp(r'[A-Z]'));

  bool contaisLowerCase() => contains(RegExp(r'[a-z]'));

  bool contaisNumber() => contains(RegExp(r'[0-9]'));

  bool contaisSpecialCharacters() => contains(RegExp(r'[!@#\$&*~]'));

  bool contaisMinLength(int minlength) => length >= minlength;
}
