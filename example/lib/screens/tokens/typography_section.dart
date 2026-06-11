import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Tipografía',
      description: 'Estilos de texto del sistema — Poppins.',
      children: [
        _TypeItem('displayLarge', AppTypography.displayLarge),
        _TypeItem('displayMedium', AppTypography.displayMedium),
        _TypeItem('displaySmall', AppTypography.displaySmall),
        _TypeItem('headlineLarge', AppTypography.headlineLarge),
        _TypeItem('headlineMedium', AppTypography.headlineMedium),
        _TypeItem('headlineSmall', AppTypography.headlineSmall),
        _TypeItem('titleLarge', AppTypography.titleLarge),
        _TypeItem('titleMedium', AppTypography.titleMedium),
        _TypeItem('titleSmall', AppTypography.titleSmall),
        _TypeItem('bodyLarge', AppTypography.bodyLarge),
        _TypeItem('bodyMedium', AppTypography.bodyMedium),
        _TypeItem('bodySmall', AppTypography.bodySmall),
        _TypeItem('labelLarge', AppTypography.labelLarge),
        _TypeItem('labelMedium', AppTypography.labelMedium),
        _TypeItem('labelSmall', AppTypography.labelSmall),
      ],
    );
  }
}

class _TypeItem extends StatelessWidget {
  const _TypeItem(this.name, this.style);

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              name,
              style: AppTypography.labelSmall.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(child: Text('Poppins', style: style, maxLines: 1)),
        ],
      ),
    );
  }
}
