import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class EmptyStatesSection extends StatelessWidget {
  const EmptyStatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Empty States',
      description: 'Estados vacíos para distintos contextos.',
      children: [
        ShowcaseSubSection(
          label: 'Generic',
          children: const [
            AppEmptyState(variant: AppEmptyStateVariant.generic),
          ],
        ),
        ShowcaseSubSection(
          label: 'Search',
          children: const [AppEmptyState(variant: AppEmptyStateVariant.search)],
        ),
        ShowcaseSubSection(
          label: 'Network',
          children: const [
            AppEmptyState(variant: AppEmptyStateVariant.network),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con acción',
          children: [
            AppEmptyState(
              variant: AppEmptyStateVariant.generic,
              title: 'Sin eventos',
              message: 'No hay eventos disponibles por ahora.',
              actionLabel: 'Explorar',
              action: () {},
            ),
          ],
        ),
      ],
    );
  }
}
