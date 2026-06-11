import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_appbar.dart';
import 'cards_section.dart';
import 'banners_section.dart';

class MoleculesScreen extends StatelessWidget {
  const MoleculesScreen({
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
        title: 'Molecules',
        themeMode: themeMode,
        onToggleTheme: onToggleTheme,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [CardsSection(), BannersSection()],
        ),
      ),
    );
  }
}
