import 'package:flutter/material.dart';

import '../../theme/app_semantic_colors.dart';
import '../../tokens/tokens.dart';

enum AppStatusBadgeVariant { success, warning, error, info, neutral }

/// Pill de color semántico + texto, para representar un estado (p. ej. una
/// reserva confirmada/pendiente, o cupos altos/bajos/agotados). El consumidor
/// solo pasa el `label` y el `variant`; el color lo resuelve el componente
/// desde el tema, nunca desde una constante estática.
class AppStatusBadge extends StatelessWidget {
  const AppStatusBadge({
    super.key,
    required this.label,
    this.variant = AppStatusBadgeVariant.neutral,
  });

  final String label;
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
      AppStatusBadgeVariant.neutral => scheme.onSurfaceVariant,
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: AppRadius.fullBorderRadius,
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(color: color),
      ),
    );
  }
}
