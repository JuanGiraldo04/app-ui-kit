import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppLoader', () {
    testWidgets('renders each size with its matching dimension', (
      tester,
    ) async {
      const expectedDimensions = {
        AppLoaderSize.small: 16.0,
        AppLoaderSize.medium: 24.0,
        AppLoaderSize.large: 40.0,
      };

      for (final entry in expectedDimensions.entries) {
        await pumpApp(tester, AppLoader(size: entry.key));

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
        expect(sizedBox.width, entry.value);
        expect(sizedBox.height, entry.value);
      }
    });

    testWidgets('accepts a custom color', (tester) async {
      await pumpApp(tester, const AppLoader(color: Colors.pink));

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(indicator.color, Colors.pink);
    });

    testWidgets('falls back to the theme primary color', (tester) async {
      await pumpApp(tester, const AppLoader());

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(indicator.color, AppTheme.light().colorScheme.primary);
    });
  });
}
