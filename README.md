# app_ui_kit

Sistema de diseño para Flutter construido con tokens, tema claro/oscuro y componentes reutilizables organizados con Atomic Design.

---

## DEMO
https://www.loom.com/share/ca21fcf234234bfeada44577b7c673c3

---

## Características

- Tokens de color, tipografía, espaciado y radio
- Tema claro y oscuro con `AppTheme`
- Fuente Poppins integrada via `google_fonts`
- Componentes organizados por Atomic Design: atoms, molecules y organisms
- Soporte completo de Material 3
- App showcase incluida en `example/`

---

## Instalación

Agrega la dependencia en tu `pubspec.yaml` apuntando al repositorio de GitHub:

```yaml
dependencies:
  app_ui_kit:
    git:
      url: https://github.com/JuanGiraldo04/app-ui-kit.git
```

Luego ejecuta:

```bash
flutter pub get
```

---

## Configuración

Aplica el tema en tu `MaterialApp`:

```dart
import 'package:app_ui_kit/app_ui_kit.dart';

MaterialApp(
  theme: AppTheme.light(),
  darkTheme: AppTheme.dark(),
  themeMode: ThemeMode.system,
  home: const MyApp(),
)
```

---

## Tokens

### Colores

```dart
// Primario
AppColors.primary           // #6C63FF
AppColors.primaryContainer  // #E8E6FF
AppColors.onPrimary         // #FFFFFF

// Secundario
AppColors.secondary         // #03DAC6
AppColors.secondaryContainer
AppColors.onSecondary

// Semánticos
AppColors.error     // #E53935
AppColors.warning   // #FB8C00
AppColors.success   // #43A047
AppColors.info      // #1E88E5

// Neutros (light / dark)
AppColors.backgroundLight   AppColors.backgroundDark
AppColors.surfaceLight      AppColors.surfaceDark
AppColors.surfaceVariantLight  AppColors.surfaceVariantDark
AppColors.outlineLight      AppColors.outlineDark

// Texto (light / dark)
AppColors.textPrimaryLight    AppColors.textPrimaryDark
AppColors.textSecondaryLight  AppColors.textSecondaryDark
AppColors.textDisabledLight   AppColors.textDisabledDark
```

### Espaciado

```dart
AppSpacing.xs    // 4
AppSpacing.sm    // 8
AppSpacing.md    // 12
AppSpacing.lg    // 16
AppSpacing.xl    // 24
AppSpacing.xxl   // 32
AppSpacing.xxxl  // 48
```

### Radio

```dart
AppRadius.xs    // 4
AppRadius.sm    // 8
AppRadius.md    // 12
AppRadius.lg    // 16
AppRadius.xl    // 24
AppRadius.full  // 999

// BorderRadius helpers
AppRadius.mdBorderRadius
AppRadius.lgBorderRadius
// ...
```

### Tipografía

```dart
AppTypography.displayLarge
AppTypography.headlineMedium
AppTypography.titleLarge
AppTypography.bodyMedium
AppTypography.labelSmall
// ... todos los estilos de Material 3
```

---

## Componentes

### Atoms

#### AppButton

```dart
AppButton(
  label: 'Confirmar',
  onPressed: () {},
  variant: AppButtonVariant.primary,   // primary | secondary | outlined | ghost
  size: AppButtonSize.medium,          // small | medium | large
  leading: const Icon(Icons.check),
  isLoading: false,
  isFullWidth: false,
)
```

#### AppTextField

```dart
AppTextField(
  label: 'Correo',
  hint: 'correo@ejemplo.com',
  helperText: 'Nunca compartiremos tu correo.',
  errorText: 'Campo requerido',
  variant: AppTextFieldVariant.normal,  // normal | error | disabled
  leading: const Icon(Icons.email_outlined),
  trailing: const Icon(Icons.visibility_off),
  obscureText: false,
  onChanged: (value) {},
)
```

#### AppChip

```dart
AppChip(
  label: 'Flutter',
  variant: AppChipVariant.filled,   // filled | outlined
  isSelected: true,
  leading: const Icon(Icons.code, size: 14),
  onTap: () {},
  onDeleted: () {},
)
```

#### AppLoader

```dart
AppLoader(
  size: AppLoaderSize.medium,   // small | medium | large
  color: AppColors.primary,
)
```

---

### Molecules

#### AppCard

```dart
AppCard(
  variant: AppCardVariant.outlined,  // elevated | outlined | filled
  onTap: () {},
  child: Text('Contenido'),
)
```

#### AppBanner

```dart
AppBanner(
  variant: AppBannerVariant.success,  // info | success | warning | error
  title: 'Éxito',
  message: 'La operación se completó correctamente.',
  onDismiss: () {},
)
```

---

### Organisms

#### AppEmptyState

```dart
AppEmptyState(
  variant: AppEmptyStateVariant.search,  // generic | search | error | network
  title: 'Sin resultados',
  message: 'No encontramos lo que buscas.',
  actionLabel: 'Limpiar búsqueda',
  action: () {},
)
```

#### AppErrorState

```dart
AppErrorState(
  title: 'Sin conexión',
  message: 'Verifica tu conexión e intenta de nuevo.',
  onRetry: () {},
  retryLabel: 'Reintentar',
)
```

---

## Estructura del paquete

```
lib/
├── app_ui_kit.dart              # Barrel público
└── src/
    ├── tokens/
    │   ├── app_colors.dart
    │   ├── app_typography.dart
    │   ├── app_spacing.dart
    │   ├── app_radius.dart
    │   └── tokens.dart
    ├── theme/
    │   └── app_theme.dart
    └── components/
        ├── atoms/
        │   ├── app_button.dart
        │   ├── app_text_field.dart
        │   ├── app_chip.dart
        │   ├── app_loader.dart
        │   └── atoms.dart
        ├── molecules/
        │   ├── app_card.dart
        │   ├── app_banner.dart
        │   └── molecules.dart
        └── organisms/
            ├── app_empty_state.dart
            ├── app_error_state.dart
            └── organisms.dart
```

---

## Ejecutar el showcase

```bash
cd example
flutter pub get
flutter run
```

El showcase organiza los componentes por categorías: Tokens, Atoms, Molecules y Organisms. Incluye toggle de tema claro/oscuro para visualizar ambos modos.

---

## Dependencias

| Paquete | Versión | Uso |
|---|---|---|
| google_fonts | ^8.1.0 | Fuente Poppins |

---

## Conexión con otros paquetes

Este paquete es consumido por la app (fase 5) para mantener consistencia visual en todos los flujos de usuario.

---

## Licencia

MIT