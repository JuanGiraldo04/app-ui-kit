import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../molecules/app_card.dart';

/// Card de ticket: código + ícono de QR, con tap-to-enlarge incluido (abre un
/// diálogo con el QR más grande para facilitar el escaneo). El consumidor
/// solo pasa `code` y `label` — el comportamiento de ampliar vive en el
/// componente, no en cada pantalla que lo use.
class AppTicketCard extends StatelessWidget {
  const AppTicketCard({super.key, required this.code, required this.label});

  final String code;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppCard(
      onTap: () => _showEnlargedQr(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.bodySmall.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                code,
                style: AppTypography.titleMedium.copyWith(letterSpacing: 2),
              ),
            ],
          ),
          Icon(Icons.qr_code_2, size: 32, color: scheme.primary),
        ],
      ),
    );
  }

  Future<void> _showEnlargedQr(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        final scheme = Theme.of(context).colorScheme;
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTypography.bodySmall.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Icon(Icons.qr_code_2, size: 220, color: scheme.primary),
                const SizedBox(height: AppSpacing.md),
                Text(
                  code,
                  style: AppTypography.titleMedium.copyWith(letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
