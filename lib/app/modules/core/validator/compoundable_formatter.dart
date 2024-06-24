import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CompoundableFormatter extends TextInputFormatter {
  int? get maxLength;
  TextInputType get textInputType;
  String get hint;
  String? get label;
  String get labelTip;
  String? get suffixText;
  Icon? get suffixIcon;
  String? Function(String? value)? get validator;
  bool get obscure => false;
  TextInputFormatter get inputFormatter;
  Iterable<String>? get autofillHints => null;
}
