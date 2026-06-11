import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class LoadersSection extends StatelessWidget {
  const LoadersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Loaders',
      description: 'Tamaños y colores.',
      children: [
        ShowcaseSubSection(
          label: 'Tamaños',
          children: [
            Row(
              spacing: AppSpacing.xl,
              children: const [
                Column(
                  children: [
                    AppLoader(size: AppLoaderSize.small),
                    SizedBox(height: AppSpacing.sm),
                    Text('small'),
                  ],
                ),
                Column(
                  children: [
                    AppLoader(size: AppLoaderSize.medium),
                    SizedBox(height: AppSpacing.sm),
                    Text('medium'),
                  ],
                ),
                Column(
                  children: [
                    AppLoader(size: AppLoaderSize.large),
                    SizedBox(height: AppSpacing.sm),
                    Text('large'),
                  ],
                ),
              ],
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Colores',
          children: [
            Row(
              spacing: AppSpacing.xl,
              children: const [
                AppLoader(color: AppColors.primary),
                AppLoader(color: AppColors.secondary),
                AppLoader(color: AppColors.success),
                AppLoader(color: AppColors.error),
                AppLoader(color: AppColors.warning),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
