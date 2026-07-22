import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // AppTheme.light() dispara GoogleFonts.poppins() para cada TextStyle del
  // tema, que a su vez intenta cargar la fuente en segundo plano. En el
  // entorno de test eso rechaza — usamos testWidgets (no test()) para poder
  // drenar y descartar ese rechazo con pump()/takeException() antes de que
  // el test termine, y así no contamine otros tests del archivo.
  GoogleFonts.config.allowRuntimeFetching = false;

  group('AppSemanticColors', () {
    // Color.lerp siempre retorna un Color plano, aunque los valores de
    // entrada sean un MaterialColor — se usan Color() planos aquí para que
    // la igualdad de lerp() no falle por runtimeType.
    const colors = AppSemanticColors(
      success: Color(0xFF00C853),
      warning: Color(0xFFFFB300),
      info: Color(0xFF00C2FF),
      accent: Color(0xFF9C27B0),
      primaryDark: Color(0xFF000000),
    );

    test('copyWith overrides only the given fields', () {
      final copy = colors.copyWith(success: Colors.red);

      expect(copy.success, Colors.red);
      expect(copy.warning, colors.warning);
      expect(copy.info, colors.info);
      expect(copy.accent, colors.accent);
      expect(copy.primaryDark, colors.primaryDark);
    });

    test('copyWith with no arguments returns equivalent values', () {
      final copy = colors.copyWith();

      expect(copy.success, colors.success);
      expect(copy.warning, colors.warning);
      expect(copy.info, colors.info);
      expect(copy.accent, colors.accent);
      expect(copy.primaryDark, colors.primaryDark);
    });

    test('lerp at t=0 returns the starting colors', () {
      const other = AppSemanticColors(
        success: Color(0xFF000000),
        warning: Color(0xFF000000),
        info: Color(0xFF000000),
        accent: Color(0xFF000000),
        primaryDark: Color(0xFF000000),
      );

      final result = colors.lerp(other, 0);
      expect(result.success, colors.success);
    });

    test('lerp with a non-matching type returns this', () {
      final result = colors.lerp(null, 0.5);
      expect(result, colors);
    });

    testWidgets('is installed as a ThemeExtension on AppTheme', (tester) async {
      // El acceso vía context.appSemanticColors ya está cubierto por las
      // pruebas de widgets que consumen colores semánticos (AppStatusBadge,
      // AppBanner, AppProgressStat); aquí solo validamos que la extensión
      // queda instalada en el tema.
      final theme = AppTheme.light();
      await tester.pump();
      tester.takeException();

      final installed = theme.extension<AppSemanticColors>();
      expect(installed, isNotNull);
    });
  });
}
