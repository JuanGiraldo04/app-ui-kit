import 'package:flutter/material.dart';

/// Colores de marca que no tienen slot propio en [ColorScheme] de Material
/// (success/warning/info/accent/primaryDark). Se instala en
/// `ThemeData.extensions` desde [AppTheme] a partir de la [AppBrandPalette]
/// recibida, para que los componentes los lean vía `Theme.of(context)` en
/// vez de la constante estática `AppColors`.
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.accent,
    required this.primaryDark,
  });

  final Color success;
  final Color warning;
  final Color info;
  final Color accent;
  final Color primaryDark;

  @override
  AppSemanticColors copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? accent,
    Color? primaryDark,
  }) => AppSemanticColors(
    success: success ?? this.success,
    warning: warning ?? this.warning,
    info: info ?? this.info,
    accent: accent ?? this.accent,
    primaryDark: primaryDark ?? this.primaryDark,
  );

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
    );
  }
}

/// Acceso corto: `context.appSemanticColors.success`.
extension AppSemanticColorsX on BuildContext {
  AppSemanticColors get appSemanticColors =>
      Theme.of(this).extension<AppSemanticColors>()!;
}
