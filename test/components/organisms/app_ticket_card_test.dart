import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppTicketCard', () {
    testWidgets('renders code and label', (tester) async {
      await pumpApp(
        tester,
        const AppTicketCard(code: 'AB12-CD34', label: 'Ticket 1 de 2'),
      );

      expect(find.text('AB12-CD34'), findsOneWidget);
      expect(find.text('Ticket 1 de 2'), findsOneWidget);
    });

    testWidgets('tapping the card opens an enlarged QR dialog', (tester) async {
      await pumpApp(
        tester,
        const AppTicketCard(code: 'AB12-CD34', label: 'Ticket 1 de 2'),
      );

      await tester.tap(find.byType(AppTicketCard));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(Dialog),
          matching: find.text('AB12-CD34'),
        ),
        findsOneWidget,
      );
    });
  });
}
