import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_appbar.dart';
import 'colors_section.dart';
import 'typography_section.dart';
import 'spacing_section.dart';
import 'radius_section.dart';

class TokensScreen extends StatelessWidget {
  const TokensScreen({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowcaseAppBar(
        title: 'Tokens',
        themeMode: themeMode,
        onToggleTheme: onToggleTheme,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColorsSection(),
            TypographySection(),
            SpacingSection(),
            RadiusSection(),
          ],
        ),
      ),
    );
  }
}
