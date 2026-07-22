import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../atoms/app_button.dart';
import 'app_banner.dart';

/// Barra de acción inferior: banner de error opcional + botón principal de
/// ancho completo, con el padding/SafeArea ya resueltos. Reemplaza el bloque
/// "banner condicional + AppButton" que se repetía a mano al final de varias
/// pantallas (checkout, detalle de evento, etc).
class AppBottomActionBar extends StatelessWidget {
  const AppBottomActionBar({
    super.key,
    required this.buttonLabel,
    this.onPressed,
    this.isLoading = false,
    this.errorMessage,
  });

  final String buttonLabel;
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (errorMessage != null) ...[
              AppBanner(
                variant: AppBannerVariant.error,
                message: errorMessage!,
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            AppButton(
              label: buttonLabel,
              isFullWidth: true,
              isLoading: isLoading,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
