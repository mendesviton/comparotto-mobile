import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'compoundable_formatter.dart';

class WeightQuantityInputFormatter implements CompoundableFormatter {
  TextEditingController? controller;

  WeightQuantityInputFormatter({this.controller});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow maximum of 5 characters: 1 digit before comma, 3 digits after comma, 1 comma
    if (newValue.text.length > 6) return oldValue;

    String newText = newValue.text.replaceAll(',', '');
    if (newText.length > 3) {
      newText =
          '${newText.substring(0, newText.length - 3)},${newText.substring(newText.length - 3)}';
    }

    int cursorPosition = newValue.selection.end;
    if (newValue.text.contains(',')) {
      if (newValue.selection.end > newText.indexOf(',') &&
          newValue.selection.end < newText.length) {
        cursorPosition++;
      }
    } else {
      cursorPosition = newText.length;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  @override
  String get hint => '0,200';

  @override
  String get label => 'Quantidade';

  @override
  String get labelTip => '';

  @override
  int? get maxLength => 10;

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateQuantity(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '##,###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  Iterable<String>? get autofillHints => null;

  @override
  Icon? get suffixIcon => null;

  static String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Quantidade obrigatória';
    }

    final parts = value.split(',');
    if (parts.isEmpty) {
      return 'Formato inválido';
    }

    if (parts.length == 1) {
      return (int.tryParse(parts[0])! < 0) ? 'formato invalido' : null;
    }

    final beforeComma = int.tryParse(parts[0]);
    final afterComma = int.tryParse(parts[1]);
    if (beforeComma == null) {
      return 'Formato inválido';
    }

    if (beforeComma < 0) {
      if (afterComma != null) {
        if (afterComma < 0 || afterComma > 999) {
          return 'Quantidade inválida';
        }
      }
      return 'Quantidade inválida';
    }

    return null;
  }

  @override
  String? get suffixText => 'KG';
}
