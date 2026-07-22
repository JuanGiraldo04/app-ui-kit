import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../atoms/app_circle_icon_button.dart';

/// Imagen de encabezado de una pantalla de detalle, con botón de volver
/// superpuesto y el mismo manejo de error de imagen que [AppMediaCard]/
/// [AppListItemCard]. El consumidor solo pasa la url y el callback de
/// [onBack] — el look (aspect ratio, posición del botón, fallback) lo
/// define el componente.
class AppDetailHeroImage extends StatelessWidget {
  const AppDetailHeroImage({
    super.key,
    required this.imageUrl,
    this.onBack,
    this.overlay,
    this.aspectRatio = 4 / 3,
  });

  final String imageUrl;
  final VoidCallback? onBack;
  final Widget? overlay;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Stack(
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
                size: 48,
                color: scheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
        if (onBack != null)
          Positioned(
            top: MediaQuery.paddingOf(context).top + AppSpacing.sm,
            left: AppSpacing.lg,
            child: AppCircleIconButton(icon: Icons.arrow_back, onTap: onBack),
          ),
        ?overlay,
      ],
    );
  }
}
