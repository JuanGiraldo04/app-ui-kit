import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppCircleIconButton', () {
    testWidgets('renders the given icon', (tester) async {
      await pumpApp(tester, const AppCircleIconButton(icon: Icons.arrow_back));

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('invokes onTap when tapped', (tester) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppCircleIconButton(icon: Icons.arrow_back, onTap: () => tapped = true),
      );

      await tester.tap(find.byType(AppCircleIconButton));
      expect(tapped, isTrue);
    });

    testWidgets('accepts custom background and icon colors', (tester) async {
      await pumpApp(
        tester,
        const AppCircleIconButton(
          icon: Icons.favorite,
          backgroundColor: Colors.blue,
          iconColor: Colors.yellow,
          size: 30,
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.favorite));
      expect(icon.color, Colors.yellow);
      expect(icon.size, 30);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(AppCircleIconButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, Colors.blue);
    });
  });
}
