import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppDateField', () {
    testWidgets('shows the hint when no value is selected', (tester) async {
      await pumpApp(tester, const AppDateField(hint: 'Selecciona una fecha'));

      expect(find.text('Selecciona una fecha'), findsOneWidget);
    });

    testWidgets('shows the formatted date when a value is set', (tester) async {
      await pumpApp(tester, AppDateField(value: DateTime(2026, 3, 5)));

      expect(find.text('05/03/2026'), findsOneWidget);
    });

    testWidgets('dateLabel overrides the default format', (tester) async {
      await pumpApp(
        tester,
        AppDateField(
          value: DateTime(2026, 3, 5),
          dateLabel: (date) => '${date.year}',
        ),
      );

      expect(find.text('2026'), findsOneWidget);
      expect(find.text('05/03/2026'), findsNothing);
    });

    testWidgets('tapping opens the native date picker', (tester) async {
      await pumpApp(tester, const AppDateField(hint: 'Selecciona una fecha'));

      await tester.tap(find.byType(AppDateField));
      await tester.pumpAndSettle();

      expect(find.byType(DatePickerDialog), findsOneWidget);
    });
  });
}
