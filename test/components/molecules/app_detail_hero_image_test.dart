import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppDetailHeroImage', () {
    testWidgets('renders the back button and invokes onBack when tapped', (
      tester,
    ) async {
      var tapped = false;
      await pumpApp(
        tester,
        AppDetailHeroImage(
          imageUrl: 'https://example.com/event.jpg',
          onBack: () => tapped = true,
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      expect(tapped, isTrue);
    });

    testWidgets('no back button when onBack is not provided', (tester) async {
      await pumpApp(
        tester,
        const AppDetailHeroImage(imageUrl: 'https://example.com/event.jpg'),
      );

      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });

    testWidgets('renders the overlay when provided', (tester) async {
      await pumpApp(
        tester,
        AppDetailHeroImage(
          imageUrl: 'https://example.com/event.jpg',
          overlay: const Positioned(
            top: 0,
            right: 0,
            child: AppChip(label: 'Fútbol'),
          ),
        ),
      );

      expect(find.text('Fútbol'), findsOneWidget);
    });

    testWidgets('shows a fallback icon when the image fails to load', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppDetailHeroImage(imageUrl: 'https://example.com/broken.jpg'),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.image_not_supported_outlined), findsOneWidget);
    });
  });
}
