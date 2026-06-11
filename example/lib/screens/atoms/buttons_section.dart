import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class ButtonsSection extends StatefulWidget {
  const ButtonsSection({super.key});

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  bool _isLoading = false;

  Future<void> _simulateLoad() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Botones',
      description: 'Variantes, tamaños y estados.',
      children: [
        ShowcaseSubSection(
          label: 'Variantes',
          children: [
            AppButton(
              label: 'Primary',
              onPressed: () {},
              variant: AppButtonVariant.primary,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Secondary',
              onPressed: () {},
              variant: AppButtonVariant.secondary,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Outlined',
              onPressed: () {},
              variant: AppButtonVariant.outlined,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Ghost',
              onPressed: () {},
              variant: AppButtonVariant.ghost,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Tamaños',
          children: [
            AppButton(
              label: 'Small',
              onPressed: () {},
              size: AppButtonSize.small,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Medium',
              onPressed: () {},
              size: AppButtonSize.medium,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Large',
              onPressed: () {},
              size: AppButtonSize.large,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con iconos',
          children: [
            AppButton(
              label: 'Con leading',
              onPressed: () {},
              leading: const Icon(Icons.add, size: 16, color: Colors.white),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: 'Con trailing',
              onPressed: () {},
              trailing: const Icon(
                Icons.arrow_forward,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Estados',
          children: [
            AppButton(
              label: 'Cargando',
              onPressed: _simulateLoad,
              isLoading: _isLoading,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(label: 'Deshabilitado', onPressed: null),
            const SizedBox(height: AppSpacing.sm),
            AppButton(label: 'Full width', onPressed: () {}, isFullWidth: true),
          ],
        ),
      ],
    );
  }
}
