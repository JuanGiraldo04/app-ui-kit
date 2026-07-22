import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:example/widgets/showcase_subsection.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class ListItemCardsSection extends StatelessWidget {
  const ListItemCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'List item cards',
      description:
          'Card horizontal: thumbnail + contenido + widget final opcional.',
      children: [
        ShowcaseSubSection(
          label: 'Con trailing (badge)',
          children: [
            AppListItemCard(
              imageUrl: 'https://picsum.photos/seed/list-item-1/200/200',
              content: const _ItemContent(),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  borderRadius: AppRadius.fullBorderRadius,
                ),
                child: Text(
                  'Confirmada',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Sin trailing',
          children: [
            AppListItemCard(
              imageUrl: 'https://picsum.photos/seed/list-item-2/200/200',
              content: const _ItemContent(),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Thumbnail más grande (imageSize: 64)',
          children: [
            AppListItemCard(
              imageUrl: 'https://picsum.photos/seed/list-item-3/200/200',
              imageSize: 64,
              onTap: () {},
              content: const _ItemContent(),
            ),
          ],
        ),
      ],
    );
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Título del ítem', style: AppTypography.titleSmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Subtítulo · Detalle',
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
