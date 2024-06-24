import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'compoundable_formatter.dart';

class DataInputFormatter implements CompoundableFormatter {
  TextEditingController? controller;

  DataInputFormatter({this.controller});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 8) return oldValue;

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValue.text.length >= 3) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 2)}/');
      if (newValue.selection.end >= 2) posicaoCursor++;
    }
    if (newValue.text.length >= 5) {
      valorFinal.write('${newValue.text.substring(2, substrIndex = 4)}/');
      if (newValue.selection.end >= 4) posicaoCursor++;
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
  String get hint => '00/00/0000';

  @override
  String get label => 'Data de entrada';

  @override
  String get labelTip => '';

  @override
  int? get maxLength => null;

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => validateDate(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  Iterable<String>? get autofillHints => null;

  @override
  Icon? get suffixIcon => throw UnimplementedError();
  static String? validateDate(String? date) {
    if (date == null || date.isEmpty) {
      return ValidatorErrorStrings.mandatoryData;
    }

    final datePattern = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!datePattern.hasMatch(date)) {
      return 'data oinvalida';
    }

    final parts = date.split('/');
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    if (day == null || month == null || year == null) {
      return 'data oinvalida';
    }

    if (month < 1 || month > 12) {
      return 'data oinvalida';
    }

    if (day < 1 || day > 31) {
      return 'data oinvalida';
    }

    if (year < 1900 || year > 2100) {
      return 'data oinvalida';
    }

    final now = DateTime.now();
    final dateParts = date.split('/');
    final year1 = int.parse(dateParts[2]);
    final month1 = int.parse(dateParts[1]);
    final day1 = int.parse(dateParts[0]);
    final submittedDate = DateTime(year1, month1, day1);

    if (submittedDate.isAfter(now)) {
      return 'data oinvalida';
    }

    String dateFormat = "dd/MM/yyyy";
    try {
      DateFormat(dateFormat).parseStrict(date);
    } on Exception {
      return 'dasda';
    }

    return null;
  }

  @override
  // TODO: implement suffixText
  String? get suffixText => throw UnimplementedError();
}
