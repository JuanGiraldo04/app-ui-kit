import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// Fila "label a la izquierda, valor a la derecha" — resúmenes de precio,
/// cantidad, totales, etc. `emphasize` la destaca (útil para el total de un
/// desglose).
class AppKeyValueRow extends StatelessWidget {
  const AppKeyValueRow({
    super.key,
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: emphasize
              ? AppTypography.titleSmall
              : AppTypography.bodyMedium,
        ),
        Text(
          value,
          style: emphasize
              ? AppTypography.titleLarge.copyWith(color: scheme.primary)
              : AppTypography.labelLarge,
        ),
      ],
    );
  }
}
