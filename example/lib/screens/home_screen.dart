import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../widgets/showcase_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowcaseAppBar(
        title: 'App UI Kit',
        themeMode: themeMode,
        onToggleTheme: onToggleTheme,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: AppRadius.lgBorderRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App UI Kit',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Sistema de diseño construido con Flutter.\nTokens, componentes y temas en un solo paquete.',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.onPrimary.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Contenido', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.lg),
            _CategoryCard(
              icon: Icons.palette_outlined,
              title: 'Tokens',
              description: 'Colores, tipografía, espaciados y radios',
              color: AppColors.info,
            ),
            _CategoryCard(
              icon: Icons.widgets_outlined,
              title: 'Atoms',
              description: 'Botones, text fields, chips y loaders',
              color: AppColors.success,
            ),
            _CategoryCard(
              icon: Icons.view_module_outlined,
              title: 'Molecules',
              description: 'Cards y banners',
              color: AppColors.warning,
            ),
            _CategoryCard(
              icon: Icons.dashboard_outlined,
              title: 'Organisms',
              description: 'Empty states y error states',
              color: AppColors.error,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppRadius.lgBorderRadius,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: AppRadius.mdBorderRadius,
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.titleSmall),
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
