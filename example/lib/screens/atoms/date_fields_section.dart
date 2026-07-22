import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class DateFieldsSection extends StatefulWidget {
  const DateFieldsSection({super.key});

  @override
  State<DateFieldsSection> createState() => _DateFieldsSectionState();
}

class _DateFieldsSectionState extends State<DateFieldsSection> {
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Date fields',
      description:
          'Selector de fecha genérico, mismo estilo que AppDropdown/'
          'AppTextField. Abre el date picker nativo al tocar.',
      children: [
        ShowcaseSubSection(
          label: 'Interactivo',
          children: [
            AppDateField(
              value: _date,
              hint: 'Selecciona una fecha',
              onChanged: (date) => setState(() => _date = date),
            ),
          ],
        ),
      ],
    );
  }
}
