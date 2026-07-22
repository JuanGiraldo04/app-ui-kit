import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppStatusBadge', () {
    testWidgets('renders its label', (tester) async {
      await pumpApp(
        tester,
        const AppStatusBadge(
          label: 'Confirmada',
          variant: AppStatusBadgeVariant.success,
        ),
      );

      expect(find.text('Confirmada'), findsOneWidget);
    });

    testWidgets('each variant uses its matching semantic color', (
      tester,
    ) async {
      Color textColorFor(AppStatusBadgeVariant variant) {
        final text = tester.widget<Text>(find.text('Estado'));
        return text.style!.color!;
      }

      final theme = AppTheme.light();
      final expectedColors = {
        AppStatusBadgeVariant.success: theme
            .extension<AppSemanticColors>()!
            .success,
        AppStatusBadgeVariant.warning: theme
            .extension<AppSemanticColors>()!
            .warning,
        AppStatusBadgeVariant.error: theme.colorScheme.error,
        AppStatusBadgeVariant.info: theme.extension<AppSemanticColors>()!.info,
        AppStatusBadgeVariant.neutral: theme.colorScheme.onSurfaceVariant,
      };

      for (final entry in expectedColors.entries) {
        await pumpApp(
          tester,
          AppStatusBadge(label: 'Estado', variant: entry.key),
        );
        expect(textColorFor(entry.key), entry.value);
      }
    });
  });
}
