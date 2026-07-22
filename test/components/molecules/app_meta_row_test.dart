import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppMetaRow', () {
    testWidgets('renders an icon and label per item', (tester) async {
      await pumpApp(
        tester,
        const AppMetaRow(
          items: [
            AppMetaItem(icon: Icons.location_on_outlined, label: 'Bogotá'),
            AppMetaItem(icon: Icons.calendar_today_outlined, label: '12 dic'),
          ],
        ),
      );

      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
      expect(find.text('Bogotá'), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today_outlined), findsOneWidget);
      expect(find.text('12 dic'), findsOneWidget);
    });

    testWidgets('an expanded item wraps in Expanded to absorb free space', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppMetaRow(
          items: [
            AppMetaItem(
              icon: Icons.location_on_outlined,
              label: 'Bogotá',
              expanded: true,
            ),
          ],
        ),
      );

      expect(find.byType(Expanded), findsOneWidget);
    });

    testWidgets('a single item renders with no leading spacer', (tester) async {
      await pumpApp(
        tester,
        const AppMetaRow(
          items: [
            AppMetaItem(icon: Icons.location_on_outlined, label: 'Bogotá'),
          ],
        ),
      );

      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
    });
  });
}
