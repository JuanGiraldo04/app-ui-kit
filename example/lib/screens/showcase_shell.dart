import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'tokens/tokens_screen.dart';
import 'atoms/atoms_screen.dart';
import 'molecules/molecules_screen.dart';
import 'organisms/organisms_screen.dart';

class ShowcaseShell extends StatefulWidget {
  const ShowcaseShell({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  State<ShowcaseShell> createState() => _ShowcaseShellState();
}

class _ShowcaseShellState extends State<ShowcaseShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(
        onToggleTheme: widget.onToggleTheme,
        themeMode: widget.themeMode,
      ),
      TokensScreen(
        onToggleTheme: widget.onToggleTheme,
        themeMode: widget.themeMode,
      ),
      AtomsScreen(
        onToggleTheme: widget.onToggleTheme,
        themeMode: widget.themeMode,
      ),
      MoleculesScreen(
        onToggleTheme: widget.onToggleTheme,
        themeMode: widget.themeMode,
      ),
      OrganismsScreen(
        onToggleTheme: widget.onToggleTheme,
        themeMode: widget.themeMode,
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.palette_outlined),
            selectedIcon: Icon(Icons.palette),
            label: 'Tokens',
          ),
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets),
            label: 'Atoms',
          ),
          NavigationDestination(
            icon: Icon(Icons.view_module_outlined),
            selectedIcon: Icon(Icons.view_module),
            label: 'Molecules',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Organisms',
          ),
        ],
      ),
    );
  }
}
