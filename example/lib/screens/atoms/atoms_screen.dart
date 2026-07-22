import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_appbar.dart';
import 'avatars_section.dart';
import 'buttons_section.dart';
import 'chips_section.dart';
import 'circle_icon_buttons_section.dart';
import 'key_value_rows_section.dart';
import 'loaders_section.dart';
import 'status_badges_section.dart';
import 'status_icons_section.dart';
import 'steppers_section.dart';
import 'text_fields_section.dart';

class AtomsScreen extends StatelessWidget {
  const AtomsScreen({
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
        title: 'Atoms',
        themeMode: themeMode,
        onToggleTheme: onToggleTheme,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarsSection(),
            ButtonsSection(),
            TextFieldsSection(),
            ChipsSection(),
            StatusBadgesSection(),
            StatusIconsSection(),
            CircleIconButtonsSection(),
            SteppersSection(),
            KeyValueRowsSection(),
            LoadersSection(),
          ],
        ),
      ),
    );
  }
}
