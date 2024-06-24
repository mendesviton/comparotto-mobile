import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameProductInputFormatter extends CompoundableFormatter {
  @override
  String hint = 'ex: Arroz são joão 1kg';
  @override
  String? label = AppStrings.productNameLabel;
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
  int? get maxLength => 200;

  @override
  TextInputType get textInputType => TextInputType.emailAddress;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateName(value);

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
  @override
  Icon get suffixIcon => const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );
  static String? validateName(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryData;
    }

    final hasNumbers = value.contains(RegExp(r'[0-9]'));
    if (hasNumbers) {
      return ValidatorErrorStrings.containNumberError;
    }

    return null;
  }

  @override
  // TODO: implement suffixText
  String? get suffixText => throw UnimplementedError();
}
