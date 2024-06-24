import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'compoundable_formatter.dart';

class UnityQuantityInputFormatter implements CompoundableFormatter {
  TextEditingController? controller;

  UnityQuantityInputFormatter({this.controller});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any character that is not a digit
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit the length to 8 characters
    if (newText.length > 8) newText = newText.substring(0, 8);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  @override
  String get hint => '50';

  @override
  String get label => 'Quantidade';

  @override
  String get labelTip => '';

  @override
  int? get maxLength => 8;

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateNumber(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.digitsOnly;

  @override
  Iterable<String>? get autofillHints => null;

  @override
  Icon? get suffixIcon => throw UnimplementedError();

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryData;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Número inválido';
    }

    return null;
  }

  @override
  String? get suffixText => 'UND';
}
