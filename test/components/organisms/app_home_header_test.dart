import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppHomeHeader', () {
    testWidgets('renders greeting and title', (tester) async {
      await pumpApp(
        tester,
        const AppHomeHeader(greeting: 'Hola, Juan 👋', title: 'Eventix'),
      );

      expect(find.text('Hola, Juan 👋'), findsOneWidget);
      expect(find.text('Eventix'), findsOneWidget);
    });

    testWidgets('renders the search field with the given hint', (tester) async {
      await pumpApp(
        tester,
        const AppHomeHeader(
          greeting: 'Hola',
          title: 'Eventix',
          searchHint: 'Buscar eventos...',
        ),
      );

      expect(find.text('Buscar eventos...'), findsOneWidget);
    });

    testWidgets('onAvatarTap is invoked when the avatar is tapped', (
      tester,
    ) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppHomeHeader(
          greeting: 'Hola',
          title: 'Eventix',
          onAvatarTap: () => tapped = true,
        ),
      );

      await tester.tap(find.byType(AppAvatar));
      expect(tapped, isTrue);
    });

    testWidgets('onSearchChanged is invoked as the user types', (tester) async {
      String? query;
      await pumpApp(
        tester,
        AppHomeHeader(
          greeting: 'Hola',
          title: 'Eventix',
          onSearchChanged: (value) => query = value,
        ),
      );

      await tester.enterText(find.byType(TextField), 'rock');
      expect(query, 'rock');
    });
  });
}
