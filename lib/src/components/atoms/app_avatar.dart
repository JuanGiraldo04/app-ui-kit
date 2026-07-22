import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// Avatar circular. Muestra, en orden de prioridad: imagen (`imageUrl`),
/// iniciales (`initials`), o un ícono de fallback. Colores siempre del tema
/// (`primaryContainer`/`primary`), nunca hardcodeados.
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.icon = Icons.person,
    this.radius = 20,
  });

  final String? imageUrl;
  final String? initials;
  final IconData icon;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: scheme.primaryContainer,
        backgroundImage: NetworkImage(imageUrl!),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: scheme.primaryContainer,
      child: initials != null && initials!.isNotEmpty
          ? Text(
              initials!,
              style: AppTypography.labelLarge.copyWith(color: scheme.primary),
            )
          : Icon(icon, color: scheme.primary, size: radius),
    );
  }
}
