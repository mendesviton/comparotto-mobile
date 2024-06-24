import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CurrencyInputFormatter extends CompoundableFormatter {
  final TextEditingController? controller;

  CurrencyInputFormatter({this.controller});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength) return oldValue;

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer('R\$ ');

    if (newValue.text.length >= 2) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 1)}.');
      if (newValue.selection.end >= 1) posicaoCursor++;
    }
    if (newValue.text.length >= 5) {
      valorFinal.write('${newValue.text.substring(1, substrIndex = 4)},');
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
  int get maxLength => 14; // Max length for R$ XX.XXX,XX

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      null; // No validation for currency

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '##.###,##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  Icon get suffixIcon => const Icon(
        Icons.monetization_on_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );

  @override
  String get hint =>
      'aa'; // Assuming you have an AppStrings.currencyHint defined

  @override
  String get label =>
      'aa'; // Assuming you have an AppStrings.currencyLabel defined

  @override
  String get labelTip => throw UnimplementedError();

  @override
  // TODO: implement suffixText
  String? get suffixText => throw UnimplementedError();
}
