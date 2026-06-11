import 'package:flutter/material.dart';

class ShowcaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShowcaseAppBar({
    super.key,
    required this.title,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final String title;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: onToggleTheme,
          icon: Icon(
            themeMode == ThemeMode.light
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
