import 'package:expense_tracker_app/core/theme/palette.dart';
import 'package:flutter/material.dart';

class Apptheme {
  final theme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: Palette.backgroundColor),
  );
}
