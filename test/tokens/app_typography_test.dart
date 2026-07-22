import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Cada GoogleFonts.poppins() dispara, en segundo plano, un intento de
  // cargar el archivo de la fuente. En el entorno de test no hay red ni el
  // asset empaquetado, así que ese intento siempre rechaza — nos interesa
  // solo el TextStyle síncrono (fontSize/family), no que la fuente cargue.
  // Se usa testWidgets (no test()) para poder drenar y descartar ese
  // rechazo async con pump()/takeException() antes de que el test termine.
  GoogleFonts.config.allowRuntimeFetching = false;

  Future<void> expectPoppins(
    WidgetTester tester,
    TextStyle style,
    double fontSize,
  ) async {
    await tester.pump();
    tester.takeException();

    expect(
      style.fontFamily,
      contains('Poppins'),
      reason: 'expected a Poppins font family, got ${style.fontFamily}',
    );
    expect(style.fontSize, fontSize);
  }

  group('AppTypography', () {
    testWidgets('display styles use Poppins with the correct fontSize', (
      tester,
    ) async {
      await expectPoppins(tester, AppTypography.displayLarge, 57);
      await expectPoppins(tester, AppTypography.displayMedium, 45);
      await expectPoppins(tester, AppTypography.displaySmall, 36);
    });

    testWidgets('headline styles use Poppins with the correct fontSize', (
      tester,
    ) async {
      await expectPoppins(tester, AppTypography.headlineLarge, 32);
      await expectPoppins(tester, AppTypography.headlineMedium, 28);
      await expectPoppins(tester, AppTypography.headlineSmall, 24);
    });

    testWidgets('title styles use Poppins with the correct fontSize', (
      tester,
    ) async {
      await expectPoppins(tester, AppTypography.titleLarge, 22);
      await expectPoppins(tester, AppTypography.titleMedium, 16);
      await expectPoppins(tester, AppTypography.titleSmall, 14);
    });

    testWidgets('body styles use Poppins with the correct fontSize', (
      tester,
    ) async {
      await expectPoppins(tester, AppTypography.bodyLarge, 16);
      await expectPoppins(tester, AppTypography.bodyMedium, 14);
      await expectPoppins(tester, AppTypography.bodySmall, 12);
    });

    testWidgets('label styles use Poppins with the correct fontSize', (
      tester,
    ) async {
      await expectPoppins(tester, AppTypography.labelLarge, 14);
      await expectPoppins(tester, AppTypography.labelMedium, 12);
      await expectPoppins(tester, AppTypography.labelSmall, 11);
    });
  });
}
