import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppRadius', () {
    test('exposes the correct numeric values', () {
      expect(AppRadius.xs, 4);
      expect(AppRadius.sm, 8);
      expect(AppRadius.md, 12);
      expect(AppRadius.lg, 16);
      expect(AppRadius.xl, 24);
      expect(AppRadius.full, 999);
    });

    test('BorderRadius helpers return the matching circular radius', () {
      expect(AppRadius.xsBorderRadius, BorderRadius.circular(AppRadius.xs));
      expect(AppRadius.smBorderRadius, BorderRadius.circular(AppRadius.sm));
      expect(AppRadius.mdBorderRadius, BorderRadius.circular(AppRadius.md));
      expect(AppRadius.lgBorderRadius, BorderRadius.circular(AppRadius.lg));
      expect(AppRadius.xlBorderRadius, BorderRadius.circular(AppRadius.xl));
      expect(AppRadius.fullBorderRadius, BorderRadius.circular(AppRadius.full));
    });
  });
}
