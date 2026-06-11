import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class ColorsSection extends StatelessWidget {
  const ColorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Colores',
      description: 'Paleta completa del sistema.',
      children: [
        _ColorGroup(
          label: 'Primario',
          colors: const [
            _ColorItem('primary', AppColors.primary),
            _ColorItem('primaryContainer', AppColors.primaryContainer),
            _ColorItem('onPrimary', AppColors.onPrimary, dark: true),
          ],
        ),
        _ColorGroup(
          label: 'Secundario',
          colors: const [
            _ColorItem('secondary', AppColors.secondary),
            _ColorItem('secondaryContainer', AppColors.secondaryContainer),
            _ColorItem('onSecondary', AppColors.onSecondary, dark: true),
          ],
        ),
        _ColorGroup(
          label: 'Semánticos',
          colors: const [
            _ColorItem('error', AppColors.error),
            _ColorItem('warning', AppColors.warning),
            _ColorItem('success', AppColors.success),
            _ColorItem('info', AppColors.info),
          ],
        ),
        _ColorGroup(
          label: 'Neutros — Light',
          colors: const [
            _ColorItem(
              'backgroundLight',
              AppColors.backgroundLight,
              dark: true,
            ),
            _ColorItem('surfaceLight', AppColors.surfaceLight, dark: true),
            _ColorItem(
              'surfaceVariantLight',
              AppColors.surfaceVariantLight,
              dark: true,
            ),
            _ColorItem('outlineLight', AppColors.outlineLight, dark: true),
          ],
        ),
        _ColorGroup(
          label: 'Neutros — Dark',
          colors: const [
            _ColorItem('backgroundDark', AppColors.backgroundDark),
            _ColorItem('surfaceDark', AppColors.surfaceDark),
            _ColorItem('surfaceVariantDark', AppColors.surfaceVariantDark),
            _ColorItem('outlineDark', AppColors.outlineDark),
          ],
        ),
        _ColorGroup(
          label: 'Texto — Light',
          colors: const [
            _ColorItem(
              'textPrimaryLight',
              AppColors.textPrimaryLight,
              dark: true,
            ),
            _ColorItem(
              'textSecondaryLight',
              AppColors.textSecondaryLight,
              dark: true,
            ),
            _ColorItem(
              'textDisabledLight',
              AppColors.textDisabledLight,
              dark: true,
            ),
          ],
        ),
        _ColorGroup(
          label: 'Texto — Dark',
          colors: const [
            _ColorItem('textPrimaryDark', AppColors.textPrimaryDark),
            _ColorItem('textSecondaryDark', AppColors.textSecondaryDark),
            _ColorItem('textDisabledDark', AppColors.textDisabledDark),
          ],
        ),
      ],
    );
  }
}

class _ColorGroup extends StatelessWidget {
  const _ColorGroup({required this.label, required this.colors});

  final String label;
  final List<_ColorItem> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.labelMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: colors,
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem(this.name, this.color, {this.dark = false});

  final String name;
  final Color color;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppRadius.mdBorderRadius,
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        SizedBox(
          width: 72,
          child: Text(
            name,
            style: AppTypography.labelSmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
