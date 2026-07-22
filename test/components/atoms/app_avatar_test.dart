import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppAvatar', () {
    testWidgets('renders the fallback icon when there is no imageUrl', (
      tester,
    ) async {
      await pumpApp(tester, const AppAvatar());

      final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(avatar.backgroundImage, isNull);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('renders initials when there is no imageUrl', (tester) async {
      await pumpApp(tester, const AppAvatar(initials: 'JG'));

      expect(find.text('JG'), findsOneWidget);
      expect(find.byIcon(Icons.person), findsNothing);
    });

    testWidgets('renders the network image when imageUrl is set', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppAvatar(imageUrl: 'https://example.com/avatar.png'),
      );
      // El entorno de test no tiene red real: TestWidgetsFlutterBinding
      // responde cualquier HttpClient request con 400, así que la carga de
      // NetworkImage falla como se espera. Solo verificamos que el widget
      // se construyó con la imagen correcta, no que la imagen cargó.
      tester.takeException();

      final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(avatar.backgroundImage, isA<NetworkImage>());
      expect(avatar.child, isNull);
    });
  });
}
