import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class AvatarsSection extends StatelessWidget {
  const AvatarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Avatars',
      description: 'Prioridad: imagen > iniciales > ícono de fallback.',
      children: [
        ShowcaseSubSection(
          label: 'Ícono (default)',
          children: const [AppAvatar()],
        ),
        ShowcaseSubSection(
          label: 'Iniciales',
          children: const [AppAvatar(initials: 'AT')],
        ),
        ShowcaseSubSection(
          label: 'Imagen',
          children: const [
            AppAvatar(imageUrl: 'https://picsum.photos/seed/avatar-1/200/200'),
          ],
        ),
        ShowcaseSubSection(
          label: 'Radio más grande (radius: 32)',
          children: const [AppAvatar(radius: 32)],
        ),
      ],
    );
  }
}
