import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddressInputFormatter extends CompoundableFormatter {
  @override
  int? get maxLength => null;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText =
        newValue.text.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ0-9 ]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get labelTip => '';

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.address;

  @override
  TextInputType get textInputType => TextInputType.text;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-Z ]')}, type: MaskAutoCompletionType.lazy);

  @override
  Icon? get suffixIcon => null;
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.nullError;
    }

    return null;
  }

  @override
  // TODO: implement suffixText
  String? get suffixText => throw UnimplementedError();
}
