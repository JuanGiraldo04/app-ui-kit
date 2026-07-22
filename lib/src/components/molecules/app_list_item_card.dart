import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import 'app_card.dart';

/// Card horizontal: thumbnail a la izquierda, contenido libre al centro y un
/// widget final opcional (p. ej. un badge de estado). El consumidor solo pasa
/// datos (`imageUrl`, `content`, `trailing`); el look —tamaño de la miniatura,
/// bordes, estado de error de imagen— lo define el componente.
class AppListItemCard extends StatelessWidget {
  const AppListItemCard({
    super.key,
    required this.imageUrl,
    required this.content,
    this.trailing,
    this.imageSize = 56,
    this.onTap,
  });

  final String imageUrl;
  final Widget content;
  final Widget? trailing;
  final double imageSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: AppRadius.mdBorderRadius,
            child: Image.network(
              imageUrl,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: imageSize,
                height: imageSize,
                color: scheme.surfaceContainerHighest,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: content),
          if (trailing != null) ...[
            const SizedBox(width: AppSpacing.sm),
            trailing!,
          ],
        ],
      ),
    );
  }
}
