import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppCard', () {
    testWidgets('renders its child in every variant', (tester) async {
      for (final variant in AppCardVariant.values) {
        await pumpApp(
          tester,
          AppCard(variant: variant, child: const Text('Contenido')),
        );
        expect(find.text('Contenido'), findsOneWidget);
      }
    });

    testWidgets('onTap is invoked when tapped', (tester) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppCard(onTap: () => tapped = true, child: const Text('Contenido')),
      );

      await tester.tap(find.byType(AppCard));
      expect(tapped, isTrue);
    });

    testWidgets('elevated variant has elevation, others do not', (
      tester,
    ) async {
      Finder cardMaterial() => find.descendant(
        of: find.byType(AppCard),
        matching: find.byType(Material),
      );

      await pumpApp(
        tester,
        AppCard(
          variant: AppCardVariant.elevated,
          child: const Text('Contenido'),
        ),
      );
      expect(tester.widget<Material>(cardMaterial()).elevation, greaterThan(0));

      await pumpApp(
        tester,
        AppCard(
          variant: AppCardVariant.outlined,
          child: const Text('Contenido'),
        ),
      );
      expect(tester.widget<Material>(cardMaterial()).elevation, 0);
    });
  });
}
