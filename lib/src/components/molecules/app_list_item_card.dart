import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import 'app_card.dart';

/// Card horizontal: thumbnail a la izquierda, título + líneas secundarias al
/// centro y un widget final opcional (p. ej. un badge de estado). El
/// consumidor solo pasa datos — el look y la composición del contenido
/// (tamaño de título según [imageSize], color de las líneas secundarias,
/// miniatura, estado de error de imagen) los define el componente.
class AppListItemCard extends StatelessWidget {
  const AppListItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitleLines = const [],
    this.detailLine,
    this.titleMaxLines,
    this.trailing,
    this.imageSize = 56,
    this.onTap,
  });

  final String imageUrl;
  final String title;

  /// Líneas secundarias (fecha, ubicación, etc), renderizadas en un color
  /// atenuado, en el orden dado.
  final List<String> subtitleLines;

  /// Línea final opcional con más énfasis que [subtitleLines] (p. ej. un
  /// resumen "N entradas · $total").
  final String? detailLine;

  /// `null` (default) deja el título sin límite de líneas.
  final int? titleMaxLines;
  final Widget? trailing;
  final double imageSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final titleStyle = imageSize >= 64
        ? AppTypography.titleMedium
        : AppTypography.titleSmall;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle,
                  maxLines: titleMaxLines,
                  overflow: titleMaxLines != null
                      ? TextOverflow.ellipsis
                      : null,
                ),
                for (final line in subtitleLines) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    line,
                    style: AppTypography.bodySmall.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
                if (detailLine != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(detailLine!, style: AppTypography.bodySmall),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AppSpacing.sm),
            trailing!,
          ],
        ],
      ),
    );
  }
}
