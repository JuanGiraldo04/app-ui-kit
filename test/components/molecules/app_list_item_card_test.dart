import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppListItemCard', () {
    testWidgets('renders title and subtitle lines', (tester) async {
      await pumpApp(
        tester,
        const AppListItemCard(
          imageUrl: 'https://example.com/event.jpg',
          title: 'Festival de Rock',
          subtitleLines: ['12 dic, 8:00 PM', 'Bogotá'],
        ),
      );

      expect(find.text('Festival de Rock'), findsOneWidget);
      expect(find.text('12 dic, 8:00 PM'), findsOneWidget);
      expect(find.text('Bogotá'), findsOneWidget);
    });

    testWidgets('trailing appears when provided', (tester) async {
      await pumpApp(
        tester,
        const AppListItemCard(
          imageUrl: 'https://example.com/event.jpg',
          title: 'Festival de Rock',
          trailing: AppStatusBadge(label: 'Confirmada'),
        ),
      );

      expect(find.text('Confirmada'), findsOneWidget);
    });

    testWidgets('no trailing widget when not provided', (tester) async {
      await pumpApp(
        tester,
        const AppListItemCard(
          imageUrl: 'https://example.com/event.jpg',
          title: 'Festival de Rock',
        ),
      );

      expect(find.byType(AppStatusBadge), findsNothing);
    });

    testWidgets('onTap is invoked when tapped', (tester) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppListItemCard(
          imageUrl: 'https://example.com/event.jpg',
          title: 'Festival de Rock',
          onTap: () => tapped = true,
        ),
      );

      await tester.tap(find.byType(AppListItemCard));
      expect(tapped, isTrue);
    });

    testWidgets('renders detailLine below the subtitle lines', (tester) async {
      await pumpApp(
        tester,
        const AppListItemCard(
          imageUrl: 'https://example.com/event.jpg',
          title: 'Festival de Rock',
          subtitleLines: ['12 dic, 8:00 PM'],
          detailLine: '3 entradas · \$255.000',
        ),
      );

      expect(find.text('3 entradas · \$255.000'), findsOneWidget);
    });

    testWidgets('imageSize >= 64 uses a bigger title style and titleMaxLines '
        'clamps with ellipsis', (tester) async {
      await pumpApp(
        tester,
        const AppListItemCard(
          imageUrl: 'https://example.com/event.jpg',
          imageSize: 64,
          title: 'Festival de Rock en el Parque',
          titleMaxLines: 1,
        ),
      );

      final title = tester.widget<Text>(
        find.text('Festival de Rock en el Parque'),
      );
      expect(title.maxLines, 1);
      expect(title.overflow, TextOverflow.ellipsis);
      expect(title.style, AppTypography.titleMedium);
    });

    testWidgets('shows a fallback icon when the image fails to load', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppListItemCard(
          imageUrl: 'https://example.com/broken.jpg',
          title: 'Festival de Rock',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.image_not_supported_outlined), findsOneWidget);
    });
  });
}
