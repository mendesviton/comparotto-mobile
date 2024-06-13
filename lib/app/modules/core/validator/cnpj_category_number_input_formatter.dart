import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CNPJCategoryInputFormatter extends CompoundableFormatter {
  final TextEditingController? controller;

  CNPJCategoryInputFormatter({this.controller});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength) return oldValue;

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValue.text.length >= 3) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 2)}.');
      if (newValue.selection.end >= 2) posicaoCursor++;
    }
    if (newValue.text.length >= 6) {
      valorFinal.write('${newValue.text.substring(2, substrIndex = 5)}.');
      if (newValue.selection.end >= 5) posicaoCursor++;
    }
    if (newValue.text.length >= 9) {
      valorFinal.write('${newValue.text.substring(5, substrIndex = 8)}/');
      if (newValue.selection.end >= 8) posicaoCursor++;
    }
    if (newValue.text.length >= 13) {
      valorFinal.write('${newValue.text.substring(8, substrIndex = 12)}-');
      if (newValue.selection.end >= 12) posicaoCursor++;
    }
    if (newValue.text.length >= substrIndex) {
      valorFinal.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: valorFinal.toString(),
      selection: TextSelection.collapsed(offset: posicaoCursor),
    );
  }

  @override
  int get maxLength => 18;
  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateCNPJ(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '##.###.###/####-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  Icon get suffixIcon => const Icon(
        Icons.business_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );

  static String? validateCNPJ(String? value) {
    if (value != null && value.isNotEmpty) {
      final cleanedCNPJ = value.replaceAll(RegExp(r'[^0-9]'), '');

      if (RegExp(r'^(\d)\1+$').hasMatch(cleanedCNPJ)) {
        return ValidatorErrorStrings.invalidEmailError;
      }
      if (cleanedCNPJ.length < 14) {
        return ValidatorErrorStrings.cnpjLengthError;
      }
      return null;
    }
    return ValidatorErrorStrings.mandatoryData;
  }

  @override
  String get hint => AppStrings.cnpjComplementHint;

  @override
  String get label => AppStrings.cnpjComplementLabel;

  @override
  String get labelTip => throw UnimplementedError();
}
