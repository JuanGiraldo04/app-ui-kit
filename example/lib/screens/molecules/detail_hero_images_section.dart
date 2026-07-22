import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class DetailHeroImagesSection extends StatelessWidget {
  const DetailHeroImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Detail hero images',
      description:
          'Imagen de encabezado para pantallas de detalle, con botón de '
          'volver superpuesto y el mismo fallback de error que las cards.',
      children: [
        ShowcaseSubSection(
          label: 'Con botón de volver',
          children: [
            ClipRRect(
              borderRadius: AppRadius.mdBorderRadius,
              child: AppDetailHeroImage(
                imageUrl: 'https://picsum.photos/seed/hero-1/800/600',
                onBack: () {},
              ),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Imagen rota (fallback)',
          children: [
            ClipRRect(
              borderRadius: AppRadius.mdBorderRadius,
              child: AppDetailHeroImage(
                imageUrl: 'https://example.invalid/broken.jpg',
                onBack: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
