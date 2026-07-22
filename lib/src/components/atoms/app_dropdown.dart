import 'package:flutter/material.dart';

import '../../tokens/tokens.dart';
import '../shared/app_dropdown_item_row.dart';
import '../shared/app_field_shell.dart';
import 'app_text_field.dart';

/// Select genérico. El look (fill, bordes, focus) lo hereda del
/// `inputDecorationTheme` del tema, igual que [AppTextField] — así ambos
/// campos se ven consistentes sin repetir tokens en cada uso.
///
/// Por defecto usa el menú nativo de [DropdownButtonFormField]. Si se pasa
/// [itemIcon] y/o [itemDescription], cada item se renderiza con esa
/// información extra. Si [searchable] es `true`, el campo abre un bottom
/// sheet con una barra de búsqueda y un check junto al item seleccionado —
/// el menú nativo no soporta ni búsqueda ni layouts custom de esa forma.
class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.itemLabel,
    this.value,
    this.hint,
    this.onChanged,
    this.itemIcon,
    this.itemDescription,
    this.searchable = false,
    this.searchHint,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final T? value;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final IconData? Function(T item)? itemIcon;
  final String? Function(T item)? itemDescription;
  final bool searchable;
  final String? searchHint;

  @override
  Widget build(BuildContext context) {
    if (searchable) {
      return _SearchableAppDropdownField<T>(
        items: items,
        itemLabel: itemLabel,
        value: value,
        hint: hint,
        onChanged: onChanged,
        itemIcon: itemIcon,
        itemDescription: itemDescription,
        searchHint: searchHint,
      );
    }

    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      itemHeight: itemDescription != null ? null : kMinInteractiveDimension,
      hint: hint != null ? Text(hint!, overflow: TextOverflow.ellipsis) : null,
      items: [
        for (final item in items)
          DropdownMenuItem<T>(
            value: item,
            child: AppDropdownItemRow(
              label: itemLabel(item),
              icon: itemIcon?.call(item),
              description: itemDescription?.call(item),
            ),
          ),
      ],
      onChanged: onChanged,
    );
  }
}

class _SearchableAppDropdownField<T> extends StatelessWidget {
  const _SearchableAppDropdownField({
    required this.items,
    required this.itemLabel,
    required this.value,
    required this.hint,
    required this.onChanged,
    required this.itemIcon,
    required this.itemDescription,
    required this.searchHint,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final T? value;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final IconData? Function(T item)? itemIcon;
  final String? Function(T item)? itemDescription;
  final String? searchHint;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final String? selectedLabel = value != null ? itemLabel(value as T) : null;

    return AppFieldShell(
      onTap: () => _openPicker(context),
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedLabel ?? hint ?? '',
              overflow: TextOverflow.ellipsis,
              style: AppTypography.bodyMedium.copyWith(
                color: selectedLabel == null ? scheme.onSurfaceVariant : null,
              ),
            ),
          ),
          Icon(Icons.arrow_drop_down, color: scheme.onSurfaceVariant),
        ],
      ),
    );
  }

  Future<void> _openPicker(BuildContext context) async {
    final T? result = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _AppDropdownSearchSheet<T>(
        items: items,
        itemLabel: itemLabel,
        itemIcon: itemIcon,
        itemDescription: itemDescription,
        value: value,
        searchHint: searchHint,
      ),
    );
    if (result != null) onChanged?.call(result);
  }
}

class _AppDropdownSearchSheet<T> extends StatefulWidget {
  const _AppDropdownSearchSheet({
    required this.items,
    required this.itemLabel,
    required this.itemIcon,
    required this.itemDescription,
    required this.value,
    required this.searchHint,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final IconData? Function(T item)? itemIcon;
  final String? Function(T item)? itemDescription;
  final T? value;
  final String? searchHint;

  @override
  State<_AppDropdownSearchSheet<T>> createState() =>
      _AppDropdownSearchSheetState<T>();
}

class _AppDropdownSearchSheetState<T>
    extends State<_AppDropdownSearchSheet<T>> {
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

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

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
            AppTextField(
              hint: widget.searchHint ?? 'Buscar...',
              leading: const Icon(Icons.search),
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final item = _filtered[index];
                  final isSelected = item == widget.value;
                  return InkWell(
                    onTap: () => Navigator.of(context).pop(item),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm,
                      ),
                      child: AppDropdownItemRow(
                        label: widget.itemLabel(item),
                        icon: widget.itemIcon?.call(item),
                        description: widget.itemDescription?.call(item),
                        trailing: isSelected
                            ? Icon(Icons.check, size: 18, color: scheme.primary)
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
