import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppProgressStat', () {
    testWidgets('renders label and value', (tester) async {
      await pumpApp(
        tester,
        const AppProgressStat(
          label: 'Cupos disponibles',
          value: '40 / 100',
          progress: 0.4,
        ),
      );

      expect(find.text('Cupos disponibles'), findsOneWidget);
      expect(find.text('40 / 100'), findsOneWidget);
    });

    testWidgets('the progress bar reflects the given percentage', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppProgressStat(
          label: 'Cupos disponibles',
          value: '40 / 100',
          progress: 0.4,
        ),
      );

      final bar = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(bar.value, 0.4);
    });

    testWidgets('clamps progress above 1.0', (tester) async {
      await pumpApp(
        tester,
        const AppProgressStat(
          label: 'Cupos',
          value: '120 / 100',
          progress: 1.5,
        ),
      );

      final bar = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(bar.value, 1.0);
    });

    testWidgets('clamps negative progress to 0.0', (tester) async {
      await pumpApp(
        tester,
        const AppProgressStat(label: 'Cupos', value: '0 / 100', progress: -0.2),
      );

      final bar = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(bar.value, 0.0);
    });
  });
}
