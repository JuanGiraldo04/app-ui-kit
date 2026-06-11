import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

abstract final class AppTheme {
  static ThemeData light() => ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: _textTheme,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: _appBarTheme(isLight: true),
    cardTheme: _cardTheme(isLight: true),
    inputDecorationTheme: _inputDecorationTheme(isLight: true),
    chipTheme: _chipTheme(isLight: true),
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    dividerTheme: _dividerTheme(isLight: true),
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    textTheme: _textTheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: _appBarTheme(isLight: false),
    cardTheme: _cardTheme(isLight: false),
    inputDecorationTheme: _inputDecorationTheme(isLight: false),
    chipTheme: _chipTheme(isLight: false),
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    dividerTheme: _dividerTheme(isLight: false),
  );

  // ── Color schemes ────────────────────────────────────────────────────────

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.textPrimaryLight,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.textPrimaryLight,
    error: AppColors.error,
    onError: AppColors.onPrimary,
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimaryLight,
    surfaceContainerHighest: AppColors.surfaceVariantLight,
    onSurfaceVariant: AppColors.textSecondaryLight,
    outline: AppColors.outlineLight,
    outlineVariant: AppColors.outlineLight,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: Color(0xFF3D35CC),
    onPrimaryContainer: AppColors.textPrimaryDark,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    secondaryContainer: Color(0xFF00897B),
    onSecondaryContainer: AppColors.textPrimaryDark,
    error: AppColors.error,
    onError: AppColors.onPrimary,
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: AppColors.surfaceDark,
    onSurface: AppColors.textPrimaryDark,
    surfaceContainerHighest: AppColors.surfaceVariantDark,
    onSurfaceVariant: AppColors.textSecondaryDark,
    outline: AppColors.outlineDark,
    outlineVariant: AppColors.outlineDark,
  );

  // ── Text theme ───────────────────────────────────────────────────────────

  static final _textTheme = TextTheme(
    displayLarge: AppTypography.displayLarge,
    displayMedium: AppTypography.displayMedium,
    displaySmall: AppTypography.displaySmall,
    headlineLarge: AppTypography.headlineLarge,
    headlineMedium: AppTypography.headlineMedium,
    headlineSmall: AppTypography.headlineSmall,
    titleLarge: AppTypography.titleLarge,
    titleMedium: AppTypography.titleMedium,
    titleSmall: AppTypography.titleSmall,
    bodyLarge: AppTypography.bodyLarge,
    bodyMedium: AppTypography.bodyMedium,
    bodySmall: AppTypography.bodySmall,
    labelLarge: AppTypography.labelLarge,
    labelMedium: AppTypography.labelMedium,
    labelSmall: AppTypography.labelSmall,
  );

  // ── AppBar ───────────────────────────────────────────────────────────────

  static AppBarTheme _appBarTheme({required bool isLight}) => AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: isLight ? AppColors.surfaceLight : AppColors.surfaceDark,
    foregroundColor: isLight
        ? AppColors.textPrimaryLight
        : AppColors.textPrimaryDark,
    titleTextStyle: AppTypography.titleLarge.copyWith(
      color: isLight ? AppColors.textPrimaryLight : AppColors.textPrimaryDark,
    ),
  );

  // ── Card ─────────────────────────────────────────────────────────────────

  static CardThemeData _cardTheme({required bool isLight}) => CardThemeData(
    elevation: 0,
    color: isLight ? AppColors.surfaceLight : AppColors.surfaceDark,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.lgBorderRadius,
      side: BorderSide(
        color: isLight ? AppColors.outlineLight : AppColors.outlineDark,
      ),
    ),
    margin: const EdgeInsets.all(AppSpacing.sm),
  );

  // ── Input decoration ─────────────────────────────────────────────────────

  static InputDecorationTheme _inputDecorationTheme({required bool isLight}) =>
      InputDecorationTheme(
        filled: true,
        fillColor: isLight
            ? AppColors.surfaceVariantLight
            : AppColors.surfaceVariantDark,
        border: OutlineInputBorder(
          borderRadius: AppRadius.mdBorderRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdBorderRadius,
          borderSide: BorderSide(
            color: isLight ? AppColors.outlineLight : AppColors.outlineDark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdBorderRadius,
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdBorderRadius,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdBorderRadius,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: isLight
              ? AppColors.textDisabledLight
              : AppColors.textDisabledDark,
        ),
      );

  // ── Chip ─────────────────────────────────────────────────────────────────

  static ChipThemeData _chipTheme({required bool isLight}) => ChipThemeData(
    backgroundColor: isLight
        ? AppColors.surfaceVariantLight
        : AppColors.surfaceVariantDark,
    selectedColor: AppColors.primaryContainer,
    labelStyle: AppTypography.labelMedium,
    side: BorderSide(
      color: isLight ? AppColors.outlineLight : AppColors.outlineDark,
    ),
    shape: RoundedRectangleBorder(borderRadius: AppRadius.fullBorderRadius),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.xs,
    ),
  );

  // ── Buttons ──────────────────────────────────────────────────────────────

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorderRadius),
      textStyle: AppTypography.labelLarge,
    ),
  );

  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorderRadius),
      textStyle: AppTypography.labelLarge,
    ),
  );

  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      textStyle: AppTypography.labelLarge,
    ),
  );

  // ── Divider ──────────────────────────────────────────────────────────────

  static DividerThemeData _dividerTheme({required bool isLight}) =>
      DividerThemeData(
        color: isLight ? AppColors.outlineLight : AppColors.outlineDark,
        thickness: 1,
        space: AppSpacing.lg,
      );
}
