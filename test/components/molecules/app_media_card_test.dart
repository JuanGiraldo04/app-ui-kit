import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppMediaCard', () {
    testWidgets('renders its child content (title + metadata)', (tester) async {
      await pumpApp(
        tester,
        AppMediaCard(
          imageUrl: 'https://example.com/event.jpg',
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Título del evento'), Text('Bogotá · 12 dic')],
          ),
        ),
      );

      expect(find.text('Título del evento'), findsOneWidget);
      expect(find.text('Bogotá · 12 dic'), findsOneWidget);
    });

    testWidgets('onTap is invoked when tapped', (tester) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppMediaCard(
          imageUrl: 'https://example.com/event.jpg',
          onTap: () => tapped = true,
          child: const Text('Título'),
        ),
      );

      await tester.tap(find.byType(AppMediaCard));
      expect(tapped, isTrue);
    });

    testWidgets('overlay renders on top of the image when provided', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppMediaCard(
          imageUrl: 'https://example.com/event.jpg',
          overlay: const AppChip(label: 'Fútbol', isSelected: true),
          child: const Text('Título'),
        ),
      );

      expect(find.byType(Positioned), findsOneWidget);
      expect(find.text('Fútbol'), findsOneWidget);
    });

    testWidgets('no overlay widget when not provided', (tester) async {
      await pumpApp(
        tester,
        AppMediaCard(
          imageUrl: 'https://example.com/event.jpg',
          child: const Text('Título'),
        ),
      );

      expect(find.byType(Positioned), findsNothing);
    });

    testWidgets('a custom aspectRatio is applied', (tester) async {
      // Contenido en un scroll view acotado: con aspectRatio:1 la card se
      // vuelve más alta que ancha y desborda un Scaffold sin scroll.
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light(),
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppMediaCard(
                imageUrl: 'https://example.com/event.jpg',
                aspectRatio: 1,
                child: const Text('Título'),
              ),
            ),
          ),
        ),
      );

      final aspectRatio = tester.widget<AspectRatio>(find.byType(AspectRatio));
      expect(aspectRatio.aspectRatio, 1);
    });

    testWidgets('shows a fallback icon when the image fails to load', (
      tester,
    ) async {
      await pumpApp(
        tester,
        AppMediaCard(
          imageUrl: 'https://example.com/broken.jpg',
          child: const Text('Título'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.image_not_supported_outlined), findsOneWidget);
    });
  });
}
