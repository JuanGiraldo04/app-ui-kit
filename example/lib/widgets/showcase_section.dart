import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({
    super.key,
    required this.title,
    required this.children,
    this.description,
  });

  final String title;
  final String? description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.titleMedium),
        if (description != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            description!,
            style: AppTypography.bodySmall.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        ...children,
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
