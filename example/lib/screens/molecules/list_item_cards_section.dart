import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:example/widgets/showcase_subsection.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';

class ListItemCardsSection extends StatelessWidget {
  const ListItemCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'List item cards',
      description:
          'Card horizontal: thumbnail + título + líneas secundarias + '
          'widget final opcional. Todo dato, sin Widget libre.',
      children: [
        ShowcaseSubSection(
          label: 'Con trailing (badge) y línea de detalle',
          children: [
            const AppListItemCard(
              imageUrl: 'https://picsum.photos/seed/list-item-1/200/200',
              title: 'Festival de Rock en el Parque',
              titleMaxLines: 1,
              subtitleLines: ['12 dic, 8:00 PM'],
              detailLine: '3 entradas · \$255.000',
              trailing: AppStatusBadge(
                label: 'Confirmada',
                variant: AppStatusBadgeVariant.success,
              ),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Varias líneas secundarias, sin trailing',
          children: [
            const AppListItemCard(
              imageUrl: 'https://picsum.photos/seed/list-item-2/200/200',
              title: 'Final de la Copa Regional',
              titleMaxLines: 2,
              subtitleLines: ['20 dic, 3:00 PM', 'Medellín'],
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Thumbnail más grande (imageSize: 64), título sin límite',
          children: [
            AppListItemCard(
              imageUrl: 'https://picsum.photos/seed/list-item-3/200/200',
              imageSize: 64,
              title: 'Conferencia anual de tecnología y negocios',
              subtitleLines: const ['20 dic, 3:00 PM', 'Bogotá'],
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
