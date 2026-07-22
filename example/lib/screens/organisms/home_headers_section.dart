import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class HomeHeadersSection extends StatelessWidget {
  const HomeHeadersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Home headers',
      description:
          'Saludo + avatar + búsqueda sobre el tema oscuro. Todo el '
          'theming y la composición viven en el kit.',
      children: [
        ShowcaseSubSection(
          label: 'Con avatar e input de búsqueda',
          children: [
            ClipRRect(
              borderRadius: AppRadius.mdBorderRadius,
              child: AppHomeHeader(
                greeting: 'Hola,',
                title: 'Juan 👋',
                searchHint: 'Buscar eventos...',
                onAvatarTap: () {},
                onSearchChanged: (_) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
