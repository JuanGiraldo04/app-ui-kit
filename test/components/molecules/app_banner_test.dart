import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppBanner', () {
    testWidgets('renders the message', (tester) async {
      await pumpApp(tester, const AppBanner(message: 'Algo salió mal'));

      expect(find.text('Algo salió mal'), findsOneWidget);
    });

    testWidgets('renders the title when provided', (tester) async {
      await pumpApp(
        tester,
        const AppBanner(message: 'Algo salió mal', title: 'Error'),
      );

      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Algo salió mal'), findsOneWidget);
    });

    testWidgets('no title text when not provided', (tester) async {
      await pumpApp(tester, const AppBanner(message: 'Algo salió mal'));

      expect(find.text('Error'), findsNothing);
    });

    testWidgets('onDismiss shows a close icon and is invoked when tapped', (
      tester,
    ) async {
      var dismissed = false;
      await pumpApp(
        tester,
        AppBanner(message: 'Algo salió mal', onDismiss: () => dismissed = true),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
      await tester.tap(find.byIcon(Icons.close));
      expect(dismissed, isTrue);
    });

    testWidgets('no close icon when onDismiss is not provided', (tester) async {
      await pumpApp(tester, const AppBanner(message: 'Algo salió mal'));

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('each variant renders its matching icon', (tester) async {
      const expectedIcons = {
        AppBannerVariant.info: Icons.info_outline,
        AppBannerVariant.success: Icons.check_circle_outline,
        AppBannerVariant.warning: Icons.warning_amber_outlined,
        AppBannerVariant.error: Icons.error_outline,
      };

      for (final entry in expectedIcons.entries) {
        await pumpApp(
          tester,
          AppBanner(message: 'Mensaje', variant: entry.key),
        );
        expect(find.byIcon(entry.value), findsOneWidget);
      }
    });
  });
}
