import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

enum AppCardVariant { elevated, outlined, filled }

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.outlined,
    this.padding,
    this.onTap,
  });

  final Widget child;
  final AppCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final (bg, border, elevation) = switch (variant) {
      AppCardVariant.elevated => (
        scheme.surface,
        Border.all(color: Colors.transparent),
        2.0,
      ),
      AppCardVariant.outlined => (
        scheme.surface,
        Border.all(color: scheme.outline),
        0.0,
      ),
      AppCardVariant.filled => (
        scheme.surfaceContainerHighest,
        Border.all(color: Colors.transparent),
        0.0,
      ),
    };

    return Material(
      color: bg,
      elevation: elevation,
      borderRadius: AppRadius.lgBorderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.lgBorderRadius,
        child: Container(
          padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            borderRadius: AppRadius.lgBorderRadius,
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
