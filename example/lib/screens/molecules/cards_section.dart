import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:example/widgets/showcase_subsection.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Cards',
      description: 'Variantes de contenedor de contenido.',
      children: [
        ShowcaseSubSection(
          label: 'Elevated',
          children: [
            AppCard(variant: AppCardVariant.elevated, child: _CardContent()),
          ],
        ),
        ShowcaseSubSection(
          label: 'Outlined',
          children: [
            AppCard(variant: AppCardVariant.outlined, child: _CardContent()),
          ],
        ),
        ShowcaseSubSection(
          label: 'Filled',
          children: [
            AppCard(variant: AppCardVariant.filled, child: _CardContent()),
          ],
        ),
        ShowcaseSubSection(
          label: 'Tappable',
          children: [
            AppCard(
              variant: AppCardVariant.outlined,
              onTap: () {},
              child: Row(
                children: [
                  _CardContent(),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Título de la card', style: AppTypography.titleSmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Contenido de ejemplo para mostrar cómo se ve la card con texto.',
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
