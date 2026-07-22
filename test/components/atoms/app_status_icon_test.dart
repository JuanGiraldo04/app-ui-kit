import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppStatusIcon', () {
    testWidgets('renders the given icon', (tester) async {
      await pumpApp(tester, const AppStatusIcon(icon: Icons.check_circle));

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('defaults iconSize to 0.58 of size', (tester) async {
      await pumpApp(
        tester,
        const AppStatusIcon(icon: Icons.check_circle, size: 100),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.size, closeTo(58, 0.001));
    });

    testWidgets('an explicit iconSize overrides the default', (tester) async {
      await pumpApp(
        tester,
        const AppStatusIcon(icon: Icons.check_circle, size: 100, iconSize: 40),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.check_circle));
      expect(icon.size, 40);
    });

    testWidgets('renders every semantic variant without throwing', (
      tester,
    ) async {
      for (final variant in AppStatusBadgeVariant.values) {
        await pumpApp(
          tester,
          AppStatusIcon(icon: Icons.check_circle, variant: variant),
        );
        expect(find.byIcon(Icons.check_circle), findsOneWidget);
      }
    });
  });
}
