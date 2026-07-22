import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class StatusIconsSection extends StatelessWidget {
  const StatusIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Status icons',
      description:
          'Círculo de color semántico con ícono grande, para estados a '
          'pantalla completa (éxito, error).',
      children: [
        ShowcaseSubSection(
          label: 'Variantes',
          children: [
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.lg,
              children: const [
                AppStatusIcon(
                  icon: Icons.check_circle,
                  variant: AppStatusBadgeVariant.success,
                ),
                AppStatusIcon(
                  icon: Icons.error,
                  variant: AppStatusBadgeVariant.error,
                ),
                AppStatusIcon(
                  icon: Icons.warning,
                  variant: AppStatusBadgeVariant.warning,
                ),
                AppStatusIcon(
                  icon: Icons.info,
                  variant: AppStatusBadgeVariant.info,
                ),
              ],
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Tamaño chico (size: 56)',
          children: const [
            AppStatusIcon(
              icon: Icons.check_circle,
              variant: AppStatusBadgeVariant.success,
              size: 56,
            ),
          ],
        ),
      ],
    );
  }
}
