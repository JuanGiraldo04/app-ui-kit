import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class StatusBadgesSection extends StatelessWidget {
  const StatusBadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Status badges',
      description: 'Pill de color semántico para representar un estado.',
      children: [
        ShowcaseSubSection(
          label: 'Variantes',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: const [
                AppStatusBadge(
                  label: 'Confirmada',
                  variant: AppStatusBadgeVariant.success,
                ),
                AppStatusBadge(
                  label: 'Pendiente',
                  variant: AppStatusBadgeVariant.warning,
                ),
                AppStatusBadge(
                  label: 'Cancelada',
                  variant: AppStatusBadgeVariant.error,
                ),
                AppStatusBadge(
                  label: 'Informativo',
                  variant: AppStatusBadgeVariant.info,
                ),
                AppStatusBadge(label: 'Neutral'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
