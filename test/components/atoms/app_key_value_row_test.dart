import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppKeyValueRow', () {
    testWidgets('renders label and value', (tester) async {
      await pumpApp(
        tester,
        const AppKeyValueRow(label: 'Total', value: '\$50.000'),
      );

      expect(find.text('Total'), findsOneWidget);
      expect(find.text('\$50.000'), findsOneWidget);
    });

    testWidgets('emphasize applies a bigger, primary-colored style', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppKeyValueRow(label: 'Total', value: '\$50.000'),
      );
      final normalStyle = tester.widget<Text>(find.text('\$50.000')).style!;

      await pumpApp(
        tester,
        const AppKeyValueRow(
          label: 'Total',
          value: '\$50.000',
          emphasize: true,
        ),
      );
      final emphasizedStyle = tester.widget<Text>(find.text('\$50.000')).style!;

      expect(emphasizedStyle.fontSize, greaterThan(normalStyle.fontSize!));
      expect(emphasizedStyle.color, AppTheme.light().colorScheme.primary);
    });
  });
}
