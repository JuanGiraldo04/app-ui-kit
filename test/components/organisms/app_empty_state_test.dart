import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppEmptyState', () {
    testWidgets('renders the default title and message per variant', (
      tester,
    ) async {
      const expected = {
        AppEmptyStateVariant.generic: (
          'Sin contenido',
          'No hay elementos para mostrar.',
        ),
        AppEmptyStateVariant.search: (
          'Sin resultados',
          'No encontramos lo que buscas. Intenta con otro término.',
        ),
        AppEmptyStateVariant.error: (
          'Algo salió mal',
          'Ocurrió un error inesperado. Intenta de nuevo.',
        ),
        AppEmptyStateVariant.network: (
          'Sin conexión',
          'Verifica tu conexión a internet e intenta de nuevo.',
        ),
      };

      for (final entry in expected.entries) {
        await pumpApp(tester, AppEmptyState(variant: entry.key));
        expect(find.text(entry.value.$1), findsOneWidget);
        expect(find.text(entry.value.$2), findsOneWidget);
      }
    });

    testWidgets('custom title and message override the defaults', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppEmptyState(
          title: 'Nada por aquí',
          message: 'Ajusta tus filtros.',
        ),
      );

      expect(find.text('Nada por aquí'), findsOneWidget);
      expect(find.text('Ajusta tus filtros.'), findsOneWidget);
    });

    testWidgets('the action button appears and is invoked when tapped', (
      tester,
    ) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppEmptyState(
          actionLabel: 'Limpiar filtros',
          action: () => tapped = true,
        ),
      );

      expect(find.text('Limpiar filtros'), findsOneWidget);
      await tester.tap(find.text('Limpiar filtros'));
      expect(tapped, isTrue);
    });

    testWidgets('no action button when action/actionLabel are missing', (
      tester,
    ) async {
      await pumpApp(tester, const AppEmptyState());

      expect(find.byType(AppButton), findsNothing);
    });
  });
}
