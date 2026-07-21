import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:example/widgets/showcase_subsection.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class MediaCardsSection extends StatelessWidget {
  const MediaCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Media cards',
      description:
          'Card con imagen arriba, overlay opcional y contenido libre debajo.',
      children: [
        ShowcaseSubSection(
          label: 'Con overlay (chip de categoría)',
          children: [
            AppMediaCard(
              imageUrl: 'https://picsum.photos/seed/media-card-1/800/450',
              overlay: const AppChip(label: 'Fútbol', isSelected: true),
              child: const _MediaCardContent(),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Sin overlay',
          children: [
            AppMediaCard(
              imageUrl: 'https://picsum.photos/seed/media-card-2/800/450',
              child: const _MediaCardContent(),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Imagen rota (fallback)',
          children: [
            AppMediaCard(
              imageUrl: 'https://example.invalid/broken.jpg',
              onTap: () {},
              child: const _MediaCardContent(),
            ),
          ],
        ),
      ],
    );
  }
}

class _MediaCardContent extends StatelessWidget {
  const _MediaCardContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Título de la card', style: AppTypography.titleSmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Ciudad · Fecha',
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
