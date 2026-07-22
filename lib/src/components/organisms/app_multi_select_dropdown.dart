import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../atoms/app_button.dart';
import '../atoms/app_text_field.dart';
import '../shared/app_dropdown_item_row.dart';
import '../shared/app_field_shell.dart';

/// Select de selección múltiple real (checkboxes, estado `Set<T>`). Es un
/// organism porque orquesta su propio bottom sheet con estado local
/// (selección en progreso + búsqueda) antes de confirmar el resultado —
/// a diferencia de [AppDropdown], que resuelve en un solo tap.
class AppMultiSelectDropdown<T> extends StatelessWidget {
  const AppMultiSelectDropdown({
    super.key,
    required this.items,
    required this.itemLabel,
    required this.values,
    required this.onChanged,
    this.hint,
    this.itemIcon,
    this.itemDescription,
    this.searchable = false,
    this.searchHint,
    this.confirmLabel,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final Set<T> values;
  final ValueChanged<Set<T>> onChanged;
  final String? hint;
  final IconData? Function(T item)? itemIcon;
  final String? Function(T item)? itemDescription;
  final bool searchable;
  final String? searchHint;
  final String? confirmLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final String displayText = values.isEmpty
        ? (hint ?? '')
        : values.map(itemLabel).join(', ');

    return AppFieldShell(
      onTap: () => _openPicker(context),
      child: Row(
        children: [
          Expanded(
            child: Text(
              displayText,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.bodyMedium.copyWith(
                color: values.isEmpty ? scheme.onSurfaceVariant : null,
              ),
            ),
          ),
          Icon(Icons.arrow_drop_down, color: scheme.onSurfaceVariant),
        ],
      ),
    );
  }

  Future<void> _openPicker(BuildContext context) async {
    final Set<T>? result = await showModalBottomSheet<Set<T>>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _MultiSelectSheet<T>(
        items: items,
        itemLabel: itemLabel,
        itemIcon: itemIcon,
        itemDescription: itemDescription,
        initialValues: values,
        searchable: searchable,
        searchHint: searchHint,
        confirmLabel: confirmLabel,
      ),
    );
    if (result != null) onChanged(result);
  }
}

class _MultiSelectSheet<T> extends StatefulWidget {
  const _MultiSelectSheet({
    required this.items,
    required this.itemLabel,
    required this.itemIcon,
    required this.itemDescription,
    required this.initialValues,
    required this.searchable,
    required this.searchHint,
    required this.confirmLabel,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final IconData? Function(T item)? itemIcon;
  final String? Function(T item)? itemDescription;
  final Set<T> initialValues;
  final bool searchable;
  final String? searchHint;
  final String? confirmLabel;

  @override
  State<_MultiSelectSheet<T>> createState() => _MultiSelectSheetState<T>();
}

class _MultiSelectSheetState<T> extends State<_MultiSelectSheet<T>> {
  late final Set<T> _selected = {...widget.initialValues};
  late List<T> _filtered = widget.items;

  void _onSearchChanged(String query) {
    setState(() {
      _filtered = widget.items
          .where(
            (item) => widget
                .itemLabel(item)
                .toLowerCase()
                .contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  void _toggle(T item) {
    setState(() {
      if (_selected.contains(item)) {
        _selected.remove(item);
      } else {
        _selected.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          top: AppSpacing.lg,
          bottom: MediaQuery.viewInsetsOf(context).bottom + AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.searchable) ...[
              AppTextField(
                hint: widget.searchHint ?? 'Buscar...',
                leading: const Icon(Icons.search),
                onChanged: _onSearchChanged,
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final item = _filtered[index];
                  final isSelected = _selected.contains(item);
                  return InkWell(
                    onTap: () => _toggle(item),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm,
                      ),
                      child: AppDropdownItemRow(
                        label: widget.itemLabel(item),
                        icon: widget.itemIcon?.call(item),
                        description: widget.itemDescription?.call(item),
                        trailing: Checkbox(
                          value: isSelected,
                          onChanged: (_) => _toggle(item),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: widget.confirmLabel ?? 'Aplicar',
              isFullWidth: true,
              onPressed: () => Navigator.of(context).pop(_selected),
            ),
          ],
        ),
      ),
    );
  }
}
