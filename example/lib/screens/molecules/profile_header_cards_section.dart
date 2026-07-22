import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class ProfileHeaderCardsSection extends StatelessWidget {
  const ProfileHeaderCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Profile header cards',
      description:
          'Avatar + nombre + email, con sus propios estados de carga y '
          'error incluidos.',
      children: [
        ShowcaseSubSection(
          label: 'Con datos',
          children: [
            const AppProfileHeaderCard(
              name: 'Juan Giraldo',
              email: 'juan.giraldo@ejemplo.com',
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Cargando',
          children: [const AppProfileHeaderCard(isLoading: true)],
        ),
        ShowcaseSubSection(
          label: 'Con error',
          children: [
            const AppProfileHeaderCard(
              errorMessage: 'No pudimos cargar tu perfil.',
            ),
          ],
        ),
      ],
    );
  }
}
