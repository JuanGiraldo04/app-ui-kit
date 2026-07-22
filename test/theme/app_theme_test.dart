import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // AppTheme.light()/dark() disparan GoogleFonts.poppins() para cada
  // TextStyle del tema, que a su vez intenta cargar la fuente en segundo
  // plano. En el entorno de test eso rechaza — usamos testWidgets (no
  // test()) para poder drenar y descartar ese rechazo con
  // pump()/takeException() antes de que el test termine.
  GoogleFonts.config.allowRuntimeFetching = false;

  group('AppTheme', () {
    testWidgets('light() builds a light ColorScheme with the default '
        'palette', (tester) async {
      final theme = AppTheme.light();
      await tester.pump();
      tester.takeException();

      expect(theme.brightness, Brightness.light);
      expect(theme.colorScheme.primary, AppColors.primary);
      expect(theme.scaffoldBackgroundColor, AppColors.backgroundLight);
    });

    testWidgets('dark() builds a dark ColorScheme with the default palette', (
      tester,
    ) async {
      final theme = AppTheme.dark();
      await tester.pump();
      tester.takeException();

      expect(theme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, AppColors.primary);
      expect(theme.scaffoldBackgroundColor, AppColors.backgroundDark);
    });

    testWidgets('a custom AppBrandPalette overrides the resolved colors', (
      tester,
    ) async {
      const palette = AppBrandPalette(primary: Colors.purple);

      final light = AppTheme.light(palette: palette);
      final dark = AppTheme.dark(palette: palette);
      await tester.pump();
      tester.takeException();

      expect(light.colorScheme.primary, Colors.purple);
      expect(dark.colorScheme.primary, Colors.purple);
    });

    testWidgets('both themes install the AppSemanticColors extension', (
      tester,
    ) async {
      final light = AppTheme.light();
      final dark = AppTheme.dark();
      await tester.pump();
      tester.takeException();

      expect(light.extension<AppSemanticColors>(), isNotNull);
      expect(dark.extension<AppSemanticColors>(), isNotNull);
    });
  });
}
