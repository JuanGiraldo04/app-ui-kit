import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class KeyValueRowsSection extends StatelessWidget {
  const KeyValueRowsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Key-value rows',
      description: 'Fila label/valor para resúmenes y desgloses.',
      children: [
        ShowcaseSubSection(
          label: 'Normal',
          children: const [
            AppKeyValueRow(label: 'Precio por entrada', value: '\$45.000'),
            SizedBox(height: AppSpacing.sm),
            AppKeyValueRow(label: 'Cantidad', value: '× 3'),
          ],
        ),
        ShowcaseSubSection(
          label: 'Destacada (emphasize)',
          children: const [
            AppKeyValueRow(label: 'Total', value: '\$135.000', emphasize: true),
          ],
        ),
      ],
    );
  }
}
