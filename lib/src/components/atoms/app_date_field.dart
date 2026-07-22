import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../shared/app_field_shell.dart';

/// Selector de fecha genérico. El look lo hereda del `inputDecorationTheme`
/// del tema, igual que [AppTextField]/[AppDropdown]. Internamente abre el
/// `showDatePicker` nativo — [dateLabel] permite formatear la fecha
/// seleccionada según el locale/necesidad de quien lo consuma.
class AppDateField extends StatelessWidget {
  const AppDateField({
    super.key,
    this.value,
    this.hint,
    this.onChanged,
    this.firstDate,
    this.lastDate,
    this.dateLabel,
  });

  final DateTime? value;
  final String? hint;
  final ValueChanged<DateTime?>? onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String Function(DateTime date)? dateLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final String? label = value != null
        ? (dateLabel?.call(value!) ?? _defaultFormat(value!))
        : null;

    return AppFieldShell(
      onTap: () => _pickDate(context),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 18,
            color: scheme.onSurfaceVariant,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              label ?? hint ?? '',
              overflow: TextOverflow.ellipsis,
              style: AppTypography.bodyMedium.copyWith(
                color: label == null ? scheme.onSurfaceVariant : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _defaultFormat(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/'
      '${date.year}';

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: value ?? DateTime.now(),
      firstDate:
          firstDate ?? DateTime.now().subtract(const Duration(days: 365)),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) onChanged?.call(picked);
  }
}
