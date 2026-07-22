import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../tokens/tokens.dart';
import '../atoms/app_avatar.dart';
import '../atoms/app_text_field.dart';

/// Cabecera de pantalla principal: saludo + nombre, avatar tap-able y una
/// barra de búsqueda, sobre el tema oscuro. El consumidor solo pasa datos —
/// el theming, la composición y el layout viven aquí.
class AppHomeHeader extends StatelessWidget {
  const AppHomeHeader({
    super.key,
    required this.greeting,
    required this.title,
    this.avatarUrl,
    this.onAvatarTap,
    this.searchHint,
    this.onSearchChanged,
  });

  final String greeting;
  final String title;
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;
  final String? searchHint;
  final ValueChanged<String>? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.secondary,
      child: SafeArea(
        bottom: false,
        child: Theme(
          data: AppTheme.dark(),
          child: Builder(
            builder: (BuildContext context) {
              final scheme = Theme.of(context).colorScheme;

              return Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.lg,
                  AppSpacing.xl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              greeting,
                              style: AppTypography.bodyMedium.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              title,
                              style: AppTypography.headlineSmall.copyWith(
                                color: scheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: onAvatarTap,
                          child: AppAvatar(imageUrl: avatarUrl),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppTextField(
                      hint: searchHint,
                      leading: const Icon(Icons.search),
                      onChanged: onSearchChanged,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
