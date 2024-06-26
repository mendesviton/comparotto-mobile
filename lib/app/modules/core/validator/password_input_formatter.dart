import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PasswordInputFormatter extends CompoundableFormatter {
  @override
  String hint = AppStrings.passwordHint;
  @override
  String? label;
  @override
  String get labelTip => '';
  @override
  bool get obscure => true;
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
      (value) => validatePassword(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-ZÀ-ÿ ]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Icon? get suffixIcon => null;
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryPasswordField;
    }

    if (value.length < 3) {
      return ValidatorErrorStrings.passwordLengthError;
    }

    return null;
  }

  @override
  // TODO: implement suffixText
  String? get suffixText => throw UnimplementedError();
}
