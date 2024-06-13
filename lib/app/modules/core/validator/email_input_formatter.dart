import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/services/text_formatter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EmailInputFormatter extends CompoundableFormatter {
  @override
  String hint = AppStrings.emailHint;
  @override
  String label = AppStrings.emailLabel;
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
      (value) => validateEmail(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-ZÀ-ÿ ]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Icon get suffixIcon => const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryEmailField;
    }

    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    if (!emailRegex.hasMatch(value)) {
      return ValidatorErrorStrings.invalidEmailError;
    }

    return null;
  }
}
