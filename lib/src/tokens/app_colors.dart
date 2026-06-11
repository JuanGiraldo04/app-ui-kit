import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary
  static const primary = Color(0xFF6C63FF);
  static const primaryContainer = Color(0xFFE8E6FF);
  static const onPrimary = Color(0xFFFFFFFF);

  // Secondary
  static const secondary = Color(0xFF03DAC6);
  static const secondaryContainer = Color(0xFFCCFAF6);
  static const onSecondary = Color(0xFF000000);

  // Neutrals light
  static const backgroundLight = Color(0xFFF8F8FC);
  static const surfaceLight = Color(0xFFFFFFFF);
  static const surfaceVariantLight = Color(0xFFF0F0F5);
  static const outlineLight = Color(0xFFC4C4D4);

  // Neutrals dark
  static const backgroundDark = Color(0xFF121212);
  static const surfaceDark = Color(0xFF1E1E1E);
  static const surfaceVariantDark = Color(0xFF2C2C2C);
  static const outlineDark = Color(0xFF3D3D3D);

  // Semantic
  static const error = Color(0xFFE53935);
  static const warning = Color(0xFFFB8C00);
  static const success = Color(0xFF43A047);
  static const info = Color(0xFF1E88E5);

  // Text light
  static const textPrimaryLight = Color(0xFF1A1A2E);
  static const textSecondaryLight = Color(0xFF5C5C7A);
  static const textDisabledLight = Color(0xFFB0B0C0);

  // Text dark
  static const textPrimaryDark = Color(0xFFF0F0F0);
  static const textSecondaryDark = Color(0xFFA0A0B0);
  static const textDisabledDark = Color(0xFF555565);
}
