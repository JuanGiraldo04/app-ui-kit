import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// Botón circular semitransparente, pensado para controles sobre una imagen
/// (back, share, favorito) donde el fondo de la imagen hace impredecible el
/// contraste del tema. Por defecto usa un scrim oscuro + ícono blanco (el
/// patrón estándar para controles "on image"); ambos son sobreescribibles.
class AppCircleIconButton extends StatelessWidget {
  const AppCircleIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.size = 20,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.black.withValues(alpha: 0.35),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Icon(icon, color: iconColor ?? Colors.white, size: size),
        ),
      ),
    );
  }
}
