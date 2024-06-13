import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/address_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'compoundable_formatter.dart';

class CityInputFormatter implements CompoundableFormatter {
  @override
  int? get maxLength => null;
  @override
  Iterable<String>? get autofillHints => null;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z ]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.city;

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => AddressInputFormatter.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-Z ]')}, type: MaskAutoCompletionType.lazy);

  @override
  Icon? get suffixIcon => null;
}
