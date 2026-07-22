import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class _Category {
  const _Category(this.label, this.icon, this.description);

  final String label;
  final IconData icon;
  final String description;
}

const _categories = [
  _Category(
    'Conciertos',
    Icons.music_note,
    'Música en vivo, todos los géneros',
  ),
  _Category('Deportes', Icons.sports_soccer, 'Fútbol, baloncesto y más'),
  _Category('Teatro', Icons.theater_comedy, 'Obras, comedia y stand-up'),
  _Category('Conferencias', Icons.mic, 'Charlas y eventos corporativos'),
  _Category('Familiar', Icons.family_restroom, 'Planes para todas las edades'),
];

class MultiSelectDropdownsSection extends StatefulWidget {
  const MultiSelectDropdownsSection({super.key});

  @override
  State<MultiSelectDropdownsSection> createState() =>
      _MultiSelectDropdownsSectionState();
}

class _MultiSelectDropdownsSectionState
    extends State<MultiSelectDropdownsSection> {
  Set<_Category> _basic = {};
  Set<_Category> _withIcons = {};
  Set<_Category> _searchable = {};

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Multi-select dropdowns',
      description:
          'Selección múltiple real con checkboxes y estado Set<T>. Toca '
          'para abrir el bottom sheet, marca varios items y confirma.',
      children: [
        ShowcaseSubSection(
          label: 'Básico (múltiples checkboxes)',
          children: [
            AppMultiSelectDropdown<_Category>(
              items: _categories,
              itemLabel: (c) => c.label,
              values: _basic,
              hint: 'Selecciona categorías',
              onChanged: (values) => setState(() => _basic = values),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con ícono y descripción por item',
          children: [
            AppMultiSelectDropdown<_Category>(
              items: _categories,
              itemLabel: (c) => c.label,
              itemIcon: (c) => c.icon,
              itemDescription: (c) => c.description,
              values: _withIcons,
              hint: 'Selecciona categorías',
              onChanged: (values) => setState(() => _withIcons = values),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con barra de búsqueda',
          children: [
            AppMultiSelectDropdown<_Category>(
              items: _categories,
              itemLabel: (c) => c.label,
              itemIcon: (c) => c.icon,
              itemDescription: (c) => c.description,
              values: _searchable,
              hint: 'Buscar categorías',
              searchable: true,
              searchHint: 'Buscar categoría...',
              onChanged: (values) => setState(() => _searchable = values),
            ),
          ],
        ),
      ],
    );
  }
}
