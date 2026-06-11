import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../atoms/atoms.dart';

enum AppEmptyStateVariant { generic, search, error, network }

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    this.variant = AppEmptyStateVariant.generic,
    this.title,
    this.message,
    this.action,
    this.actionLabel,
    this.icon,
  });

  final AppEmptyStateVariant variant;
  final String? title;
  final String? message;
  final VoidCallback? action;
  final String? actionLabel;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final (defaultIcon, defaultTitle, defaultMessage) = switch (variant) {
      AppEmptyStateVariant.generic => (
        Icons.inbox_outlined,
        'Sin contenido',
        'No hay elementos para mostrar.',
      ),
      AppEmptyStateVariant.search => (
        Icons.search_off_outlined,
        'Sin resultados',
        'No encontramos lo que buscas. Intenta con otro término.',
      ),
      AppEmptyStateVariant.error => (
        Icons.error_outline,
        'Algo salió mal',
        'Ocurrió un error inesperado. Intenta de nuevo.',
      ),
      AppEmptyStateVariant.network => (
        Icons.wifi_off_outlined,
        'Sin conexión',
        'Verifica tu conexión a internet e intenta de nuevo.',
      ),
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon ?? defaultIcon,
                size: 40,
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              title ?? defaultTitle,
              style: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message ?? defaultMessage,
              style: AppTypography.bodyMedium.copyWith(
                color: scheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (action != null && actionLabel != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton(label: actionLabel!, onPressed: action),
            ],
          ],
        ),
      ),
    );
  }
}
