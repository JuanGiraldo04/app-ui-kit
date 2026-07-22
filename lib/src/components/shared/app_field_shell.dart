import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// Envoltorio tap-able con el mismo look (fill, bordes) que
/// [DropdownButtonFormField]/[AppTextField], vía [InputDecorator] — así
/// campos con interacción custom (bottom sheet, date picker) se ven
/// consistentes con los campos nativos sin repetir tokens en cada uno.
class AppFieldShell extends StatelessWidget {
  const AppFieldShell({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppRadius.smBorderRadius,
      onTap: onTap,
      child: InputDecorator(decoration: const InputDecoration(), child: child),
    );
  }
}
