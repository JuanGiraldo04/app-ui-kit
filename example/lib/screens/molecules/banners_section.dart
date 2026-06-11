import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class BannersSection extends StatelessWidget {
  const BannersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Banners',
      description: 'Mensajes de estado y notificaciones.',
      children: [
        ShowcaseSubSection(
          label: 'Variantes',
          children: [
            const AppBanner(
              variant: AppBannerVariant.info,
              title: 'Información',
              message: 'Este es un mensaje informativo para el usuario.',
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppBanner(
              variant: AppBannerVariant.success,
              title: 'Éxito',
              message: 'La operación se completó correctamente.',
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppBanner(
              variant: AppBannerVariant.warning,
              title: 'Advertencia',
              message: 'Revisa los datos antes de continuar.',
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppBanner(
              variant: AppBannerVariant.error,
              title: 'Error',
              message: 'Ocurrió un problema. Intenta de nuevo.',
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Sin título',
          children: const [
            AppBanner(
              variant: AppBannerVariant.info,
              message: 'Banner sin título, solo mensaje.',
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con dismiss',
          children: [
            AppBanner(
              variant: AppBannerVariant.warning,
              title: 'Descartable',
              message: 'Toca la X para cerrar este banner.',
              onDismiss: () {},
            ),
          ],
        ),
      ],
    );
  }
}
