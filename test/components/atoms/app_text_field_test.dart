import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppTextField', () {
    testWidgets('renders label and hint', (tester) async {
      await pumpApp(
        tester,
        const AppTextField(label: 'Correo', hint: 'tu@correo.com'),
      );

      expect(find.text('Correo'), findsOneWidget);
      expect(find.text('tu@correo.com'), findsOneWidget);
    });

    testWidgets('shows errorText when variant is error', (tester) async {
      await pumpApp(
        tester,
        const AppTextField(
          label: 'Correo',
          variant: AppTextFieldVariant.error,
          errorText: 'Correo inválido',
        ),
      );

      expect(find.text('Correo inválido'), findsOneWidget);
    });

    testWidgets('does not show errorText for other variants', (tester) async {
      await pumpApp(
        tester,
        const AppTextField(label: 'Correo', errorText: 'Correo inválido'),
      );

      expect(find.text('Correo inválido'), findsNothing);
    });

    testWidgets('is disabled when variant is disabled', (tester) async {
      await pumpApp(
        tester,
        const AppTextField(
          label: 'Correo',
          variant: AppTextFieldVariant.disabled,
        ),
      );

      final field = tester.widget<TextField>(find.byType(TextField));
      expect(field.enabled, isFalse);
    });

    testWidgets('isPassword obscures the text and the toggle reveals it', (
      tester,
    ) async {
      await pumpApp(
        tester,
        const AppTextField(label: 'Contraseña', isPassword: true),
      );

      TextField field = tester.widget<TextField>(find.byType(TextField));
      expect(field.obscureText, isTrue);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      field = tester.widget<TextField>(find.byType(TextField));
      expect(field.obscureText, isFalse);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });
}
