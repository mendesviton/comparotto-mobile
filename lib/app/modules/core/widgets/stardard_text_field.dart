import 'package:comparotto/app/modules/core/validator/compoundable_formatter.dart';
import 'package:comparotto/app/modules/extensions/app_theme.dart';
import 'package:comparotto/app/modules/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StandardTextField extends StatefulWidget {
  final CompoundableFormatter compoundableFormatter;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final bool enabled;
  final bool shouldValidate;
  final Color? fillColor;
  final TextAlign textAlign;
  final bool shouldIgnorePadding;
  final EdgeInsetsGeometry? padding;
  final bool? notShowErrorText;
  final bool isSensitive;
  final bool showSuffixIcon;
  final String? suffixIconPath;
  final bool isOptional;
  final bool editable;
  final int? maxLines;

  const StandardTextField({
    super.key,
    required this.compoundableFormatter,
    this.onChanged,
    this.focusNode,
    required this.controller,
    this.errorText,
    this.enabled = true,
    this.shouldValidate = true,
    this.fillColor = Colors.transparent,
    this.textAlign = TextAlign.left,
    this.shouldIgnorePadding = false,
    this.onEditingComplete,
    this.isSensitive = false,
    this.padding,
    this.suffixIconPath,
    this.notShowErrorText,
    this.isOptional = false,
    this.editable = true,
    this.maxLines = 1,
    this.showSuffixIcon = false,
  });

  @override
  State<StandardTextField> createState() => _StandardTextFieldState();
}

class _StandardTextFieldState extends State<StandardTextField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.compoundableFormatter.label != null)
            Text(
              widget.compoundableFormatter.label!,
              style: context.theme.textTheme.mediumBlackTextStyle,
            ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            maxLines: widget.maxLines,
            maxLength: widget.compoundableFormatter.maxLength,
            onEditingComplete: widget.onEditingComplete,
            style: context.theme.textTheme.smallBlackRegularTextStyle,
            autofillHints: widget.compoundableFormatter.autofillHints,
            onChanged: widget.onChanged,
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.compoundableFormatter.textInputType,
            textAlign: widget.textAlign,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.shouldValidate
                ? widget.compoundableFormatter.validator
                : null,
            inputFormatters: [
              widget.compoundableFormatter.inputFormatter,
            ],
            obscureText: !_showPassword && widget.compoundableFormatter.obscure,
            decoration:
                _buildInputDecoration(theme, widget.errorText, widget.enabled),
            enabled: widget.enabled && widget.editable,
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      ThemeData theme, String? errorText, bool enabled) {
    return InputDecoration(
      counterText: '',
      suffixIcon: widget.showSuffixIcon ? _buildSuffixIcon() : null,
      alignLabelWithHint: true,
      errorStyle: widget.notShowErrorText == true
          ? const TextStyle(height: 0)
          : const TextStyle(height: 0.5),
      contentPadding: EdgeInsets.symmetric(
        vertical: context.height * 0.02,
        horizontal: context.width * 0.05,
      ),
      errorBorder: _buildOutlineErrorInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      hintText: widget.compoundableFormatter.hint,
      hintStyle: context.theme.textTheme.smallGreyRegularTextStyle,
      enabledBorder: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputFocusedBorder(),
      focusedErrorBorder: _buildOutlineErrorInputBorder(),
      disabledBorder: _buildOutlineInputBorder(),
      errorText: errorText,
      fillColor: widget.fillColor,
      filled: true,
    );
  }

  Widget? _buildSuffixIcon() {
    return widget.compoundableFormatter.obscure
        ? Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(255, 197, 197, 197),
              ),
              onPressed: () => widget.suffixIconPath != null
                  ? null
                  : setState(() {
                      _showPassword = !_showPassword;
                    }),
            ),
          )
        : widget.compoundableFormatter.suffixIcon;
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      gapPadding: 1,
      borderSide: widget.enabled
          ? const BorderSide(color: AppColors.greyFFD2D8D7, width: 1.5)
          : const BorderSide(color: AppColors.greyFFE4E4E4, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(14)),
    );
  }

  OutlineInputBorder _buildOutlineErrorInputBorder() {
    return OutlineInputBorder(
      gapPadding: 2,
      borderSide:
          BorderSide(color: context.theme.colorScheme.greyFFD2D8D7, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(14)),
    );
  }

  OutlineInputBorder _buildOutlineInputFocusedBorder() {
    return OutlineInputBorder(
      gapPadding: 1,
      borderSide: BorderSide(
        color: context.theme.colorScheme.primaryBlack,
        width: 1.5,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(14),
      ),
    );
  }
}
