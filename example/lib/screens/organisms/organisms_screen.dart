import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_appbar.dart';
import 'empty_states_section.dart';
import 'error_states_section.dart';
import 'multi_select_dropdowns_section.dart';
import 'ticket_cards_section.dart';

class OrganismsScreen extends StatelessWidget {
  const OrganismsScreen({
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
        title: 'Organisms',
        themeMode: themeMode,
        onToggleTheme: onToggleTheme,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmptyStatesSection(),
            ErrorStatesSection(),
            TicketCardsSection(),
            MultiSelectDropdownsSection(),
          ],
        ),
      ),
    );
  }
}
