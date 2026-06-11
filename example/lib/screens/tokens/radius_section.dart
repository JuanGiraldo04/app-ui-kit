import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class RadiusSection extends StatelessWidget {
  const RadiusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      (label: 'xs', value: AppRadius.xs),
      (label: 'sm', value: AppRadius.sm),
      (label: 'md', value: AppRadius.md),
      (label: 'lg', value: AppRadius.lg),
      (label: 'xl', value: AppRadius.xl),
      (label: 'full', value: AppRadius.full),
    ];

    return ShowcaseSection(
      title: 'Radios',
      description: 'Escala de bordes redondeados del sistema.',
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                children: [
                  SizedBox(
                    width: 48,
                    child: Text(
                      item.label,
                      style: AppTypography.labelSmall.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(item.value),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    '${item.value.toInt()}px',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
