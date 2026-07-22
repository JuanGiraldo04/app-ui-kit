import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';

/// Selector +/- de cantidad. Data-agnóstica: solo muestra `value` y dispara
/// `onDecrement`/`onIncrement`. El consumidor decide los límites (min/max)
/// pasando `null` en el callback correspondiente para deshabilitar ese lado,
/// igual que [AppButton.onPressed]. Si se pasa [label], el stepper se dueña
/// de su propia fila label+control (igual que [AppTextField]/[AppDropdown]).
class AppStepper extends StatelessWidget {
  const AppStepper({
    super.key,
    required this.value,
    this.onDecrement,
    this.onIncrement,
    this.label,
  });

  final int value;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final controls = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: onDecrement,
        ),
        SizedBox(
          width: 24,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: AppTypography.titleMedium,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: onIncrement,
        ),
      ],
    );

    if (label == null) return controls;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label!, style: AppTypography.bodyMedium),
        controls,
      ],
    );
  }
}
