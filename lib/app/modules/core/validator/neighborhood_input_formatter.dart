import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/address_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NeighborhoodInputFormatter implements CompoundableFormatter {
  @override
  int? get maxLength => null;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get labelTip => '';

  @override
  String get label => AppStrings.neighborhoodLabel;

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => AddressInputFormatter.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-Z ]')}, type: MaskAutoCompletionType.lazy);

  @override
  Iterable<String>? get autofillHints => null;

  @override
  Icon? get suffixIcon => null;
}
