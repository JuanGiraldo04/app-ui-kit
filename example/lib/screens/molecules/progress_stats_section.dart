import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:example/widgets/showcase_subsection.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class ProgressStatsSection extends StatelessWidget {
  const ProgressStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Progress stats',
      description:
          'Fila label/valor + barra de progreso coloreada por severidad.',
      children: [
        ShowcaseSubSection(
          label: 'Success (cupos altos)',
          children: [
            AppProgressStat(
              label: 'Cupos disponibles',
              value: '420 / 500',
              progress: 420 / 500,
              variant: AppStatusBadgeVariant.success,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Warning (cupos bajos)',
          children: [
            AppProgressStat(
              label: 'Cupos disponibles',
              value: '40 / 500',
              progress: 40 / 500,
              variant: AppStatusBadgeVariant.warning,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Error (agotado)',
          children: [
            AppProgressStat(
              label: 'Cupos disponibles',
              value: '0 / 500',
              progress: 0,
              variant: AppStatusBadgeVariant.error,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Neutral (default)',
          children: [
            AppProgressStat(label: 'Progreso', value: '65%', progress: 0.65),
          ],
        ),
      ],
    );
  }
}
