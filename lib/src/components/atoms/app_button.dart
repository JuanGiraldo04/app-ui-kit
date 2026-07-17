import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

enum AppButtonVariant { primary, secondary, outlined, ghost }

enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final (bg, fg, border) = switch (variant) {
      AppButtonVariant.primary => (
        scheme.primary,
        scheme.onPrimary,
        Colors.transparent,
      ),
      AppButtonVariant.secondary => (
        scheme.secondary,
        scheme.onSecondary,
        Colors.transparent,
      ),
      AppButtonVariant.outlined => (
        Colors.transparent,
        scheme.primary,
        scheme.primary,
      ),
      AppButtonVariant.ghost => (
        Colors.transparent,
        scheme.primary,
        Colors.transparent,
      ),
    };

    final (horizontal, vertical, textStyle, diameter) = switch (size) {
      AppButtonSize.small => (
        AppSpacing.md,
        AppSpacing.xs,
        AppTypography.labelSmall,
        32.0,
      ),
      AppButtonSize.medium => (
        AppSpacing.xl,
        AppSpacing.md,
        AppTypography.labelMedium,
        40.0,
      ),
      AppButtonSize.large => (
        AppSpacing.xxl,
        AppSpacing.lg,
        AppTypography.labelLarge,
        48.0,
      ),
    };

    if (isLoading) {
      // Estado de carga: círculo de tamaño fijo, nunca estirado a lo ancho
      // del contenedor, para que no se vea como una píldora deformada.
      final loader = Material(
        color: bg,
        shape: const CircleBorder(),
        child: SizedBox(
          width: diameter,
          height: diameter,
          child: Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: fg),
            ),
          ),
        ),
      );
      return isFullWidth ? Center(child: loader) : loader;
    }

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(label, style: textStyle.copyWith(color: fg)),
        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.sm),
          trailing!,
        ],
      ],
    );

    final button = AnimatedOpacity(
      opacity: onPressed == null ? 0.5 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: bg,
        borderRadius: AppRadius.mdBorderRadius,
        child: InkWell(
          onTap: onPressed,
          borderRadius: AppRadius.mdBorderRadius,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: vertical,
            ),
            decoration: BoxDecoration(
              borderRadius: AppRadius.mdBorderRadius,
              border: Border.all(color: border),
            ),
            child: child,
          ),
        ),
      ),
    );

    return isFullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
