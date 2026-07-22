import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../atoms/app_avatar.dart';
import '../atoms/app_loader.dart';
import 'app_card.dart';

/// Card de cabecera de perfil: avatar + nombre + email, con sus propios
/// estados de carga y error — el consumidor solo pasa el `AsyncValue`
/// mapeado a estos campos, sin ramificar `when()` a mano.
class AppProfileHeaderCard extends StatelessWidget {
  const AppProfileHeaderCard({
    super.key,
    this.avatarUrl,
    this.name,
    this.email,
    this.isLoading = false,
    this.errorMessage,
  });

  final String? avatarUrl;
  final String? name;
  final String? email;
  final bool isLoading;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppCard(
      child: Row(
        children: [
          AppAvatar(imageUrl: avatarUrl, radius: 24),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: _buildContent(scheme)),
        ],
      ),
    );
  }

  Widget _buildContent(ColorScheme scheme) {
    // Expanded impone un ancho tight sobre su hijo; sin Align, el SizedBox
    // cuadrado de AppLoader se estira a ese ancho y el círculo sale ovalado.
    if (isLoading) {
      return const Align(alignment: Alignment.centerLeft, child: AppLoader());
    }

    if (errorMessage != null) {
      return Text(errorMessage!, style: AppTypography.bodyMedium);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null) Text(name!, style: AppTypography.titleMedium),
        if (email != null)
          Text(
            email!,
            style: AppTypography.bodySmall.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}
