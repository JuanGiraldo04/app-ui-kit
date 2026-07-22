import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/showcase_appbar.dart';
import 'banners_section.dart';
import 'bottom_action_bars_section.dart';
import 'cards_section.dart';
import 'detail_hero_images_section.dart';
import 'list_item_cards_section.dart';
import 'media_cards_section.dart';
import 'meta_rows_section.dart';
import 'profile_header_cards_section.dart';
import 'progress_stats_section.dart';

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
          children: [
            CardsSection(),
            MediaCardsSection(),
            DetailHeroImagesSection(),
            MetaRowsSection(),
            ListItemCardsSection(),
            ProfileHeaderCardsSection(),
            ProgressStatsSection(),
            BannersSection(),
            BottomActionBarsSection(),
          ],
        ),
      ),
    );
  }
}
