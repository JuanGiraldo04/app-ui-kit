import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

enum AppTextFieldVariant { normal, error, disabled }

class AppTextField extends StatefulWidget {
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
    this.isPassword = false,
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

  /// Cuando es `true`, el campo se muestra oculto por defecto y agrega un
  /// ícono de ojo (auto-gestionado) para alternar visibilidad — sin
  /// necesidad de que quien lo consuma maneje su propio estado.
  final bool isPassword;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText = widget.isPassword ? true : widget.obscureText;

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.variant == AppTextFieldVariant.disabled;
    final hasError = widget.variant == AppTextFieldVariant.error;

    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      enabled: !isDisabled,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      style: AppTypography.bodyMedium,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        helperText: widget.helperText,
        errorText: hasError ? widget.errorText : null,
        prefixIcon: widget.leading,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => setState(() => _obscureText = !_obscureText),
              )
            : widget.trailing,
      ),
    );
  }
}
