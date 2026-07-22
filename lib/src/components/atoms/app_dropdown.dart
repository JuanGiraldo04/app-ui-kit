import 'package:flutter/material.dart';

/// Select genérico. El look (fill, bordes, focus) lo hereda del
/// `inputDecorationTheme` del tema, igual que [AppTextField] — así ambos
/// campos se ven consistentes sin repetir tokens en cada uso.
class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.itemLabel,
    this.value,
    this.hint,
    this.onChanged,
  });

  final List<T> items;
  final String Function(T item) itemLabel;
  final T? value;
  final String? hint;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      hint: hint != null ? Text(hint!, overflow: TextOverflow.ellipsis) : null,
      items: [
        for (final item in items)
          DropdownMenuItem<T>(
            value: item,
            child: Text(itemLabel(item), overflow: TextOverflow.ellipsis),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
