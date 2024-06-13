import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:comparotto/app/modules/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TaxVatInputFormatter extends CompoundableFormatter {
  final TextEditingController? controller;
  @override
  String hint = AppStrings.taxVatCodeHint;
  @override
  String label = AppStrings.taxVatCodeLabel;

  TaxVatInputFormatter({this.controller});
  @override
  String get labelTip => '';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength) return oldValue;

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValue.text.length >= 4) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 3)}.');
      if (newValue.selection.end >= 3) posicaoCursor++;
    }
    if (newValue.text.length >= 7) {
      valorFinal.write('${newValue.text.substring(3, substrIndex = 6)}.');
      if (newValue.selection.end >= 6) posicaoCursor++;
    }
    if (newValue.text.length >= 10) {
      valorFinal.write('${newValue.text.substring(6, substrIndex = 9)}-');
      if (newValue.selection.end >= 9) posicaoCursor++;
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
  int get maxLength => 14;
  @override
  TextInputType get textInputType => TextInputType.emailAddress;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateTaxVat(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  Icon get suffixIcon => const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );
  static String? validateTaxVat(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        final cleanedTaxVat = value.replaceAll(RegExp(r'[^0-9]'), '');

        if (RegExp(r'^(\d)\1+$').hasMatch(cleanedTaxVat)) {
          return 'Invalid CPF';
        }
        if (cleanedTaxVat.length == 11) {
          String numbers = value.numbersOnly.substring(0, 9);
          numbers += _verifierDigit(numbers).toString();
          numbers += _verifierDigit(numbers).toString();

          if (numbers.substring(numbers.length - 2) !=
              value.substring(value.length - 2)) {
            return 'Invalid CPF';
          }
        }

        return null;
      }
    }
    return null;
  }

  static int _verifierDigit(String taxVat) {
    List<int> numbers =
        taxVat.split("").map((number) => int.parse(number, radix: 10)).toList();

    int modulus = numbers.length + 1;

    List<int> multiplied = [];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }
}
