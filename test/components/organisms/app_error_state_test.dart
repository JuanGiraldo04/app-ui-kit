import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppErrorState', () {
    testWidgets('renders the message', (tester) async {
      await pumpApp(
        tester,
        const AppErrorState(message: 'No pudimos cargar los eventos'),
      );

      expect(find.text('No pudimos cargar los eventos'), findsOneWidget);
    });

    testWidgets('the retry button appears and is invoked when tapped', (
      tester,
    ) async {
      var retried = false;
      await pumpApp(
        tester,
        AppErrorState(message: 'Error', onRetry: () => retried = true),
      );

      expect(find.text('Reintentar'), findsOneWidget);
      await tester.tap(find.byType(AppButton));
      expect(retried, isTrue);
    });

    testWidgets('no retry button when onRetry is not provided', (tester) async {
      await pumpApp(tester, const AppErrorState(message: 'Error'));

      expect(find.byType(AppButton), findsNothing);
    });

    testWidgets('a custom retryLabel overrides the default', (tester) async {
      await pumpApp(
        tester,
        AppErrorState(
          message: 'Error',
          onRetry: () {},
          retryLabel: 'Intentar de nuevo',
        ),
      );

      expect(find.text('Intentar de nuevo'), findsOneWidget);
      expect(find.text('Reintentar'), findsNothing);
    });
  });
}
