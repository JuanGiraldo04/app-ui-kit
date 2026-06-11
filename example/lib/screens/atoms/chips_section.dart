import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class ChipsSection extends StatefulWidget {
  const ChipsSection({super.key});

  @override
  State<ChipsSection> createState() => _ChipsSectionState();
}

class _ChipsSectionState extends State<ChipsSection> {
  String _selectedFilled = 'Flutter';
  String _selectedOutlined = 'Dart';

  @override
  Widget build(BuildContext context) {
    const options = ['Flutter', 'Dart', 'Firebase', 'Riverpod'];

    return ShowcaseSection(
      title: 'Chips',
      description: 'Variantes y estados de selección.',
      children: [
        ShowcaseSubSection(
          label: 'Filled',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: options
                  .map(
                    (o) => AppChip(
                      label: o,
                      variant: AppChipVariant.filled,
                      isSelected: _selectedFilled == o,
                      onTap: () => setState(() => _selectedFilled = o),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Outlined',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: options
                  .map(
                    (o) => AppChip(
                      label: o,
                      variant: AppChipVariant.outlined,
                      isSelected: _selectedOutlined == o,
                      onTap: () => setState(() => _selectedOutlined = o),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con leading',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              children: const [
                AppChip(
                  label: 'Favorito',
                  leading: Icon(Icons.favorite, size: 14),
                ),
                AppChip(
                  label: 'Ubicación',
                  leading: Icon(Icons.location_on, size: 14),
                ),
                AppChip(label: 'Filtro', leading: Icon(Icons.tune, size: 14)),
              ],
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con delete',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                AppChip(label: 'Eliminar', onDeleted: () {}),
                AppChip(
                  label: 'Quitar',
                  variant: AppChipVariant.outlined,
                  onDeleted: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
