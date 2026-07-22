import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppButton', () {
    testWidgets('renders its label', (tester) async {
      await pumpApp(tester, AppButton(label: 'Continuar', onPressed: () {}));

      expect(find.text('Continuar'), findsOneWidget);
    });

    testWidgets('invokes onPressed when tapped', (tester) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppButton(label: 'Continuar', onPressed: () => tapped = true),
      );

      await tester.tap(find.byType(AppButton));
      expect(tapped, isTrue);
    });

    testWidgets('shows a loader instead of the label when isLoading', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppButton(label: 'Continuar', isLoading: true, onPressed: () {}),
      );

      expect(find.text('Continuar'), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('reduces opacity when onPressed is null', (tester) async {
      await pumpApp(tester, const AppButton(label: 'Continuar'));

      final opacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(opacity.opacity, 0.5);
    });

    testWidgets('full opacity when onPressed is set', (tester) async {
      await pumpApp(tester, AppButton(label: 'Continuar', onPressed: () {}));

      final opacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(opacity.opacity, 1.0);
    });

    testWidgets('renders every variant without throwing', (tester) async {
      for (final variant in AppButtonVariant.values) {
        await pumpApp(
          tester,
          AppButton(label: 'Continuar', variant: variant, onPressed: () {}),
        );
        expect(find.text('Continuar'), findsOneWidget);
      }
    });

    testWidgets('every size renders a proportionally sized loader', (
      tester,
    ) async {
      const expectedDiameters = {
        AppButtonSize.small: 32.0,
        AppButtonSize.medium: 40.0,
        AppButtonSize.large: 48.0,
      };

      for (final entry in expectedDiameters.entries) {
        await pumpApp(
          tester,
          AppButton(
            label: 'Continuar',
            size: entry.key,
            isLoading: true,
            onPressed: () {},
          ),
        );

        final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
        expect(
          sizedBoxes.any(
            (box) => box.width == entry.value && box.height == entry.value,
          ),
          isTrue,
          reason:
              'expected a ${entry.value}x${entry.value} loader for '
              '${entry.key}',
        );
      }
    });
  });
}
