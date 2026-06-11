import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

enum AppTextFieldVariant { normal, error, disabled }

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.variant = AppTextFieldVariant.normal,
    this.leading,
    this.trailing,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
  });

  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final AppTextFieldVariant variant;
  final Widget? leading;
  final Widget? trailing;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final isDisabled = variant == AppTextFieldVariant.disabled;
    final hasError = variant == AppTextFieldVariant.error;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      enabled: !isDisabled,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: AppTypography.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        errorText: hasError ? errorText : null,
        prefixIcon: leading,
        suffixIcon: trailing,
      ),
    );
  }
}
