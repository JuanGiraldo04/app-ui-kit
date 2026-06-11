import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class SpacingSection extends StatelessWidget {
  const SpacingSection({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      (label: 'xs', value: AppSpacing.xs),
      (label: 'sm', value: AppSpacing.sm),
      (label: 'md', value: AppSpacing.md),
      (label: 'lg', value: AppSpacing.lg),
      (label: 'xl', value: AppSpacing.xl),
      (label: 'xxl', value: AppSpacing.xxl),
      (label: 'xxxl', value: AppSpacing.xxxl),
    ];

    return ShowcaseSection(
      title: 'Espaciados',
      description: 'Escala de espaciado del sistema.',
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
                    width: item.value,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      border: Border.all(color: AppColors.primary),
                      borderRadius: AppRadius.xsBorderRadius,
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
