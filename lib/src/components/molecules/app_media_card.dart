import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import 'app_card.dart';

/// Card con imagen a todo el ancho arriba (con un slot opcional de overlay,
/// p. ej. un chip de categoría) y contenido libre debajo. El consumidor solo
/// pasa datos (`imageUrl`, `overlay`, `child`); el look — bordes, aspect
/// ratio, estado de error de imagen — lo define el componente.
class AppMediaCard extends StatelessWidget {
  const AppMediaCard({
    super.key,
    required this.imageUrl,
    required this.child,
    this.overlay,
    this.aspectRatio = 16 / 9,
    this.onTap,
  });

  final String imageUrl;
  final Widget child;
  final Widget? overlay;
  final double aspectRatio;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.lg),
            ),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => ColoredBox(
                      color: scheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
                if (overlay != null)
                  Positioned(
                    top: AppSpacing.sm,
                    left: AppSpacing.sm,
                    child: overlay!,
                  ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(AppSpacing.md), child: child),
        ],
      ),
    );
  }
}
