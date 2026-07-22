import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppBottomActionBar', () {
    testWidgets('renders the button label and invokes onPressed', (
      tester,
    ) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppBottomActionBar(
          buttonLabel: 'Confirmar compra',
          onPressed: () => tapped = true,
        ),
      );

      expect(find.text('Confirmar compra'), findsOneWidget);
      await tester.tap(find.byType(AppButton));
      expect(tapped, isTrue);
    });

    testWidgets('shows the error banner when errorMessage is set', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppBottomActionBar(
          buttonLabel: 'Confirmar compra',
          errorMessage: 'No pudimos procesar tu compra',
        ),
      );

      expect(find.byType(AppBanner), findsOneWidget);
      expect(find.text('No pudimos procesar tu compra'), findsOneWidget);
    });

    testWidgets('no banner when errorMessage is not set', (tester) async {
      await pumpApp(
        tester,
        const AppBottomActionBar(buttonLabel: 'Confirmar compra'),
      );

      expect(find.byType(AppBanner), findsNothing);
    });

    testWidgets('shows a loader on the button when isLoading', (tester) async {
      await pumpApp(
        tester,
        const AppBottomActionBar(
          buttonLabel: 'Confirmar compra',
          isLoading: true,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Confirmar compra'), findsNothing);
    });
  });
}
