import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CorporateNameInputFormatter extends CompoundableFormatter {
  @override
  String hint = 'Enter your corporate name';
  @override
  String label = 'Corporate Name';
  @override
  String get labelTip => '';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var posicaoCursor = newValue.selection.end;

    if (newValue.text.length > 50) {
      return oldValue;
    }

    final valorFinal = StringBuffer();

    valorFinal.write(newValue.text);

    return TextEditingValue(
      text: valorFinal.toString(),
      selection: TextSelection.collapsed(offset: posicaoCursor),
    );
  }

  @override
  int? get maxLength => null;

  @override
  TextInputType get textInputType => TextInputType.emailAddress;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateCorporateName(value);

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
  @override
  Icon get suffixIcon => const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );
  static String? validateCorporateName(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryData;
    }

    final hasNumbers = value.contains(RegExp(r'[0-9]'));
    if (hasNumbers) {
      ValidatorErrorStrings.containNumberError;
    }

    return null;
  }
}
