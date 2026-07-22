import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppChip', () {
    testWidgets('renders its label', (tester) async {
      await pumpApp(tester, const AppChip(label: 'Fútbol'));

      expect(find.text('Fútbol'), findsOneWidget);
    });

    testWidgets('isSelected changes the background color', (tester) async {
      await pumpApp(tester, const AppChip(label: 'Fútbol'));
      final unselected =
          tester
                  .widget<AnimatedContainer>(find.byType(AnimatedContainer))
                  .decoration
              as BoxDecoration;

      await pumpApp(tester, const AppChip(label: 'Fútbol', isSelected: true));
      final selected =
          tester
                  .widget<AnimatedContainer>(find.byType(AnimatedContainer))
                  .decoration
              as BoxDecoration;

      expect(selected.color, isNot(unselected.color));
    });

    testWidgets('outlined variant renders a visible border', (tester) async {
      await pumpApp(
        tester,
        const AppChip(label: 'Fútbol', variant: AppChipVariant.outlined),
      );
      final decoration =
          tester
                  .widget<AnimatedContainer>(find.byType(AnimatedContainer))
                  .decoration
              as BoxDecoration;

      expect(decoration.border, isNotNull);
    });

    testWidgets('filled variant has no border', (tester) async {
      await pumpApp(
        tester,
        const AppChip(label: 'Fútbol', variant: AppChipVariant.filled),
      );
      final decoration =
          tester
                  .widget<AnimatedContainer>(find.byType(AnimatedContainer))
                  .decoration
              as BoxDecoration;

      expect(decoration.border, isNull);
    });

    testWidgets('onDeleted shows a close icon and is invoked when tapped', (
      tester,
    ) async {
      var deleted = false;
      await pumpApp(
        tester,
        AppChip(label: 'Fútbol', onDeleted: () => deleted = true),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
      await tester.tap(find.byIcon(Icons.close));
      expect(deleted, isTrue);
    });

    testWidgets('no close icon when onDeleted is not provided', (tester) async {
      await pumpApp(tester, const AppChip(label: 'Fútbol'));

      expect(find.byIcon(Icons.close), findsNothing);
    });
  });
}
