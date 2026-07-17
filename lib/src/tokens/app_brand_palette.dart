import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Paleta de marca que consume [AppTheme]. Todos los campos son opcionales:
/// la app que no personalice nada obtiene la paleta por defecto del kit
/// (los valores actuales de [AppColors]).
///
/// Para una app nueva con identidad propia, basta con pasar una instancia
/// distinta a `AppTheme.light(palette: ...)` / `AppTheme.dark(palette: ...)`
/// — no hace falta tocar el código del kit.
@immutable
class AppBrandPalette {
  const AppBrandPalette({
    this.primary = AppColors.primary,
    this.primaryDark = AppColors.primaryDark,
    this.primaryContainer = AppColors.primaryContainer,
    this.onPrimary = AppColors.onPrimary,
    this.secondary = AppColors.secondary,
    this.secondaryContainer = AppColors.secondaryContainer,
    this.onSecondary = AppColors.onSecondary,
    this.accent = AppColors.accent,
    this.backgroundLight = AppColors.backgroundLight,
    this.surfaceLight = AppColors.surfaceLight,
    this.surfaceVariantLight = AppColors.surfaceVariantLight,
    this.outlineLight = AppColors.outlineLight,
    this.backgroundDark = AppColors.backgroundDark,
    this.surfaceDark = AppColors.surfaceDark,
    this.surfaceVariantDark = AppColors.surfaceVariantDark,
    this.outlineDark = AppColors.outlineDark,
    this.error = AppColors.error,
    this.warning = AppColors.warning,
    this.success = AppColors.success,
    this.info = AppColors.info,
    this.textPrimaryLight = AppColors.textPrimaryLight,
    this.textSecondaryLight = AppColors.textSecondaryLight,
    this.textDisabledLight = AppColors.textDisabledLight,
    this.textPrimaryDark = AppColors.textPrimaryDark,
    this.textSecondaryDark = AppColors.textSecondaryDark,
    this.textDisabledDark = AppColors.textDisabledDark,
  });

  final Color primary;
  final Color primaryDark;
  final Color primaryContainer;
  final Color onPrimary;

  final Color secondary;
  final Color secondaryContainer;
  final Color onSecondary;

  final Color accent;

  final Color backgroundLight;
  final Color surfaceLight;
  final Color surfaceVariantLight;
  final Color outlineLight;

  final Color backgroundDark;
  final Color surfaceDark;
  final Color surfaceVariantDark;
  final Color outlineDark;

  final Color error;
  final Color warning;
  final Color success;
  final Color info;

  final Color textPrimaryLight;
  final Color textSecondaryLight;
  final Color textDisabledLight;

  final Color textPrimaryDark;
  final Color textSecondaryDark;
  final Color textDisabledDark;
}
