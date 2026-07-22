import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class TicketCardsSection extends StatelessWidget {
  const TicketCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Ticket cards',
      description:
          'Código + ícono de QR. Toca la card para ver el QR ampliado — el '
          'diálogo ya viene incluido en el componente.',
      children: [
        ShowcaseSubSection(
          label: 'Ticket 1 de 2',
          children: const [
            AppTicketCard(code: 'AB12-CD34-EF56', label: 'Ticket 1 de 2'),
          ],
        ),
      ],
    );
  }
}
