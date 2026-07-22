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
];

class DropdownsSection extends StatefulWidget {
  const DropdownsSection({super.key});

  @override
  State<DropdownsSection> createState() => _DropdownsSectionState();
}

class _DropdownsSectionState extends State<DropdownsSection> {
  String? _selectedCity;
  _Category? _selectedCategoryWithIcon;
  _Category? _selectedCategoryWithDescription;
  _Category? _selectedSearchable;

  static const _cities = ['Bogotá', 'Medellín', 'Cali', 'Barranquilla'];

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Dropdowns',
      description:
          'Select genérico, mismo estilo que AppTextField. Soporta '
          'íconos, descripciones opcionales y un modo con búsqueda.',
      children: [
        ShowcaseSubSection(
          label: 'Básico',
          children: [
            AppDropdown<String>(
              items: _cities,
              itemLabel: (city) => city,
              value: _selectedCity,
              hint: 'Todas las ciudades',
              onChanged: (city) => setState(() => _selectedCity = city),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con ícono por item',
          children: [
            AppDropdown<_Category>(
              items: _categories,
              itemLabel: (c) => c.label,
              itemIcon: (c) => c.icon,
              value: _selectedCategoryWithIcon,
              hint: 'Selecciona una categoría',
              onChanged: (c) => setState(() => _selectedCategoryWithIcon = c),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con ícono y descripción opcional',
          children: [
            AppDropdown<_Category>(
              items: _categories,
              itemLabel: (c) => c.label,
              itemIcon: (c) => c.icon,
              itemDescription: (c) => c.description,
              value: _selectedCategoryWithDescription,
              hint: 'Selecciona una categoría',
              onChanged: (c) =>
                  setState(() => _selectedCategoryWithDescription = c),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con búsqueda (bottom sheet + check de selección)',
          children: [
            AppDropdown<_Category>(
              items: _categories,
              itemLabel: (c) => c.label,
              itemIcon: (c) => c.icon,
              itemDescription: (c) => c.description,
              value: _selectedSearchable,
              hint: 'Buscar categoría',
              searchable: true,
              searchHint: 'Buscar categoría...',
              onChanged: (c) => setState(() => _selectedSearchable = c),
            ),
          ],
        ),
      ],
    );
  }
}
