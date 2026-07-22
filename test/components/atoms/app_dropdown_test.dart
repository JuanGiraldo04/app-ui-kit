import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppDropdown (native menu)', () {
    testWidgets('shows the hint when no value is selected', (tester) async {
      await pumpApp(
        tester,
        AppDropdown<String>(
          items: const ['Bogotá', 'Medellín'],
          itemLabel: (item) => item,
          hint: 'Selecciona una ciudad',
          onChanged: (_) {},
        ),
      );

      expect(find.text('Selecciona una ciudad'), findsOneWidget);
    });

    testWidgets('opening the menu and selecting an item invokes onChanged', (
      tester,
    ) async {
      String? selected;
      await pumpApp(
        tester,
        AppDropdown<String>(
          items: const ['Bogotá', 'Medellín'],
          itemLabel: (item) => item,
          hint: 'Selecciona una ciudad',
          onChanged: (value) => selected = value,
        ),
      );

      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Medellín').last);
      await tester.pumpAndSettle();

      expect(selected, 'Medellín');
    });

    testWidgets('renders itemIcon and itemDescription inside the menu', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppDropdown<String>(
          items: const ['Bogotá'],
          itemLabel: (item) => item,
          itemIcon: (_) => Icons.location_on,
          itemDescription: (_) => 'Capital',
          onChanged: (_) {},
        ),
      );

      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.location_on), findsWidgets);
      expect(find.text('Capital'), findsOneWidget);
    });
  });

  group('AppDropdown (searchable)', () {
    testWidgets('shows the hint and opens a bottom sheet with a search bar', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppDropdown<String>(
          items: const ['Bogotá', 'Medellín', 'Cali'],
          itemLabel: (item) => item,
          hint: 'Buscar ciudad',
          searchable: true,
          searchHint: 'Buscar...',
          onChanged: (_) {},
        ),
      );

      expect(find.text('Buscar ciudad'), findsOneWidget);

      await tester.tap(find.byType(AppDropdown<String>));
      await tester.pumpAndSettle();

      expect(find.text('Buscar...'), findsOneWidget);
      expect(find.text('Bogotá'), findsOneWidget);
      expect(find.text('Medellín'), findsOneWidget);
      expect(find.text('Cali'), findsOneWidget);
    });

    testWidgets('filters the list as the user types', (tester) async {
      await pumpApp(
        tester,
        AppDropdown<String>(
          items: const ['Bogotá', 'Medellín', 'Cali'],
          itemLabel: (item) => item,
          searchable: true,
          onChanged: (_) {},
        ),
      );

      await tester.tap(find.byType(AppDropdown<String>));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Med');
      await tester.pumpAndSettle();

      expect(find.text('Medellín'), findsOneWidget);
      expect(find.text('Bogotá'), findsNothing);
      expect(find.text('Cali'), findsNothing);
    });

    testWidgets('selecting an item closes the sheet and invokes onChanged', (
      tester,
    ) async {
      String? selected;
      await pumpApp(
        tester,
        AppDropdown<String>(
          items: const ['Bogotá', 'Medellín'],
          itemLabel: (item) => item,
          searchable: true,
          onChanged: (value) => selected = value,
        ),
      );

      await tester.tap(find.byType(AppDropdown<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Medellín'));
      await tester.pumpAndSettle();

      expect(selected, 'Medellín');
      // El sheet ya se cerró y no queda ningún rastro de sus items.
      expect(find.byType(BottomSheet), findsNothing);
    });

    testWidgets('shows a check next to the currently selected item', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppDropdown<String>(
          items: const ['Bogotá', 'Medellín'],
          itemLabel: (item) => item,
          value: 'Bogotá',
          searchable: true,
          onChanged: (_) {},
        ),
      );

      await tester.tap(find.byType(AppDropdown<String>));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
