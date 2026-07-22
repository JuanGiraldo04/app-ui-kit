import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// Fila reusada por [AppDropdown] y `AppMultiSelectDropdown` para renderizar
/// un item con ícono/descripción opcionales y un [trailing] (check,
/// checkbox, etc). Vive en `shared/` porque la privacidad de Dart es por
/// archivo — ambos componentes la necesitan pero no debe ensuciar la API
/// pública del paquete.
class AppDropdownItemRow extends StatelessWidget {
  const AppDropdownItemRow({
    super.key,
    required this.label,
    this.icon,
    this.description,
    this.trailing,
  });

  final String label;
  final IconData? icon;
  final String? description;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18, color: scheme.onSurfaceVariant),
          const SizedBox(width: AppSpacing.sm),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTypography.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              if (description != null)
                Text(
                  description!,
                  style: AppTypography.bodySmall.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.sm),
          trailing!,
        ],
      ],
    );
  }
}
