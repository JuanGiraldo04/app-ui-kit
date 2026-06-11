import 'package:flutter/material.dart';

enum AppLoaderSize { small, medium, large }

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.size = AppLoaderSize.medium, this.color});

  final AppLoaderSize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dimension = switch (size) {
      AppLoaderSize.small => 16.0,
      AppLoaderSize.medium => 24.0,
      AppLoaderSize.large => 40.0,
    };

    final strokeWidth = switch (size) {
      AppLoaderSize.small => 2.0,
      AppLoaderSize.medium => 3.0,
      AppLoaderSize.large => 4.0,
    };

    return SizedBox(
      width: dimension,
      height: dimension,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
