import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
export 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PostalCodeInputFormatter extends CompoundableFormatter {
  final TextEditingController? controller;
  @override
  String hint = 'Enter your CEP';
  @override
  String label = 'CEP';

  PostalCodeInputFormatter({required this.controller});
  @override
  String get labelTip => '';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String sanitizedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (sanitizedText.length > 8) {
      return oldValue;
    }

    final formattedValue = StringBuffer();

    if (sanitizedText.length > 5) {
      formattedValue.write('${sanitizedText.substring(0, 5)}-');
    } else {
      formattedValue.write(sanitizedText);
    }

    if (sanitizedText.length > 5) {
      formattedValue.write(sanitizedText.substring(5));
    }

    return TextEditingValue(
        text: formattedValue.toString(),
        selection: TextSelection.collapsed(offset: formattedValue.length));
  }

  @override
  int? get maxLength => null;

  @override
  TextInputType get textInputType => TextInputType.emailAddress;

  @override
  String? Function(String? value)? get validator =>
      (value) => validatePostalCode(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
        mask: '#####-###',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy,
        initialText: controller?.text,
      );

  @override
  Icon get suffixIcon => const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(255, 197, 197, 197),
      );

  static String? validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryData;
    }

    String sanitizedCEP = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (sanitizedCEP.length != 8) {
      return ValidatorErrorStrings.invalidPostalCode;
    }

    return null;
  }
}
