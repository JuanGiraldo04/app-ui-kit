import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class EventCardsSection extends StatelessWidget {
  const EventCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Event cards',
      description:
          'Card de evento completa: imagen, categoría, título, metadatos, '
          'precio y disponibilidad. Todo el layout vive en el kit — quien '
          'consume solo pasa datos.',
      children: [
        ShowcaseSubSection(
          label: 'Con cupos altos',
          children: [
            AppEventCard(
              imageUrl: 'https://picsum.photos/seed/event-card-1/800/450',
              categoryLabel: 'Conciertos',
              title: 'Festival de Rock en el Parque',
              metaItems: const [
                AppMetaItem(
                  icon: Icons.location_on_outlined,
                  label: 'Bogotá',
                  expanded: true,
                ),
                AppMetaItem(
                  icon: Icons.calendar_today_outlined,
                  label: '12 dic',
                ),
              ],
              priceLabel: '\$85.000',
              spotsLabel: '120 cupos',
              spotsVariant: AppStatusBadgeVariant.success,
              onTap: () {},
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con cupos agotados',
          children: [
            AppEventCard(
              imageUrl: 'https://picsum.photos/seed/event-card-2/800/450',
              categoryLabel: 'Deportes',
              title: 'Final de la Copa Regional',
              metaItems: const [
                AppMetaItem(
                  icon: Icons.location_on_outlined,
                  label: 'Medellín',
                  expanded: true,
                ),
                AppMetaItem(
                  icon: Icons.calendar_today_outlined,
                  label: '20 dic',
                ),
              ],
              priceLabel: '\$45.000',
              spotsLabel: '0 cupos',
              spotsVariant: AppStatusBadgeVariant.error,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
