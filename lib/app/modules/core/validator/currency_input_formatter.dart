import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CurrencyInputFormatter extends CompoundableFormatter {
  final TextEditingController? controller;

  CurrencyInputFormatter({this.controller});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }

  @override
  int get maxLength => 14; // Max length for R$ XX.XXX,XX

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      null; // No validation for currency

  @override
  TextInputFormatter get inputFormatter => CurrencyTextInputFormatter(
        NumberFormat.simpleCurrency(locale: "pt_Br"),
      );
  // MaskTextInputFormatter(
  //     mask: '##.###,##',
  //     filter: {"#": RegExp(r'[0-9]')},
  //     type: MaskAutoCompletionType.lazy,
  //     initialText: controller?.text);

  @override
  Icon get suffixIcon => const Icon(
        Icons.monetization_on_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );

  @override
  String get hint => 'R\$ 50,0';

  @override
  String get label => 'Preço';

  @override
  String get labelTip => throw UnimplementedError();

  @override
  String? get suffixText => '';
}
