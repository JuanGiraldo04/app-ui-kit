import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class MetaRowsSection extends StatelessWidget {
  const MetaRowsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Meta rows',
      description:
          'Fila de ícono + etiqueta reusable (ubicación, fecha, etc). El '
          'item con expanded:true absorbe el espacio libre y trunca.',
      children: [
        ShowcaseSubSection(
          label: 'Ubicación + fecha',
          children: [
            const AppMetaRow(
              items: [
                AppMetaItem(
                  icon: Icons.location_on_outlined,
                  label: 'Bogotá, Colombia',
                  expanded: true,
                ),
                AppMetaItem(
                  icon: Icons.calendar_today_outlined,
                  label: '12 dic, 8:00 PM',
                ),
              ],
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Un solo item',
          children: [
            const AppMetaRow(
              items: [
                AppMetaItem(
                  icon: Icons.people_outline,
                  label: '120 asistentes confirmados',
                  expanded: true,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
