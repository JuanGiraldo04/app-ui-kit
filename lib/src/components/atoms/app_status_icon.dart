import 'package:flutter/material.dart';

import '../../theme/app_semantic_colors.dart';
import 'app_status_badge.dart';

/// Círculo de color semántico con un ícono grande centrado — estados de
/// éxito/error a pantalla completa (p. ej. "¡Reserva confirmada!"). Reusa
/// [AppStatusBadgeVariant] para el mismo criterio de color que
/// [AppStatusBadge] y [AppProgressStat].
class AppStatusIcon extends StatelessWidget {
  const AppStatusIcon({
    super.key,
    required this.icon,
    this.variant = AppStatusBadgeVariant.neutral,
    this.size = 96,
    this.iconSize,
  });

  final IconData icon;
  final AppStatusBadgeVariant variant;
  final double size;
  final double? iconSize;

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

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: iconSize ?? size * 0.58),
    );
  }
}
