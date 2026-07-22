import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppProfileHeaderCard', () {
    testWidgets('renders name and email', (tester) async {
      await pumpApp(
        tester,
        const AppProfileHeaderCard(
          name: 'Juan Giraldo',
          email: 'juan@example.com',
        ),
      );

      expect(find.text('Juan Giraldo'), findsOneWidget);
      expect(find.text('juan@example.com'), findsOneWidget);
    });

    testWidgets('shows a loader when isLoading is true', (tester) async {
      await pumpApp(tester, const AppProfileHeaderCard(isLoading: true));

      expect(find.byType(AppLoader), findsOneWidget);
    });

    testWidgets('shows the error message when provided', (tester) async {
      await pumpApp(
        tester,
        const AppProfileHeaderCard(errorMessage: 'No se pudo cargar'),
      );

      expect(find.text('No se pudo cargar'), findsOneWidget);
      expect(find.byType(AppLoader), findsNothing);
    });

    testWidgets('renders the avatar', (tester) async {
      await pumpApp(tester, const AppProfileHeaderCard(name: 'Juan Giraldo'));

      expect(find.byType(AppAvatar), findsOneWidget);
    });
  });
}
