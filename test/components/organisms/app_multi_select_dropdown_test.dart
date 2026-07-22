import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppMultiSelectDropdown', () {
    testWidgets('shows the hint when nothing is selected', (tester) async {
      await pumpApp(
        tester,
        AppMultiSelectDropdown<String>(
          items: const ['Fútbol', 'Baloncesto'],
          itemLabel: (item) => item,
          values: const {},
          hint: 'Selecciona categorías',
          onChanged: (_) {},
        ),
      );

      expect(find.text('Selecciona categorías'), findsOneWidget);
    });

    testWidgets('shows a comma-separated summary when values are selected', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppMultiSelectDropdown<String>(
          items: const ['Fútbol', 'Baloncesto'],
          itemLabel: (item) => item,
          values: const {'Fútbol'},
          onChanged: (_) {},
        ),
      );

      expect(find.text('Fútbol'), findsOneWidget);
    });

    testWidgets('checking items and confirming invokes onChanged with the '
        'full selection', (tester) async {
      Set<String>? result;
      await pumpApp(
        tester,
        AppMultiSelectDropdown<String>(
          items: const ['Fútbol', 'Baloncesto', 'Tenis'],
          itemLabel: (item) => item,
          values: const {},
          hint: 'Selecciona categorías',
          onChanged: (value) => result = value,
        ),
      );

      await tester.tap(find.byType(AppMultiSelectDropdown<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Fútbol'));
      await tester.tap(find.text('Tenis'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Aplicar'));
      await tester.pumpAndSettle();

      expect(result, {'Fútbol', 'Tenis'});
    });

    testWidgets('unchecking a pre-selected item removes it on confirm', (
      tester,
    ) async {
      Set<String>? result;
      await pumpApp(
        tester,
        AppMultiSelectDropdown<String>(
          items: const ['Fútbol', 'Baloncesto'],
          itemLabel: (item) => item,
          values: const {'Fútbol', 'Baloncesto'},
          onChanged: (value) => result = value,
        ),
      );

      await tester.tap(find.byType(AppMultiSelectDropdown<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Fútbol'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Aplicar'));
      await tester.pumpAndSettle();

      expect(result, {'Baloncesto'});
    });

    testWidgets('searchable filters the sheet as the user types', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppMultiSelectDropdown<String>(
          items: const ['Fútbol', 'Baloncesto', 'Tenis'],
          itemLabel: (item) => item,
          values: const {},
          searchable: true,
          onChanged: (_) {},
        ),
      );

      await tester.tap(find.byType(AppMultiSelectDropdown<String>));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Ten');
      await tester.pumpAndSettle();

      expect(find.text('Tenis'), findsOneWidget);
      expect(find.text('Fútbol'), findsNothing);
    });

    testWidgets('renders itemIcon and itemDescription in the sheet', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppMultiSelectDropdown<String>(
          items: const ['Fútbol'],
          itemLabel: (item) => item,
          itemIcon: (_) => Icons.sports_soccer,
          itemDescription: (_) => 'Deporte de equipo',
          values: const {},
          onChanged: (_) {},
        ),
      );

      await tester.tap(find.byType(AppMultiSelectDropdown<String>));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.sports_soccer), findsOneWidget);
      expect(find.text('Deporte de equipo'), findsOneWidget);
    });

    testWidgets('a custom confirmLabel overrides the default button text', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppMultiSelectDropdown<String>(
          items: const ['Fútbol'],
          itemLabel: (item) => item,
          values: const {},
          confirmLabel: 'Listo',
          onChanged: (_) {},
        ),
      );

      await tester.tap(find.byType(AppMultiSelectDropdown<String>));
      await tester.pumpAndSettle();

      expect(find.text('Listo'), findsOneWidget);
      expect(find.text('Aplicar'), findsNothing);
    });
  });
}
