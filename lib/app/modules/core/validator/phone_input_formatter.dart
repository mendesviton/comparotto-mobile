import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneInputFormatter extends CompoundableFormatter {
  final TextEditingController? controller;
  @override
  String hint = AppStrings.telephoneHint;
  @override
  String label = AppStrings.telephoneLabel;

  PhoneInputFormatter({required this.controller});
  @override
  String get labelTip => '';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 11) return oldValue;

    final newValueLength = newValue.text.length;
    if (newValueLength == 11) {
      if (newValue.text.toString()[2] != '9') {
        return oldValue;
      }
    }

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValueLength >= 1) {
      valorFinal.write('(');
      if (newValue.selection.end >= 1) posicaoCursor++;
    }

    if (newValueLength >= 3) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 2)}) ');
      if (newValue.selection.end >= 2) posicaoCursor += 2;
    }

    if (newValue.text.length == 11) {
      if (newValueLength >= 8) {
        valorFinal.write('${newValue.text.substring(2, substrIndex = 7)}-');
        if (newValue.selection.end >= 7) posicaoCursor++;
      }
    } else {
      if (newValueLength >= 7) {
        valorFinal.write('${newValue.text.substring(2, substrIndex = 6)}-');
        if (newValue.selection.end >= 6) posicaoCursor++;
      }
    }

    if (newValueLength >= substrIndex) {
      valorFinal.write(newValue.text.substring(substrIndex));
    }

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
      (value) => validatePhoneNumber(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  Icon get suffixIcon => const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryPhoneField;
    }
    final cleanedPhone = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedPhone.length < 11) {
      return ValidatorErrorStrings.phoneFieldLengthError;
    }

    return null;
  }
}
