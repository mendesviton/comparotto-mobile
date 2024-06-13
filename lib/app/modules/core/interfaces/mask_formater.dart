import 'package:flutter/services.dart';

abstract class MaskFormater {
  int get maxLength;
  TextInputType get textInputType;
  String get hint;
  String get label;
  bool get digitsOnly => false;
  String? Function(String? value)? get validator;
  bool get obscure => false;
  TextInputFormatter get inputFormatter;
}
