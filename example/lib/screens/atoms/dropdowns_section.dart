import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class DropdownsSection extends StatefulWidget {
  const DropdownsSection({super.key});

  @override
  State<DropdownsSection> createState() => _DropdownsSectionState();
}

class _DropdownsSectionState extends State<DropdownsSection> {
  String? _selectedCity;

  static const _cities = ['Bogotá', 'Medellín', 'Cali', 'Barranquilla'];

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Dropdowns',
      description: 'Select genérico, mismo estilo que AppTextField.',
      children: [
        ShowcaseSubSection(
          label: 'Interactivo',
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
      ],
    );
  }
}
