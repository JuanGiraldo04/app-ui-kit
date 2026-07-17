import 'package:flutter/material.dart';

import '../../theme/app_semantic_colors.dart';
import '../../tokens/tokens.dart';

enum AppBannerVariant { info, success, warning, error }

class AppBanner extends StatelessWidget {
  const AppBanner({
    super.key,
    required this.message,
    this.variant = AppBannerVariant.info,
    this.title,
    this.leading,
    this.onDismiss,
  });

  final String message;
  final AppBannerVariant variant;
  final String? title;
  final Widget? leading;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final semanticColors = context.appSemanticColors;
    final errorColor = Theme.of(context).colorScheme.error;

    final (bg, iconColor, icon) = switch (variant) {
      AppBannerVariant.info => (
        semanticColors.info.withValues(alpha: 0.12),
        semanticColors.info,
        Icons.info_outline,
      ),
      AppBannerVariant.success => (
        semanticColors.success.withValues(alpha: 0.12),
        semanticColors.success,
        Icons.check_circle_outline,
      ),
      AppBannerVariant.warning => (
        semanticColors.warning.withValues(alpha: 0.12),
        semanticColors.warning,
        Icons.warning_amber_outlined,
      ),
      AppBannerVariant.error => (
        errorColor.withValues(alpha: 0.12),
        errorColor,
        Icons.error_outline,
      ),
    };

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.mdBorderRadius,
        border: Border.all(color: iconColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leading ?? Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: AppTypography.labelLarge.copyWith(color: iconColor),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                ],
                Text(message, style: AppTypography.bodySmall),
              ],
            ),
          ),
          if (onDismiss != null) ...[
            const SizedBox(width: AppSpacing.sm),
            GestureDetector(
              onTap: onDismiss,
              child: Icon(Icons.close, size: 16, color: iconColor),
            ),
          ],
        ],
      ),
    );
  }
}
