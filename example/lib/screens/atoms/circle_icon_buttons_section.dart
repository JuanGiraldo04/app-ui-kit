import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class CircleIconButtonsSection extends StatelessWidget {
  const CircleIconButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Circle icon buttons',
      description:
          'Controles circulares para overlays sobre imagen (back, share).',
      children: [
        ShowcaseSubSection(
          label: 'Sobre una imagen',
          children: [
            ClipRRect(
              borderRadius: AppRadius.lgBorderRadius,
              child: SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ColoredBox(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.image_outlined,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppSpacing.sm,
                      left: AppSpacing.sm,
                      child: AppCircleIconButton(
                        icon: Icons.arrow_back,
                        onTap: () {},
                      ),
                    ),
                    Positioned(
                      top: AppSpacing.sm,
                      right: AppSpacing.sm,
                      child: AppCircleIconButton(
                        icon: Icons.share_outlined,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
