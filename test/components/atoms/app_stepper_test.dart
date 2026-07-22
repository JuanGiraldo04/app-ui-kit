import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppStepper', () {
    testWidgets('renders the initial value', (tester) async {
      await pumpApp(tester, const AppStepper(value: 3));

      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('tapping + invokes onIncrement', (tester) async {
      var incremented = false;
      await pumpApp(
        tester,
        AppStepper(value: 1, onIncrement: () => incremented = true),
      );

      await tester.tap(find.byIcon(Icons.add_circle_outline));
      expect(incremented, isTrue);
    });

    testWidgets('tapping - invokes onDecrement', (tester) async {
      var decremented = false;
      await pumpApp(
        tester,
        AppStepper(value: 1, onDecrement: () => decremented = true),
      );

      await tester.tap(find.byIcon(Icons.remove_circle_outline));
      expect(decremented, isTrue);
    });

    testWidgets('does not go below min: decrement button is disabled', (
      tester,
    ) async {
      await pumpApp(tester, const AppStepper(value: 1));

      final button = tester.widget<IconButton>(
        find.widgetWithIcon(IconButton, Icons.remove_circle_outline),
      );
      expect(button.onPressed, isNull);
    });

    testWidgets('does not go above max: increment button is disabled', (
      tester,
    ) async {
      await pumpApp(tester, const AppStepper(value: 5));

      final button = tester.widget<IconButton>(
        find.widgetWithIcon(IconButton, Icons.add_circle_outline),
      );
      expect(button.onPressed, isNull);
    });

    testWidgets('renders its own label+control row when label is set', (
      tester,
    ) async {
      await pumpApp(tester, const AppStepper(value: 2, label: 'Cantidad'));

      expect(find.text('Cantidad'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
    });
  });
}
