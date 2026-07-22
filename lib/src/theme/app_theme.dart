import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_semantic_colors.dart';

abstract final class AppTheme {
  static ThemeData light({AppBrandPalette palette = const AppBrandPalette()}) =>
      ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme(palette),
        textTheme: _textTheme,
        scaffoldBackgroundColor: palette.backgroundLight,
        appBarTheme: _appBarTheme(isLight: true, palette: palette),
        cardTheme: _cardTheme(isLight: true, palette: palette),
        inputDecorationTheme: _inputDecorationTheme(
          isLight: true,
          palette: palette,
        ),
        chipTheme: _chipTheme(isLight: true, palette: palette),
        elevatedButtonTheme: _elevatedButtonTheme(palette),
        outlinedButtonTheme: _outlinedButtonTheme(palette),
        textButtonTheme: _textButtonTheme(palette),
        dividerTheme: _dividerTheme(isLight: true, palette: palette),
        extensions: <ThemeExtension<dynamic>>[_semanticColors(palette)],
      );

  static ThemeData dark({AppBrandPalette palette = const AppBrandPalette()}) =>
      ThemeData(
        useMaterial3: true,
        colorScheme: _darkColorScheme(palette),
        textTheme: _textTheme,
        scaffoldBackgroundColor: palette.backgroundDark,
        appBarTheme: _appBarTheme(isLight: false, palette: palette),
        cardTheme: _cardTheme(isLight: false, palette: palette),
        inputDecorationTheme: _inputDecorationTheme(
          isLight: false,
          palette: palette,
        ),
        chipTheme: _chipTheme(isLight: false, palette: palette),
        elevatedButtonTheme: _elevatedButtonTheme(palette),
        outlinedButtonTheme: _outlinedButtonTheme(palette),
        textButtonTheme: _textButtonTheme(palette),
        dividerTheme: _dividerTheme(isLight: false, palette: palette),
        extensions: <ThemeExtension<dynamic>>[_semanticColors(palette)],
      );

  // ── Semantic colors extension ───────────────────────────────────────────

  static AppSemanticColors _semanticColors(AppBrandPalette palette) =>
      AppSemanticColors(
        success: palette.success,
        warning: palette.warning,
        info: palette.info,
        accent: palette.accent,
        primaryDark: palette.primaryDark,
      );

  // ── Color schemes ────────────────────────────────────────────────────────

  static ColorScheme _lightColorScheme(AppBrandPalette palette) => ColorScheme(
    brightness: Brightness.light,
    primary: palette.primary,
    onPrimary: palette.onPrimary,
    primaryContainer: palette.primaryContainer,
    onPrimaryContainer: palette.textPrimaryLight,
    secondary: palette.secondary,
    onSecondary: palette.onSecondary,
    secondaryContainer: palette.secondaryContainer,
    onSecondaryContainer: palette.textPrimaryLight,
    error: palette.error,
    onError: palette.onPrimary,
    errorContainer: const Color(0xFFFFDAD6),
    onErrorContainer: const Color(0xFF410002),
    surface: palette.surfaceLight,
    onSurface: palette.textPrimaryLight,
    surfaceContainerHighest: palette.surfaceVariantLight,
    onSurfaceVariant: palette.textSecondaryLight,
    outline: palette.outlineLight,
    outlineVariant: palette.outlineLight,
  );

  static ColorScheme _darkColorScheme(AppBrandPalette palette) => ColorScheme(
    brightness: Brightness.dark,
    primary: palette.primary,
    onPrimary: palette.onPrimary,
    primaryContainer: palette.primaryDark,
    onPrimaryContainer: palette.textPrimaryDark,
    secondary: palette.secondary,
    onSecondary: palette.onSecondary,
    secondaryContainer: palette.secondaryContainer,
    onSecondaryContainer: palette.textPrimaryDark,
    error: palette.error,
    onError: palette.onPrimary,
    errorContainer: const Color(0xFF93000A),
    onErrorContainer: const Color(0xFFFFDAD6),
    surface: palette.surfaceDark,
    onSurface: palette.textPrimaryDark,
    surfaceContainerHighest: palette.surfaceVariantDark,
    onSurfaceVariant: palette.textSecondaryDark,
    outline: palette.outlineDark,
    outlineVariant: palette.outlineDark,
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

  static AppBarTheme _appBarTheme({
    required bool isLight,
    required AppBrandPalette palette,
  }) => AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: isLight ? palette.surfaceLight : palette.surfaceDark,
    foregroundColor: isLight
        ? palette.textPrimaryLight
        : palette.textPrimaryDark,
    titleTextStyle: AppTypography.titleLarge.copyWith(
      color: isLight ? palette.textPrimaryLight : palette.textPrimaryDark,
    ),
  );

  // ── Card ─────────────────────────────────────────────────────────────────

  static CardThemeData _cardTheme({
    required bool isLight,
    required AppBrandPalette palette,
  }) => CardThemeData(
    elevation: 0,
    color: isLight ? palette.surfaceLight : palette.surfaceDark,
    shape: RoundedRectangleBorder(
      borderRadius: AppRadius.lgBorderRadius,
      side: BorderSide(
        color: isLight ? palette.outlineLight : palette.outlineDark,
      ),
    ),
    margin: const EdgeInsets.all(AppSpacing.sm),
  );

  // ── Input decoration ─────────────────────────────────────────────────────

  static InputDecorationTheme _inputDecorationTheme({
    required bool isLight,
    required AppBrandPalette palette,
  }) => InputDecorationTheme(
    filled: true,
    fillColor: isLight
        ? palette.surfaceVariantLight
        : palette.surfaceVariantDark,
    border: OutlineInputBorder(
      borderRadius: AppRadius.mdBorderRadius,
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppRadius.mdBorderRadius,
      borderSide: BorderSide(
        color: isLight ? palette.outlineLight : palette.outlineDark,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppRadius.mdBorderRadius,
      borderSide: BorderSide(color: palette.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppRadius.mdBorderRadius,
      borderSide: BorderSide(color: palette.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppRadius.mdBorderRadius,
      borderSide: BorderSide(color: palette.error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
    hintStyle: AppTypography.bodyMedium.copyWith(
      color: isLight ? palette.textDisabledLight : palette.textDisabledDark,
    ),
  );

  // ── Chip ─────────────────────────────────────────────────────────────────

  static ChipThemeData _chipTheme({
    required bool isLight,
    required AppBrandPalette palette,
  }) => ChipThemeData(
    backgroundColor: isLight
        ? palette.surfaceVariantLight
        : palette.surfaceVariantDark,
    selectedColor: palette.primaryContainer,
    labelStyle: AppTypography.labelMedium,
    side: BorderSide(
      color: isLight ? palette.outlineLight : palette.outlineDark,
    ),
    shape: RoundedRectangleBorder(borderRadius: AppRadius.fullBorderRadius),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.xs,
    ),
  );

  // ── Buttons ──────────────────────────────────────────────────────────────

  static ElevatedButtonThemeData _elevatedButtonTheme(
    AppBrandPalette palette,
  ) => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: palette.primary,
      foregroundColor: palette.onPrimary,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorderRadius),
      textStyle: AppTypography.labelLarge,
    ),
  );

  static OutlinedButtonThemeData _outlinedButtonTheme(
    AppBrandPalette palette,
  ) => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: palette.primary,
      side: BorderSide(color: palette.primary),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorderRadius),
      textStyle: AppTypography.labelLarge,
    ),
  );

  static TextButtonThemeData _textButtonTheme(AppBrandPalette palette) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: palette.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          textStyle: AppTypography.labelLarge,
        ),
      );

  // ── Divider ──────────────────────────────────────────────────────────────

  static DividerThemeData _dividerTheme({
    required bool isLight,
    required AppBrandPalette palette,
  }) => DividerThemeData(
    color: isLight ? palette.outlineLight : palette.outlineDark,
    thickness: 1,
    space: AppSpacing.lg,
  );
}
