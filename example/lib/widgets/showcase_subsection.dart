import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ShowcaseSubSection extends StatelessWidget {
  const ShowcaseSubSection({
    super.key,
    required this.label,
    required this.children,
  });

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...children,
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
