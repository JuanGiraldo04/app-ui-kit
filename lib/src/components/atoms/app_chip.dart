import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

enum AppChipVariant { filled, outlined }

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.variant = AppChipVariant.filled,
    this.leading,
    this.onTap,
    this.onDeleted,
    this.isSelected = false,
  });

  final String label;
  final AppChipVariant variant;
  final Widget? leading;
  final VoidCallback? onTap;
  final VoidCallback? onDeleted;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final bg = switch ((variant, isSelected)) {
      (AppChipVariant.filled, true) => scheme.primaryContainer,
      (AppChipVariant.filled, false) => scheme.surfaceContainerHighest,
      (AppChipVariant.outlined, true) => scheme.primaryContainer,
      (AppChipVariant.outlined, false) => Colors.transparent,
    };

    final labelColor = isSelected ? scheme.primary : scheme.onSurfaceVariant;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: AppRadius.fullBorderRadius,
          border: variant == AppChipVariant.outlined
              ? Border.all(color: isSelected ? scheme.primary : scheme.outline)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: AppSpacing.xs),
            ],
            Text(
              label,
              style: AppTypography.labelMedium.copyWith(color: labelColor),
            ),
            if (onDeleted != null) ...[
              const SizedBox(width: AppSpacing.xs),
              GestureDetector(
                onTap: onDeleted,
                child: Icon(Icons.close, size: 16, color: labelColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
