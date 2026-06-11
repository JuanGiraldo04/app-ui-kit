import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class ErrorStatesSection extends StatelessWidget {
  const ErrorStatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Error States',
      description: 'Estados de error con y sin reintento.',
      children: [
        ShowcaseSubSection(
          label: 'Sin retry',
          children: const [
            AppErrorState(message: 'No se pudo cargar la información.'),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con retry',
          children: [
            AppErrorState(
              message: 'No se pudo cargar la información.',
              onRetry: () {},
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con título custom',
          children: [
            AppErrorState(
              title: 'Sin conexión',
              message: 'Verifica tu conexión e intenta de nuevo.',
              onRetry: () {},
              retryLabel: 'Reintentar',
            ),
          ],
        ),
      ],
    );
  }
}
