import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// Un ícono + etiqueta dentro de un [AppMetaRow] (p. ej. ubicación o fecha).
/// Si [expanded] es `true`, el item absorbe el espacio libre de la fila y
/// trunca con ellipsis — úsalo en el item cuyo texto varía más en longitud.
class AppMetaItem {
  const AppMetaItem({
    required this.icon,
    required this.label,
    this.expanded = false,
  });

  final IconData icon;
  final String label;
  final bool expanded;
}

/// Fila de metadatos ícono+texto (ubicación, fecha, etc). Reemplaza el
/// patrón repetido de Row+Icon+Text armado a mano en varias pantallas.
class AppMetaRow extends StatelessWidget {
  const AppMetaRow({super.key, required this.items});

  final List<AppMetaItem> items;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final children = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      if (i > 0) children.add(const SizedBox(width: AppSpacing.sm));
      children.add(Icon(item.icon, size: 14, color: scheme.onSurfaceVariant));
      children.add(const SizedBox(width: 4));

      final text = Text(
        item.label,
        style: AppTypography.bodySmall.copyWith(color: scheme.onSurfaceVariant),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
      children.add(item.expanded ? Expanded(child: text) : text);
    }

    return Row(children: children);
  }
}
