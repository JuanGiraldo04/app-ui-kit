import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import 'screens/showcase_shell.dart';

void main() => runApp(const ShowcaseApp());

class ShowcaseApp extends StatefulWidget {
  const ShowcaseApp({super.key});

  @override
  State<ShowcaseApp> createState() => _ShowcaseAppState();
}

class _ShowcaseAppState extends State<ShowcaseApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() => setState(() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App UI Kit Showcase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode,
      home: ShowcaseShell(themeMode: _themeMode, onToggleTheme: _toggleTheme),
    );
  }
}
