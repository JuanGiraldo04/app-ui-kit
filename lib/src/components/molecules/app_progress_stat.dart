import 'package:flutter/material.dart';

import '../../theme/app_semantic_colors.dart';
import '../../tokens/tokens.dart';
import '../atoms/app_status_badge.dart';
import 'app_card.dart';

/// Card con una fila label/valor y una barra de progreso coloreada según
/// severidad (p. ej. cupos disponibles de un evento). Reusa
/// [AppStatusBadgeVariant] para que el mismo criterio de color (éxito,
/// advertencia, error) se vea igual en toda la app.
class AppProgressStat extends StatelessWidget {
  const AppProgressStat({
    super.key,
    required this.label,
    required this.value,
    required this.progress,
    this.variant = AppStatusBadgeVariant.neutral,
  });

  final String label;
  final String value;

  /// Entre 0.0 y 1.0.
  final double progress;
  final AppStatusBadgeVariant variant;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final semanticColors = context.appSemanticColors;

    final Color color = switch (variant) {
      AppStatusBadgeVariant.success => semanticColors.success,
      AppStatusBadgeVariant.warning => semanticColors.warning,
      AppStatusBadgeVariant.error => scheme.error,
      AppStatusBadgeVariant.info => semanticColors.info,
      AppStatusBadgeVariant.neutral => scheme.primary,
    };

    return AppCard(
      variant: AppCardVariant.filled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppTypography.bodyMedium),
              Text(value, style: AppTypography.labelLarge),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: AppRadius.fullBorderRadius,
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: scheme.outline.withValues(alpha: 0.2),
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
