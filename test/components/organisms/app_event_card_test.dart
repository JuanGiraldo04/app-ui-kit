import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppEventCard', () {
    testWidgets('renders title, meta items, price and spots badge', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppEventCard(
          imageUrl: 'https://example.com/event.jpg',
          categoryLabel: 'Conciertos',
          title: 'Festival de Rock',
          metaItems: const [
            AppMetaItem(icon: Icons.location_on_outlined, label: 'Bogotá'),
            AppMetaItem(icon: Icons.calendar_today_outlined, label: '12 dic'),
          ],
          priceLabel: '\$85.000',
          spotsLabel: '120 cupos',
        ),
      );

      expect(find.text('Conciertos'), findsOneWidget);
      expect(find.text('Festival de Rock'), findsOneWidget);
      expect(find.text('Bogotá'), findsOneWidget);
      expect(find.text('12 dic'), findsOneWidget);
      expect(find.text('\$85.000'), findsOneWidget);
      expect(find.text('120 cupos'), findsOneWidget);
    });

    testWidgets('onTap is invoked when tapped', (tester) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppEventCard(
          imageUrl: 'https://example.com/event.jpg',
          categoryLabel: 'Conciertos',
          title: 'Festival de Rock',
          metaItems: const [],
          priceLabel: '\$85.000',
          spotsLabel: '120 cupos',
          onTap: () => tapped = true,
        ),
      );

      await tester.tap(find.byType(AppEventCard));
      expect(tapped, isTrue);
    });

    testWidgets('spotsVariant is forwarded to the status badge', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppEventCard(
          imageUrl: 'https://example.com/event.jpg',
          categoryLabel: 'Conciertos',
          title: 'Festival de Rock',
          metaItems: const [],
          priceLabel: '\$85.000',
          spotsLabel: '0 cupos',
          spotsVariant: AppStatusBadgeVariant.error,
        ),
      );

      final badge = tester.widget<AppStatusBadge>(find.byType(AppStatusBadge));
      expect(badge.variant, AppStatusBadgeVariant.error);
    });
  });
}
