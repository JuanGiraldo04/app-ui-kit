import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', () {
    test('primary palette', () {
      expect(AppColors.primary, const Color(0xFFFF6B00));
      expect(AppColors.primaryDark, const Color(0xFFCC5500));
      expect(AppColors.primaryContainer, const Color(0xFFFFDDBF));
      expect(AppColors.onPrimary, const Color(0xFFFFFFFF));
    });

    test('secondary palette', () {
      expect(AppColors.secondary, const Color(0xFF1A1A2E));
      expect(AppColors.secondaryContainer, const Color(0xFFD9D9E3));
      expect(AppColors.onSecondary, const Color(0xFFFFFFFF));
    });

    test('accent', () {
      expect(AppColors.accent, const Color(0xFF00C2FF));
    });

    test('neutrals light', () {
      expect(AppColors.backgroundLight, const Color(0xFFF5F5F5));
      expect(AppColors.surfaceLight, const Color(0xFFFFFFFF));
      expect(AppColors.surfaceVariantLight, const Color(0xFFEDEDF2));
      expect(AppColors.outlineLight, const Color(0xFFC4C4D4));
    });

    test('neutrals dark', () {
      expect(AppColors.backgroundDark, const Color(0xFF121220));
      expect(AppColors.surfaceDark, const Color(0xFF1A1A2E));
      expect(AppColors.surfaceVariantDark, const Color(0xFF26263D));
      expect(AppColors.outlineDark, const Color(0xFF3D3D5C));
    });

    test('semantic colors', () {
      expect(AppColors.error, const Color(0xFFE53935));
      expect(AppColors.warning, const Color(0xFFFFB300));
      expect(AppColors.success, const Color(0xFF00C853));
      expect(AppColors.info, const Color(0xFF00C2FF));
    });

    test('text colors light', () {
      expect(AppColors.textPrimaryLight, const Color(0xFF1A1A2E));
      expect(AppColors.textSecondaryLight, const Color(0xFF6B6B80));
      expect(AppColors.textDisabledLight, const Color(0xFFB0B0C0));
    });

    test('text colors dark', () {
      expect(AppColors.textPrimaryDark, const Color(0xFFF0F0F0));
      expect(AppColors.textSecondaryDark, const Color(0xFFA0A0B0));
      expect(AppColors.textDisabledDark, const Color(0xFF555565));
    });
  });
}
