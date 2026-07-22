import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class BottomActionBarsSection extends StatelessWidget {
  const BottomActionBarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Bottom action bars',
      description:
          'Banner de error opcional + botón principal, con el padding/'
          'SafeArea ya resueltos. Pensada para el pie de pantallas de '
          'confirmación (checkout, reserva, etc).',
      children: [
        ShowcaseSubSection(
          label: 'Normal',
          children: [
            AppBottomActionBar(
              buttonLabel: 'Confirmar compra',
              onPressed: () {},
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Cargando',
          children: [
            const AppBottomActionBar(
              buttonLabel: 'Confirmar compra',
              isLoading: true,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con error',
          children: [
            AppBottomActionBar(
              buttonLabel: 'Confirmar compra',
              errorMessage: 'No pudimos procesar tu compra. Intenta de nuevo.',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
