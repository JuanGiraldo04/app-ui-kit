import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_section.dart';
import '../../widgets/showcase_subsection.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      title: 'Text Fields',
      description: 'Variantes y estados.',
      children: [
        ShowcaseSubSection(
          label: 'Normal',
          children: [
            const AppTextField(label: 'Nombre', hint: 'Escribe tu nombre'),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con iconos',
          children: [
            const AppTextField(
              label: 'Búsqueda',
              hint: 'Buscar...',
              leading: Icon(Icons.search),
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppTextField(
              label: 'Contraseña',
              leading: Icon(Icons.lock_outline),
              isPassword: true,
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Con helper',
          children: [
            const AppTextField(
              label: 'Correo',
              hint: 'correo@ejemplo.com',
              helperText: 'Nunca compartiremos tu correo.',
              leading: Icon(Icons.email_outlined),
            ),
          ],
        ),
        ShowcaseSubSection(
          label: 'Estados',
          children: [
            const AppTextField(
              label: 'Con error',
              hint: 'Escribe aquí',
              variant: AppTextFieldVariant.error,
              errorText: 'Este campo es requerido',
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppTextField(
              label: 'Deshabilitado',
              hint: 'No editable',
              variant: AppTextFieldVariant.disabled,
            ),
          ],
        ),
      ],
    );
  }
}
