import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Envuelve [widget] en un MaterialApp con [AppTheme.light], que instala la
/// extensión [AppSemanticColors] requerida por varios componentes
/// (AppStatusBadge, AppBanner, AppProgressStat, etc). Sin este wrapper esos
/// componentes lanzan porque `context.appSemanticColors` no encuentra la
/// extensión en un ThemeData por defecto.
Future<void> pumpApp(WidgetTester tester, Widget widget) {
  return tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: widget),
    ),
  );
}
