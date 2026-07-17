import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary
  static const primary = Color(0xFFFF6B00);
  static const primaryDark = Color(0xFFCC5500);
  static const primaryContainer = Color(0xFFFFDDBF);
  static const onPrimary = Color(0xFFFFFFFF);

  // Secondary
  static const secondary = Color(0xFF1A1A2E);
  static const secondaryContainer = Color(0xFFD9D9E3);
  static const onSecondary = Color(0xFFFFFFFF);

  // Accent
  static const accent = Color(0xFF00C2FF);

  // Neutrals light
  static const backgroundLight = Color(0xFFF5F5F5);
  static const surfaceLight = Color(0xFFFFFFFF);
  static const surfaceVariantLight = Color(0xFFEDEDF2);
  static const outlineLight = Color(0xFFC4C4D4);

  // Neutrals dark
  static const backgroundDark = Color(0xFF121220);
  static const surfaceDark = Color(0xFF1A1A2E);
  static const surfaceVariantDark = Color(0xFF26263D);
  static const outlineDark = Color(0xFF3D3D5C);

  // Semantic
  static const error = Color(0xFFE53935);
  static const warning = Color(0xFFFFB300);
  static const success = Color(0xFF00C853);
  static const info = Color(0xFF00C2FF);

  // Text light
  static const textPrimaryLight = Color(0xFF1A1A2E);
  static const textSecondaryLight = Color(0xFF6B6B80);
  static const textDisabledLight = Color(0xFFB0B0C0);

  // Text dark
  static const textPrimaryDark = Color(0xFFF0F0F0);
  static const textSecondaryDark = Color(0xFFA0A0B0);
  static const textDisabledDark = Color(0xFF555565);
}
