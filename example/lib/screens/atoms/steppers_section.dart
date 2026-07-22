import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class SteppersSection extends StatefulWidget {
  const SteppersSection({super.key});

  @override
  State<SteppersSection> createState() => _SteppersSectionState();
}

class _SteppersSectionState extends State<SteppersSection> {
  int _quantity = 1;

  static const int _min = 1;
  static const int _max = 5;

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Steppers',
      description: 'Selector +/- de cantidad, con límites min/max.',
      children: [
        ShowcaseSubSection(
          label: 'Interactivo (min: $_min, max: $_max)',
          children: [
            AppStepper(
              value: _quantity,
              onDecrement: _quantity > _min
                  ? () => setState(() => _quantity--)
                  : null,
              onIncrement: _quantity < _max
                  ? () => setState(() => _quantity++)
                  : null,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Deshabilitado',
          children: [const AppStepper(value: 3)],
        ),
      ],
    );
  }
}
