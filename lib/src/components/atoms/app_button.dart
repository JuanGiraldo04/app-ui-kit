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

    final (horizontal, vertical, textStyle) = switch (size) {
      AppButtonSize.small => (
        AppSpacing.md,
        AppSpacing.xs,
        AppTypography.labelSmall,
      ),
      AppButtonSize.medium => (
        AppSpacing.xl,
        AppSpacing.md,
        AppTypography.labelMedium,
      ),
      AppButtonSize.large => (
        AppSpacing.xxl,
        AppSpacing.lg,
        AppTypography.labelLarge,
      ),
    };

    final child = isLoading
        ? SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: fg),
          )
        : Row(
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
          onTap: isLoading ? null : onPressed,
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
