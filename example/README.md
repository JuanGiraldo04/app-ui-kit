# app_ui_kit — Showcase

App de ejemplo que documenta visualmente todos los componentes del paquete [`app_ui_kit`](../).

---

## Qué demuestra

- Tokens: colores, tipografía, espaciados y radios del sistema
- Atoms: botones, text fields, chips y loaders con todas sus variantes
- Molecules: cards y banners con todas sus variantes
- Organisms: empty states y error states listos para usar
- Tema claro y oscuro con toggle en tiempo real

---

## Cómo ejecutar

```bash
cd example
flutter pub get
flutter run
```

No requiere configuración adicional. El paquete apunta al directorio padre con `path: ../`.

---

## Estructura

```
lib/
├── main.dart                        # App + toggle de tema
├── screens/
│   ├── showcase_shell.dart          # Navegación principal
│   ├── home_screen.dart             # Resumen del sistema
│   ├── tokens/
│   │   ├── tokens_screen.dart
│   │   ├── colors_section.dart
│   │   ├── typography_section.dart
│   │   ├── spacing_section.dart
│   │   └── radius_section.dart
│   ├── atoms/
│   │   ├── atoms_screen.dart
│   │   ├── buttons_section.dart
│   │   ├── text_fields_section.dart
│   │   ├── chips_section.dart
│   │   └── loaders_section.dart
│   ├── molecules/
│   │   ├── molecules_screen.dart
│   │   ├── cards_section.dart
│   │   └── banners_section.dart
│   └── organisms/
│       ├── organisms_screen.dart
│       ├── empty_states_section.dart
│       └── error_states_section.dart
└── widgets/
    ├── showcase_appbar.dart         # AppBar con toggle de tema
    ├── showcase_section.dart        # Sección reutilizable
    └── subsection.dart              # Subsección reutilizable
```

---

## Nota

Esta app existe únicamente para documentar visualmente el sistema de diseño. No tiene lógica de negocio ni gestor de estado.