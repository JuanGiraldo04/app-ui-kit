import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../atoms/app_chip.dart';
import '../atoms/app_status_badge.dart';
import '../molecules/app_media_card.dart';
import '../molecules/app_meta_row.dart';

/// Card de evento completa: imagen + categoría superpuesta + título +
/// metadatos (ubicación/fecha) + precio + disponibilidad. Quien consume esta
/// card solo pasa datos — el layout completo vive aquí, no en la app.
class AppEventCard extends StatelessWidget {
  const AppEventCard({
    super.key,
    required this.imageUrl,
    required this.categoryLabel,
    required this.title,
    required this.metaItems,
    required this.priceLabel,
    required this.spotsLabel,
    this.spotsVariant = AppStatusBadgeVariant.neutral,
    this.onTap,
  });

  final String imageUrl;
  final String categoryLabel;
  final String title;
  final List<AppMetaItem> metaItems;
  final String priceLabel;
  final String spotsLabel;
  final AppStatusBadgeVariant spotsVariant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AppMediaCard(
      imageUrl: imageUrl,
      onTap: onTap,
      overlay: AppChip(label: categoryLabel, isSelected: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.titleSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.xs),
          AppMetaRow(items: metaItems),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                priceLabel,
                style: AppTypography.titleMedium.copyWith(
                  color: scheme.primary,
                ),
              ),
              AppStatusBadge(label: spotsLabel, variant: spotsVariant),
            ],
          ),
        ],
      ),
    );
  }
}
