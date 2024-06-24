import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cnpj_category_number_input_formatter.dart';
import 'compoundable_formatter.dart';

class ComplementInputFormatter implements CompoundableFormatter {
  ComplementInputFormatter({this.labelTipFormated = '(opcional)'});

  @override
  int? get maxLength => null;
  final String labelTipFormated;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      selection: TextSelection.collapsed(offset: newValue.text.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.complementLabel;

  @override
  String get labelTip => labelTipFormated;

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator => (value) => null;

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
        filter: {"#": RegExp(r'[^a-zA-ZÀ-ÿ0-9 ]')},
        type: MaskAutoCompletionType.lazy,
      );

  @override
  Icon? get suffixIcon => null;

  @override
  Iterable<String>? get autofillHints => [''];

  @override
  // TODO: implement suffixText
  String? get suffixText => throw UnimplementedError();
}
